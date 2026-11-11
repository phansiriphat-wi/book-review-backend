package store

import (
	"context"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"
)

type Book struct {
	ID             int64      `json:"id"`
	OpenLibraryKey *string    `json:"openlibraryKey"`
	Title          string     `json:"title"`
	Author         string     `json:"author"`
	Description    *string    `json:"description"`
	Category       string     `json:"category"`
	CoverURL       *string    `json:"coverUrl"`
	PublishedYear  *int       `json:"publishedYear"`
	AvgRating      *float64   `json:"avgRating"` // null = ยังไม่มีรีวิว
	ReviewCount    int64      `json:"reviewCount"`
	CreatedAt      time.Time  `json:"createdAt"`
	AddedAt        *time.Time `json:"addedAt,omitempty"` // มีเฉพาะใน GET /api/wishlist
}

// BookInput คือ body ของ POST/PUT /api/books และข้อมูลที่ได้จาก Open Library ตอนนำเข้า
type BookInput struct {
	OpenLibraryKey *string `json:"openlibraryKey"`
	Title          string  `json:"title"`
	Author         string  `json:"author"`
	Description    *string `json:"description"`
	Category       string  `json:"category"`
	CoverURL       *string `json:"coverUrl"`
	PublishedYear  *int    `json:"publishedYear"`
}

type Category struct {
	Name      string  `json:"name"`
	NameTh    string  `json:"nameTh"`
	OLSubject *string `json:"olSubject"` // null = ไม่มีหมวดนี้ใน Open Library (General)
}

type Impact struct {
	Reviews   int64 `json:"reviews"`
	Wishlists int64 `json:"wishlists"`
}

type Rating struct {
	OpenLibraryKey string   `json:"openlibraryKey"`
	BookID         int64    `json:"bookId"`
	AvgRating      *float64 `json:"avgRating"`
	ReviewCount    int64    `json:"reviewCount"`
}

// คอลัมน์ที่ทุก query ของหนังสือใช้ร่วมกัน (ลำดับต้องตรงกับ scanBook)
const bookCols = `b.id, b.openlibrary_key, b.title, b.author, b.description, b.category, b.cover_url,
       b.published_year, s.avg_rating::float8, COALESCE(s.review_count, 0), b.created_at`

const bookFrom = ` FROM books b LEFT JOIN book_rating_stats s ON s.book_id = b.id `

func bookDest(b *Book, extra ...any) []any {
	return append([]any{&b.ID, &b.OpenLibraryKey, &b.Title, &b.Author, &b.Description, &b.Category,
		&b.CoverURL, &b.PublishedYear, &b.AvgRating, &b.ReviewCount, &b.CreatedAt}, extra...)
}

type BookQuery struct {
	Q        string
	Category string
	Sort     string // "newest" (ค่าเริ่มต้น) | "rating" | "title"
	Page     int
	PageSize int
}

// ListBooks ค้นจากชื่อหรือผู้แต่ง กรองหมวด แบ่งหน้า  ค่าจากผู้ใช้ส่งผ่าน $1..$4 เสมอ
func (s *Store) ListBooks(ctx context.Context, q BookQuery) (Page[Book], error) {
	order := "b.created_at DESC, b.id DESC"
	switch q.Sort {
	case "rating":
		order = "s.avg_rating DESC NULLS LAST, s.review_count DESC NULLS LAST, b.id DESC"
	case "title":
		order = "lower(b.title), b.id"
	}
	page := Page[Book]{Items: []Book{}, Page: q.Page, PageSize: q.PageSize}
	rows, err := s.Pool.Query(ctx,
		`SELECT `+bookCols+`, count(*) OVER ()`+bookFrom+`
		 WHERE ($1 = '' OR b.title ILIKE $2 OR b.author ILIKE $2)
		   AND ($3 = '' OR b.category = $3)
		 ORDER BY `+order+`
		 LIMIT $4 OFFSET $5`,
		q.Q, likePattern(q.Q), q.Category, q.PageSize, (q.Page-1)*q.PageSize)
	if err != nil {
		return page, err
	}
	defer rows.Close()
	for rows.Next() {
		var b Book
		if err := rows.Scan(bookDest(&b, &page.Total)...); err != nil {
			return page, err
		}
		page.Items = append(page.Items, b)
	}
	if err := rows.Err(); err != nil {
		return page, err
	}
	if len(page.Items) == 0 && q.Page > 1 { // หน้าเกินจำนวนจริง ยังต้องรู้ total
		err = s.Pool.QueryRow(ctx,
			`SELECT count(*) FROM books b
			 WHERE ($1 = '' OR b.title ILIKE $2 OR b.author ILIKE $2) AND ($3 = '' OR b.category = $3)`,
			q.Q, likePattern(q.Q), q.Category).Scan(&page.Total)
	}
	return page, err
}

func (s *Store) GetBook(ctx context.Context, id int64) (Book, error) {
	var b Book
	err := s.Pool.QueryRow(ctx, `SELECT `+bookCols+bookFrom+`WHERE b.id = $1`, id).Scan(bookDest(&b)...)
	if errors.Is(err, pgx.ErrNoRows) {
		return b, ErrNotFound
	}
	return b, err
}

func (s *Store) GetBookByKey(ctx context.Context, key string) (Book, error) {
	var b Book
	err := s.Pool.QueryRow(ctx, `SELECT `+bookCols+bookFrom+`WHERE b.openlibrary_key = $1`, key).Scan(bookDest(&b)...)
	if errors.Is(err, pgx.ErrNoRows) {
		return b, ErrNotFound
	}
	return b, err
}

// BookIDByKey หาเลขในระบบจากรหัส Open Library (ไม่พบ = ErrNotFound)
func (s *Store) BookIDByKey(ctx context.Context, key string) (int64, error) {
	var id int64
	err := s.Pool.QueryRow(ctx, `SELECT id FROM books WHERE openlibrary_key = $1`, key).Scan(&id)
	if errors.Is(err, pgx.ErrNoRows) {
		return 0, ErrNotFound
	}
	return id, err
}

func mapBookWriteErr(err error) error {
	switch code, _ := pgCode(err); code {
	case "23505":
		return ErrDuplicate
	case "23503":
		return ErrBadCategory
	}
	return err
}

func (s *Store) CreateBook(ctx context.Context, in BookInput) (Book, error) {
	var id int64
	err := s.Pool.QueryRow(ctx,
		`INSERT INTO books (openlibrary_key, title, author, description, category, cover_url, published_year)
		 VALUES ($1, $2, $3, $4, $5, $6, $7)
		 RETURNING id`,
		in.OpenLibraryKey, in.Title, in.Author, in.Description, in.Category, in.CoverURL, in.PublishedYear).Scan(&id)
	if err != nil {
		return Book{}, mapBookWriteErr(err)
	}
	return s.GetBook(ctx, id)
}

func (s *Store) UpdateBook(ctx context.Context, id int64, in BookInput) (Book, error) {
	var got int64
	err := s.Pool.QueryRow(ctx,
		`UPDATE books SET openlibrary_key = $2, title = $3, author = $4, description = $5,
		        category = $6, cover_url = $7, published_year = $8, updated_at = now()
		 WHERE id = $1
		 RETURNING id`,
		id, in.OpenLibraryKey, in.Title, in.Author, in.Description, in.Category, in.CoverURL, in.PublishedYear).Scan(&got)
	if errors.Is(err, pgx.ErrNoRows) {
		return Book{}, ErrNotFound
	}
	if err != nil {
		return Book{}, mapBookWriteErr(err)
	}
	return s.GetBook(ctx, id)
}

// DeleteBook ลบหนังสือ รีวิวและ wishlist ของเล่มนี้หายตาม (ON DELETE CASCADE)
func (s *Store) DeleteBook(ctx context.Context, id int64) error {
	tag, err := s.Pool.Exec(ctx, `DELETE FROM books WHERE id = $1`, id)
	if err != nil {
		return err
	}
	if tag.RowsAffected() == 0 {
		return ErrNotFound
	}
	return nil
}

// EnsureBook บันทึกหนังสือจาก Open Library ถ้ายังไม่มี แล้วคืนเลขในระบบ
// ON CONFLICT ทำให้กดพร้อมกันหลายคนก็ได้แถวเดียว (unique ที่ openlibrary_key)
func (s *Store) EnsureBook(ctx context.Context, in BookInput) (int64, error) {
	var id int64
	err := s.Pool.QueryRow(ctx,
		`INSERT INTO books (openlibrary_key, title, author, description, category, cover_url, published_year)
		 VALUES ($1, $2, $3, $4, $5, $6, $7)
		 ON CONFLICT (openlibrary_key) DO NOTHING
		 RETURNING id`,
		in.OpenLibraryKey, in.Title, in.Author, in.Description, in.Category, in.CoverURL, in.PublishedYear).Scan(&id)
	if errors.Is(err, pgx.ErrNoRows) { // มีคนบันทึกไว้ก่อนแล้ว
		return s.BookIDByKey(ctx, *in.OpenLibraryKey)
	}
	if err != nil {
		return 0, mapBookWriteErr(err)
	}
	return id, nil
}

// BookImpact นับสิ่งที่จะหายไปถ้าลบหนังสือเล่มนี้ ให้กล่องยืนยันของ admin แสดง
func (s *Store) BookImpact(ctx context.Context, id int64) (Impact, error) {
	var im Impact
	err := s.Pool.QueryRow(ctx,
		`SELECT (SELECT count(*) FROM reviews WHERE book_id = $1),
		        (SELECT count(*) FROM wishlists WHERE book_id = $1)`, id).Scan(&im.Reviews, &im.Wishlists)
	return im, err
}

// RatingsByKeys คะแนนเฉลี่ยของหนังสือ Open Library หลายเล่มในคำขอเดียว (การ์ดในหน้า Books)
func (s *Store) RatingsByKeys(ctx context.Context, keys []string) ([]Rating, error) {
	rows, err := s.Pool.Query(ctx,
		`SELECT b.openlibrary_key, b.id, s.avg_rating::float8, COALESCE(s.review_count, 0)
		 FROM books b LEFT JOIN book_rating_stats s ON s.book_id = b.id
		 WHERE b.openlibrary_key = ANY($1)`, keys)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := []Rating{}
	for rows.Next() {
		var r Rating
		if err := rows.Scan(&r.OpenLibraryKey, &r.BookID, &r.AvgRating, &r.ReviewCount); err != nil {
			return nil, err
		}
		out = append(out, r)
	}
	return out, rows.Err()
}

func (s *Store) ListCategories(ctx context.Context) ([]Category, error) {
	rows, err := s.Pool.Query(ctx, `SELECT name, name_th, ol_subject FROM categories ORDER BY position`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := []Category{}
	for rows.Next() {
		var c Category
		if err := rows.Scan(&c.Name, &c.NameTh, &c.OLSubject); err != nil {
			return nil, err
		}
		out = append(out, c)
	}
	return out, rows.Err()
}

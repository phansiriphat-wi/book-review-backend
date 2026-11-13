package store

import (
	"context"
	"time"

	"github.com/jackc/pgx/v5"
)

type ReviewUser struct {
	ID   int64  `json:"id"`
	Name string `json:"name"`
}

type ReviewBook struct {
	ID             int64   `json:"id"`
	Title          string  `json:"title"`
	OpenLibraryKey *string `json:"openlibraryKey"`
	CoverURL       *string `json:"coverUrl"`
}

type Review struct {
	ID        int64       `json:"id"`
	UserID    int64       `json:"userId"`
	BookID    int64       `json:"bookId"`
	Rating    int         `json:"rating"`
	Comment   string      `json:"comment"`
	CreatedAt time.Time   `json:"createdAt"`
	UpdatedAt time.Time   `json:"updatedAt"`
	User      ReviewUser  `json:"user"`
	Book      *ReviewBook `json:"book,omitempty"` // มีใน GET /api/admin/reviews และ GET /api/me/reviews
}

type ReviewSummary struct {
	AvgRating   *float64 `json:"avgRating"`
	ReviewCount int64    `json:"reviewCount"`
}

func scanReviews(rows pgx.Rows, withBook bool) ([]Review, error) {
	defer rows.Close()
	out := []Review{}
	for rows.Next() {
		var r Review
		dest := []any{&r.ID, &r.UserID, &r.BookID, &r.Rating, &r.Comment, &r.CreatedAt, &r.UpdatedAt, &r.User.Name}
		var b ReviewBook
		if withBook {
			dest = append(dest, &b.Title, &b.OpenLibraryKey, &b.CoverURL)
		}
		if err := rows.Scan(dest...); err != nil {
			return nil, err
		}
		r.User.ID = r.UserID
		if withBook {
			b.ID = r.BookID
			r.Book = &b
		}
		out = append(out, r)
	}
	return out, rows.Err()
}

// ListReviews รีวิวของหนังสือ 1 เล่ม ใหม่สุดก่อน
func (s *Store) ListReviews(ctx context.Context, bookID int64) ([]Review, error) {
	rows, err := s.Pool.Query(ctx,
		`SELECT r.id, r.user_id, r.book_id, r.rating, r.comment, r.created_at, r.updated_at, u.name
		 FROM reviews r JOIN users u ON u.id = r.user_id
		 WHERE r.book_id = $1
		 ORDER BY r.created_at DESC, r.id DESC`, bookID)
	if err != nil {
		return nil, err
	}
	return scanReviews(rows, false)
}

func (s *Store) ReviewSummary(ctx context.Context, bookID int64) (ReviewSummary, error) {
	var sum ReviewSummary
	err := s.Pool.QueryRow(ctx,
		`SELECT round(avg(rating), 1)::float8, count(*) FROM reviews WHERE book_id = $1`, bookID).
		Scan(&sum.AvgRating, &sum.ReviewCount)
	return sum, err
}

func (s *Store) getReview(ctx context.Context, id int64) (Review, error) {
	rows, err := s.Pool.Query(ctx,
		`SELECT r.id, r.user_id, r.book_id, r.rating, r.comment, r.created_at, r.updated_at, u.name
		 FROM reviews r JOIN users u ON u.id = r.user_id WHERE r.id = $1`, id)
	if err != nil {
		return Review{}, err
	}
	list, err := scanReviews(rows, false)
	if err != nil {
		return Review{}, err
	}
	if len(list) == 0 {
		return Review{}, ErrNotFound
	}
	return list[0], nil
}

// CreateReview รีวิวซ้ำ (คนเดิม เล่มเดิม) ได้ ErrDuplicate, หนังสือไม่มีได้ ErrNotFound
func (s *Store) CreateReview(ctx context.Context, userID, bookID int64, rating int, comment string) (Review, error) {
	var id int64
	err := s.Pool.QueryRow(ctx,
		`INSERT INTO reviews (user_id, book_id, rating, comment) VALUES ($1, $2, $3, $4) RETURNING id`,
		userID, bookID, rating, comment).Scan(&id)
	switch code, _ := pgCode(err); code {
	case "23505":
		return Review{}, ErrDuplicate
	case "23503":
		return Review{}, ErrNotFound
	}
	if err != nil {
		return Review{}, err
	}
	return s.getReview(ctx, id)
}

// UpdateReview แก้ได้เฉพาะรีวิวของตัวเอง เงื่อนไข user_id อยู่ใน SQL  ไม่ใช่ของตัวเองหรือไม่มี = ErrNotFound
func (s *Store) UpdateReview(ctx context.Context, id, userID int64, rating int, comment string) (Review, error) {
	tag, err := s.Pool.Exec(ctx,
		`UPDATE reviews SET rating = $3, comment = $4, updated_at = now()
		 WHERE id = $1 AND user_id = $2`, id, userID, rating, comment)
	if err != nil {
		return Review{}, err
	}
	if tag.RowsAffected() == 0 {
		return Review{}, ErrNotFound
	}
	return s.getReview(ctx, id)
}

// DeleteReview เจ้าของลบของตัวเองได้ admin (any = true) ลบได้ทุกรีวิว
func (s *Store) DeleteReview(ctx context.Context, id, userID int64, any bool) error {
	tag, err := s.Pool.Exec(ctx,
		`DELETE FROM reviews WHERE id = $1 AND ($3 OR user_id = $2)`, id, userID, any)
	if err != nil {
		return err
	}
	if tag.RowsAffected() == 0 {
		return ErrNotFound
	}
	return nil
}

// ListAllReviews สำหรับ admin: ค้นจากข้อความรีวิว ชื่อหนังสือ หรือชื่อผู้รีวิว แบ่งหน้า
func (s *Store) ListAllReviews(ctx context.Context, q string, page, size int) (Page[Review], error) {
	out := Page[Review]{Items: []Review{}, Page: page, PageSize: size}
	err := s.Pool.QueryRow(ctx,
		`SELECT count(*) FROM reviews r JOIN users u ON u.id = r.user_id JOIN books b ON b.id = r.book_id
		 WHERE $1 = '' OR r.comment ILIKE $2 OR b.title ILIKE $2 OR u.name ILIKE $2`,
		q, likePattern(q)).Scan(&out.Total)
	if err != nil {
		return out, err
	}
	rows, err := s.Pool.Query(ctx,
		`SELECT r.id, r.user_id, r.book_id, r.rating, r.comment, r.created_at, r.updated_at, u.name,
		        b.title, b.openlibrary_key, b.cover_url
		 FROM reviews r JOIN users u ON u.id = r.user_id JOIN books b ON b.id = r.book_id
		 WHERE $1 = '' OR r.comment ILIKE $2 OR b.title ILIKE $2 OR u.name ILIKE $2
		 ORDER BY r.created_at DESC, r.id DESC
		 LIMIT $3 OFFSET $4`, q, likePattern(q), size, (page-1)*size)
	if err != nil {
		return out, err
	}
	out.Items, err = scanReviews(rows, true)
	return out, err
}

// UserReviewPage คือรีวิวของผู้ใช้ 1 คน แบบแบ่งหน้า พร้อมคะแนนเฉลี่ยที่คนนั้นให้ (ทุกรีวิว ไม่ใช่เฉพาะหน้านี้)
type UserReviewPage struct {
	Page[Review]
	AvgRating *float64 `json:"avgRating"`
}

// ListUserReviews รีวิวของคนที่ถือตั๋ว ใหม่สุดก่อน พร้อมชื่อและปกหนังสือ (GET /api/me/reviews)
func (s *Store) ListUserReviews(ctx context.Context, userID int64, page, size int) (UserReviewPage, error) {
	out := UserReviewPage{Page: Page[Review]{Items: []Review{}, Page: page, PageSize: size}}
	err := s.Pool.QueryRow(ctx,
		`SELECT count(*), round(avg(rating), 1)::float8 FROM reviews WHERE user_id = $1`, userID).
		Scan(&out.Total, &out.AvgRating)
	if err != nil {
		return out, err
	}
	rows, err := s.Pool.Query(ctx,
		`SELECT r.id, r.user_id, r.book_id, r.rating, r.comment, r.created_at, r.updated_at, u.name,
		        b.title, b.openlibrary_key, b.cover_url
		 FROM reviews r JOIN users u ON u.id = r.user_id JOIN books b ON b.id = r.book_id
		 WHERE r.user_id = $1
		 ORDER BY r.created_at DESC, r.id DESC
		 LIMIT $2 OFFSET $3`, userID, size, (page-1)*size)
	if err != nil {
		return out, err
	}
	out.Items, err = scanReviews(rows, true)
	return out, err
}

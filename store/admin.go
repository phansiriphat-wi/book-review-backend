package store

import "context"

type TopBook struct {
	ID             int64   `json:"id"`
	OpenLibraryKey *string `json:"openlibraryKey"`
	Title          string  `json:"title"`
	Author         string  `json:"author"`
	CoverURL       *string `json:"coverUrl"`
	AvgRating      float64 `json:"avgRating"`
	ReviewCount    int64   `json:"reviewCount"`
}

type CategoryCount struct {
	Category string `json:"category"`
	Books    int64  `json:"books"`
}

type Stats struct {
	Books           int64           `json:"books"`
	Users           int64           `json:"users"`
	Admins          int64           `json:"admins"`
	Reviews         int64           `json:"reviews"`
	Wishlists       int64           `json:"wishlists"`
	AvgRating       *float64        `json:"avgRating"`
	BooksByCategory []CategoryCount `json:"booksByCategory"`
	TopRated        []TopBook       `json:"topRated"`
	NewestUsers     []User          `json:"newestUsers"`
	LatestReviews   []Review        `json:"latestReviews"`
}

// Stats รวมตัวเลขของทั้งเว็บในคำขอเดียว ให้หน้า Dashboard ยิงครั้งเดียวจบ (แนวเดียวกับ MovieHub)
func (s *Store) Stats(ctx context.Context) (Stats, error) {
	var st Stats
	err := s.Pool.QueryRow(ctx,
		`SELECT (SELECT count(*) FROM books),
		        (SELECT count(*) FROM users),
		        (SELECT count(*) FROM users WHERE role = 'admin'),
		        (SELECT count(*) FROM reviews),
		        (SELECT count(*) FROM wishlists),
		        (SELECT round(avg(rating), 2)::float8 FROM reviews)`).
		Scan(&st.Books, &st.Users, &st.Admins, &st.Reviews, &st.Wishlists, &st.AvgRating)
	if err != nil {
		return st, err
	}

	rows, err := s.Pool.Query(ctx,
		`SELECT c.name, count(b.id) FROM categories c LEFT JOIN books b ON b.category = c.name
		 GROUP BY c.name, c.position ORDER BY c.position`)
	if err != nil {
		return st, err
	}
	st.BooksByCategory = []CategoryCount{}
	for rows.Next() {
		var c CategoryCount
		if err := rows.Scan(&c.Category, &c.Books); err != nil {
			rows.Close()
			return st, err
		}
		st.BooksByCategory = append(st.BooksByCategory, c)
	}
	rows.Close()
	if err := rows.Err(); err != nil {
		return st, err
	}

	rows, err = s.Pool.Query(ctx,
		`SELECT b.id, b.openlibrary_key, b.title, b.author, b.cover_url, s.avg_rating::float8, s.review_count
		 FROM book_rating_stats s JOIN books b ON b.id = s.book_id
		 ORDER BY s.avg_rating DESC, s.review_count DESC, b.id
		 LIMIT 5`)
	if err != nil {
		return st, err
	}
	st.TopRated = []TopBook{}
	for rows.Next() {
		var t TopBook
		if err := rows.Scan(&t.ID, &t.OpenLibraryKey, &t.Title, &t.Author, &t.CoverURL, &t.AvgRating, &t.ReviewCount); err != nil {
			rows.Close()
			return st, err
		}
		st.TopRated = append(st.TopRated, t)
	}
	rows.Close()
	if err := rows.Err(); err != nil {
		return st, err
	}

	rows, err = s.Pool.Query(ctx,
		`SELECT id, email, name, role, created_at FROM users ORDER BY created_at DESC, id DESC LIMIT 5`)
	if err != nil {
		return st, err
	}
	st.NewestUsers = []User{}
	for rows.Next() {
		var u User
		if err := rows.Scan(&u.ID, &u.Email, &u.Name, &u.Role, &u.CreatedAt); err != nil {
			rows.Close()
			return st, err
		}
		st.NewestUsers = append(st.NewestUsers, u)
	}
	rows.Close()
	if err := rows.Err(); err != nil {
		return st, err
	}

	latest, err := s.ListAllReviews(ctx, "", 1, 5)
	st.LatestReviews = latest.Items
	return st, err
}

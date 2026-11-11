package store

import "context"

// ListWishlist หนังสือในรายการอยากอ่านของผู้ใช้ รูปร่างเดียวกับ Book + addedAt (BookCard ใช้ได้เลย)
func (s *Store) ListWishlist(ctx context.Context, userID int64) ([]Book, error) {
	rows, err := s.Pool.Query(ctx,
		`SELECT `+bookCols+`, w.added_at
		 FROM wishlists w
		 JOIN books b ON b.id = w.book_id
		 LEFT JOIN book_rating_stats s ON s.book_id = b.id
		 WHERE w.user_id = $1
		 ORDER BY w.added_at DESC, w.id DESC`, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := []Book{}
	for rows.Next() {
		var b Book
		if err := rows.Scan(bookDest(&b, &b.AddedAt)...); err != nil {
			return nil, err
		}
		out = append(out, b)
	}
	return out, rows.Err()
}

// AddWishlist เพิ่มซ้ำกี่ครั้งก็ได้แถวเดียว (UNIQUE + ON CONFLICT DO NOTHING) หนังสือไม่มีได้ ErrNotFound
func (s *Store) AddWishlist(ctx context.Context, userID, bookID int64) error {
	_, err := s.Pool.Exec(ctx,
		`INSERT INTO wishlists (user_id, book_id) VALUES ($1, $2)
		 ON CONFLICT (user_id, book_id) DO NOTHING`, userID, bookID)
	if code, _ := pgCode(err); code == "23503" {
		return ErrNotFound
	}
	return err
}

// RemoveWishlist ลบเฉพาะของตัวเอง ไม่มีอยู่ในรายการ = ErrNotFound
func (s *Store) RemoveWishlist(ctx context.Context, userID, bookID int64) error {
	tag, err := s.Pool.Exec(ctx, `DELETE FROM wishlists WHERE user_id = $1 AND book_id = $2`, userID, bookID)
	if err != nil {
		return err
	}
	if tag.RowsAffected() == 0 {
		return ErrNotFound
	}
	return nil
}

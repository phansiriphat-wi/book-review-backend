package store

import (
	"context"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"
)

type User struct {
	ID            int64      `json:"id"`
	Name          string     `json:"name"`
	Email         string     `json:"email"`
	Role          string     `json:"role"`
	CreatedAt     *time.Time `json:"createdAt,omitempty"`
	ReviewCount   *int64     `json:"reviewCount,omitempty"`   // มีเฉพาะตอน admin ดูรายชื่อ
	WishlistCount *int64     `json:"wishlistCount,omitempty"` // มีเฉพาะตอน admin ดูรายชื่อ
	PasswordHash  string     `json:"-"`                       // ไม่มีวันออกไปกับ JSON
}

// CreateUser สมัครสมาชิกใหม่ role มาจาก DEFAULT 'member' ของตารางเสมอ (ไม่รับ role จากผู้ใช้)
func (s *Store) CreateUser(ctx context.Context, email, hash, name string) (User, error) {
	u := User{Email: email, Name: name}
	var created time.Time
	err := s.Pool.QueryRow(ctx,
		`INSERT INTO users (email, password_hash, name)
		 VALUES ($1, $2, $3)
		 RETURNING id, role, created_at`, email, hash, name).Scan(&u.ID, &u.Role, &created)
	if code, _ := pgCode(err); code == "23505" {
		return User{}, ErrEmailTaken
	}
	u.CreatedAt = &created
	return u, err
}

func (s *Store) UserByEmail(ctx context.Context, email string) (User, error) {
	var u User
	err := s.Pool.QueryRow(ctx,
		`SELECT id, email, name, role, password_hash
		 FROM users WHERE lower(email) = lower($1)`, email).
		Scan(&u.ID, &u.Email, &u.Name, &u.Role, &u.PasswordHash)
	if errors.Is(err, pgx.ErrNoRows) {
		return User{}, ErrNotFound
	}
	return u, err
}

// UserByID ใช้กับ GET /api/auth/me: เลขมาจากตั๋วที่ตรวจแล้ว
func (s *Store) UserByID(ctx context.Context, id int64) (User, error) {
	var u User
	err := s.Pool.QueryRow(ctx,
		`SELECT id, email, name, role, created_at FROM users WHERE id = $1`, id).
		Scan(&u.ID, &u.Email, &u.Name, &u.Role, &u.CreatedAt)
	if errors.Is(err, pgx.ErrNoRows) {
		return User{}, ErrNotFound
	}
	return u, err
}

// ListUsers รายชื่อทั้งหมดสำหรับ admin (ดูอย่างเดียว) เรียงคนใหม่ก่อน พร้อมจำนวนรีวิวและ wishlist
func (s *Store) ListUsers(ctx context.Context) ([]User, error) {
	rows, err := s.Pool.Query(ctx,
		`SELECT u.id, u.email, u.name, u.role, u.created_at,
		        (SELECT count(*) FROM reviews r   WHERE r.user_id = u.id),
		        (SELECT count(*) FROM wishlists w WHERE w.user_id = u.id)
		 FROM users u
		 ORDER BY u.created_at DESC, u.id DESC`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := []User{}
	for rows.Next() {
		var u User
		if err := rows.Scan(&u.ID, &u.Email, &u.Name, &u.Role, &u.CreatedAt, &u.ReviewCount, &u.WishlistCount); err != nil {
			return nil, err
		}
		out = append(out, u)
	}
	return out, rows.Err()
}

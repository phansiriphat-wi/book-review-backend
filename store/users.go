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
	ReviewCount   *int64     `json:"reviewCount,omitempty"`   // มีตอน admin ดูรายชื่อ และ GET /api/auth/me
	WishlistCount *int64     `json:"wishlistCount,omitempty"` // มีตอน admin ดูรายชื่อ และ GET /api/auth/me
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

// UserByID ใช้กับ GET /api/auth/me และหน้าโปรไฟล์: เลขมาจากตั๋วที่ตรวจแล้ว
// พร้อมจำนวนรีวิวและ wishlist ของคนนั้น (การ์ดสถิติในหน้าโปรไฟล์)
func (s *Store) UserByID(ctx context.Context, id int64) (User, error) {
	var u User
	err := s.Pool.QueryRow(ctx,
		`SELECT u.id, u.email, u.name, u.role, u.created_at,
		        (SELECT count(*) FROM reviews r   WHERE r.user_id = u.id),
		        (SELECT count(*) FROM wishlists w WHERE w.user_id = u.id)
		 FROM users u WHERE u.id = $1`, id).
		Scan(&u.ID, &u.Email, &u.Name, &u.Role, &u.CreatedAt, &u.ReviewCount, &u.WishlistCount)
	if errors.Is(err, pgx.ErrNoRows) {
		return User{}, ErrNotFound
	}
	return u, err
}

// UpdateUserName แก้ชื่อที่แสดงของคนที่ถือตั๋ว แก้ได้เฉพาะ name (อีเมล บทบาท และเลขผู้ใช้ไม่รับจากผู้ใช้)
func (s *Store) UpdateUserName(ctx context.Context, id int64, name string) error {
	tag, err := s.Pool.Exec(ctx,
		`UPDATE users SET name = $2, updated_at = now() WHERE id = $1`, id, name)
	if err != nil {
		return err
	}
	if tag.RowsAffected() == 0 {
		return ErrNotFound
	}
	return nil
}

// PasswordHashByID ใช้ตรวจรหัสผ่านปัจจุบันก่อนเปลี่ยน (คืนลายนิ้วมือ bcrypt ไม่มีวันส่งออกไปหน้าเว็บ)
func (s *Store) PasswordHashByID(ctx context.Context, id int64) (string, error) {
	var hash string
	err := s.Pool.QueryRow(ctx, `SELECT password_hash FROM users WHERE id = $1`, id).Scan(&hash)
	if errors.Is(err, pgx.ErrNoRows) {
		return "", ErrNotFound
	}
	return hash, err
}

// UpdatePasswordHash เปลี่ยนรหัสผ่าน: อัปเดตเฉพาะเมื่อลายนิ้วมือเดิมยังตรงกับที่ตรวจไป
// (กันกรณีเปลี่ยนรหัสพร้อมกันสองที่ แถวไม่ถูกแก้ = ErrNotFound)
func (s *Store) UpdatePasswordHash(ctx context.Context, id int64, oldHash, newHash string) error {
	tag, err := s.Pool.Exec(ctx,
		`UPDATE users SET password_hash = $3, updated_at = now() WHERE id = $1 AND password_hash = $2`,
		id, oldHash, newHash)
	if err != nil {
		return err
	}
	if tag.RowsAffected() == 0 {
		return ErrNotFound
	}
	return nil
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

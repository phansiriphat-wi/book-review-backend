package store

import (
	"context"
	"errors"
	"strings"

	"github.com/jackc/pgx/v5/pgconn"
	"github.com/jackc/pgx/v5/pgxpool"
)

var (
	ErrNotFound    = errors.New("not found")
	ErrEmailTaken  = errors.New("email taken")
	ErrDuplicate   = errors.New("duplicate")    // 23505 ที่ไม่ใช่อีเมล เช่น รีวิวซ้ำ หรือ openlibrary_key ซ้ำ
	ErrBadCategory = errors.New("bad category") // 23503 ที่ books.category
)

type Store struct {
	Pool *pgxpool.Pool
}

// Ping ใช้กับ GET /api/health ให้ Render รู้ว่าต่อฐานข้อมูลได้
func (s *Store) Ping(ctx context.Context) error {
	return s.Pool.Ping(ctx)
}

// pgCode คืนรหัส SQLSTATE ของ error จาก PostgreSQL (เช่น 23505) ถ้าไม่ใช่ error ของ DB คืน ""
func pgCode(err error) (code, constraint string) {
	var pgErr *pgconn.PgError
	if errors.As(err, &pgErr) {
		return pgErr.Code, pgErr.ConstraintName
	}
	return "", ""
}

// likePattern ทำให้คำค้นของผู้ใช้เป็นข้อความธรรมดาใน ILIKE (% และ _ ไม่กลายเป็น wildcard)
func likePattern(q string) string {
	r := strings.NewReplacer(`\`, `\\`, `%`, `\%`, `_`, `\_`)
	return "%" + r.Replace(q) + "%"
}

// Page คือผลแบบแบ่งหน้า หน้าเว็บใช้ total กับ pageSize คำนวณจำนวนหน้า
type Page[T any] struct {
	Items    []T `json:"items"`
	Total    int `json:"total"`
	Page     int `json:"page"`
	PageSize int `json:"pageSize"`
}

package handler

import (
	"net/url"
	"strings"
	"time"
	"unicode/utf8"

	"bookreview/openlibrary"
	"bookreview/store"
)

// trimPtr ตัดช่องว่างหัวท้าย และทำให้ช่องว่างเปล่ากลายเป็น NULL ในฐานข้อมูล (เหมือน week6-lab)
func trimPtr(p *string) *string {
	if p == nil {
		return nil
	}
	s := strings.TrimSpace(*p)
	if s == "" {
		return nil
	}
	return &s
}

// validateRegister ตรวจข้อมูลสมัครสมาชิก (กติกาเดียวกับ week6-lab ปรับ displayName เป็น name)
func validateRegister(email, password, name string) (code, message string) {
	switch {
	case !strings.Contains(email, "@") || strings.HasPrefix(email, "@") || len(email) > 255:
		return "BAD_EMAIL", "รูปแบบอีเมลไม่ถูกต้อง"
	case utf8.RuneCountInString(password) < 8 || len(password) > 72:
		return "BAD_PASSWORD", "รหัสผ่านต้องยาว 8 ตัวอักษรขึ้นไป และไม่เกิน 72 ไบต์"
	case name == "" || utf8.RuneCountInString(name) > 50:
		return "BAD_NAME", "ต้องมีชื่อ และยาวไม่เกิน 50 ตัวอักษร"
	}
	return "", ""
}

// validateBook ตรวจฝั่ง server ซ้ำอีกชั้น แม้ฟอร์ม React จะเช็กไปแล้ว เพราะ curl ไม่ผ่านฟอร์ม
func validateBook(in *store.BookInput) (code, message string) {
	in.Title = strings.TrimSpace(in.Title)
	in.Author = strings.TrimSpace(in.Author)
	in.Category = strings.TrimSpace(in.Category)
	in.Description = trimPtr(in.Description)
	in.CoverURL = trimPtr(in.CoverURL)
	in.OpenLibraryKey = trimPtr(in.OpenLibraryKey)

	switch {
	case in.Title == "" || utf8.RuneCountInString(in.Title) > 255:
		return "BAD_TITLE", "ต้องมีชื่อหนังสือ และยาวไม่เกิน 255 ตัวอักษร"
	case in.Author == "" || utf8.RuneCountInString(in.Author) > 255:
		return "BAD_AUTHOR", "ต้องมีชื่อผู้แต่ง และยาวไม่เกิน 255 ตัวอักษร"
	case in.Category == "" || utf8.RuneCountInString(in.Category) > 50:
		return "BAD_CATEGORY", "ต้องเลือกหมวดหมู่"
	case in.Description != nil && utf8.RuneCountInString(*in.Description) > 5000:
		return "BAD_DESCRIPTION", "เรื่องย่อยาวได้ไม่เกิน 5000 ตัวอักษร"
	}
	if in.CoverURL != nil {
		u, err := url.Parse(*in.CoverURL)
		if err != nil || u.Scheme != "https" || u.Host == "" || len(*in.CoverURL) > 500 {
			return "BAD_COVER_URL", "ลิงก์รูปปกต้องขึ้นต้นด้วย https:// และยาวไม่เกิน 500 ตัวอักษร"
		}
	}
	if in.PublishedYear != nil {
		if y := *in.PublishedYear; y < 1 || y > time.Now().Year()+1 {
			return "BAD_YEAR", "ปีที่พิมพ์ต้องอยู่ระหว่าง 1 ถึงปีหน้า"
		}
	}
	if in.OpenLibraryKey != nil && !openlibrary.KeyPattern.MatchString(*in.OpenLibraryKey) {
		return "BAD_OPENLIBRARY_KEY", "รหัส Open Library ต้องมีรูปแบบ OL12345W"
	}
	return "", ""
}

// validateReview: ดาว 1–5 และข้อความ 10–2000 ตัวอักษร (ตรงกับ CHECK ใน schema.sql และฟอร์มหน้าเว็บ)
func validateReview(rating int, comment *string) (code, message string) {
	*comment = strings.TrimSpace(*comment)
	switch n := utf8.RuneCountInString(*comment); {
	case rating < 1 || rating > 5:
		return "BAD_RATING", "ให้คะแนนได้ 1 ถึง 5 ดาว"
	case n < 10:
		return "COMMENT_TOO_SHORT", "รีวิวต้องยาวอย่างน้อย 10 ตัวอักษร"
	case n > 2000:
		return "COMMENT_TOO_LONG", "รีวิวยาวได้ไม่เกิน 2000 ตัวอักษร"
	}
	return "", ""
}

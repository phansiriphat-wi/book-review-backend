package handler

import (
	"context"
	"encoding/json"
	"errors"
	"log"
	"net/http"
	"strconv"
	"strings"
	"unicode/utf8"

	"bookreview/auth"
	"bookreview/openlibrary"
	"bookreview/store"
)

type Handler struct {
	Store   *store.Store
	Tickets *auth.Issuer
	OL      *openlibrary.Client
}

func writeJSON(w http.ResponseWriter, status int, v any) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	json.NewEncoder(w).Encode(v)
}

func writeError(w http.ResponseWriter, status int, code, message string) {
	writeJSON(w, status, map[string]any{
		"error": map[string]string{"code": code, "message": message},
	})
}

// internal จดรายละเอียดไว้ใน log ฝั่งเรา แต่บอกผู้ใช้แค่ว่าระบบขัดข้อง
func internal(w http.ResponseWriter, err error) {
	log.Printf("internal error: %v", err)
	writeError(w, http.StatusInternalServerError, "INTERNAL", "ระบบขัดข้อง ลองใหม่อีกครั้ง")
}

// decode อ่าน body JSON (ไม่เกิน 1 MB) ถ้าอ่านไม่ออกตอบ 400 ให้เลย
func decode(w http.ResponseWriter, r *http.Request, v any) bool {
	r.Body = http.MaxBytesReader(w, r.Body, 1<<20)
	if err := json.NewDecoder(r.Body).Decode(v); err != nil {
		writeError(w, http.StatusBadRequest, "BAD_JSON", "อ่านกล่อง JSON ไม่ออก")
		return false
	}
	return true
}

func pathID(r *http.Request, name string) (int64, bool) {
	id, err := strconv.ParseInt(r.PathValue(name), 10, 64)
	return id, err == nil && id > 0
}

// pageParams อ่าน ?page=&pageSize= ค่าเริ่มต้น 1 และ 12 สูงสุดหน้าละ 48
func pageParams(r *http.Request) (int, int) {
	page, err := strconv.Atoi(r.URL.Query().Get("page"))
	if err != nil || page < 1 {
		page = 1
	}
	if page > 10000 {
		page = 10000
	}
	size, err := strconv.Atoi(r.URL.Query().Get("pageSize"))
	if err != nil || size < 1 {
		size = 12
	}
	if size > 48 {
		size = 48
	}
	return page, size
}

// ---------- รหัสหนังสือ: เลขในระบบ หรือรหัส work ของ Open Library ----------
//
// ทุก endpoint ที่มี {id} ของหนังสือรับได้ 2 แบบ ทำให้หน้าเว็บใช้ลิงก์ /books/{ref} แบบเดียวกันทั้งระบบ
//   /api/books/15        หนังสือเลข 15 ในตาราง books
//   /api/books/OL27448W  หนังสือ Open Library (ถ้าเคยมีคนรีวิวหรือเพิ่ม wishlist แล้ว จะเป็นแถวเดียวกันในตาราง books)

type bookRef struct {
	ID  int64  // > 0 เมื่อเป็นเลขในระบบ
	Key string // ไม่ว่างเมื่อเป็นรหัส Open Library
}

func parseBookRef(s string) (bookRef, bool) {
	s = strings.TrimSpace(s)
	if openlibrary.KeyPattern.MatchString(s) {
		return bookRef{Key: s}, true
	}
	if id, err := strconv.ParseInt(s, 10, 64); err == nil && id > 0 {
		return bookRef{ID: id}, true
	}
	return bookRef{}, false
}

// resolveBook แปลง ref เป็นเลขในระบบ
// importMissing = true: หนังสือ Open Library ที่ยังไม่มีในตาราง ให้ดึงจาก Open Library แล้วบันทึกก่อน (ใช้ตอนรีวิว/เพิ่ม wishlist)
// ถ้าไม่สำเร็จจะเขียน error ตอบไปแล้ว และคืน ok = false
func (h *Handler) resolveBook(ctx context.Context, w http.ResponseWriter, ref bookRef, importMissing bool, categoryHint string) (int64, bool) {
	if ref.ID > 0 {
		return ref.ID, true
	}
	id, err := h.Store.BookIDByKey(ctx, ref.Key)
	if err == nil {
		return id, true
	}
	if !errors.Is(err, store.ErrNotFound) {
		internal(w, err)
		return 0, false
	}
	if !importMissing {
		writeError(w, http.StatusNotFound, "BOOK_NOT_FOUND", "ยังไม่มีหนังสือเล่มนี้ในระบบ")
		return 0, false
	}

	work, err := h.OL.Work(ctx, ref.Key)
	switch {
	case errors.Is(err, openlibrary.ErrNotFound):
		writeError(w, http.StatusNotFound, "BOOK_NOT_FOUND", "ไม่พบหนังสือเล่มนี้ใน Open Library")
		return 0, false
	case err != nil:
		log.Printf("openlibrary %s: %v", ref.Key, err)
		writeError(w, http.StatusBadGateway, "OPENLIBRARY_UNAVAILABLE", "ติดต่อ Open Library ไม่ได้ ลองใหม่อีกครั้ง")
		return 0, false
	}

	category, err := h.pickCategory(ctx, work, categoryHint)
	if err != nil {
		internal(w, err)
		return 0, false
	}
	title := work.Title
	if utf8.RuneCountInString(title) > 255 {
		title = string([]rune(title)[:255])
	}
	key := ref.Key
	id, err = h.Store.EnsureBook(ctx, store.BookInput{
		OpenLibraryKey: &key, Title: title, Author: work.AuthorText(), Description: work.Description,
		Category: category, CoverURL: work.CoverURL, PublishedYear: work.PublishedYear,
	})
	if err != nil {
		internal(w, err)
		return 0, false
	}
	return id, true
}

// pickCategory: หมวดจาก subjects ของ Open Library ก่อน, ไม่ได้ใช้หมวดที่หน้าเว็บบอกมา (ต้องมีจริง), สุดท้าย General
func (h *Handler) pickCategory(ctx context.Context, work openlibrary.Work, hint string) (string, error) {
	cats, err := h.Store.ListCategories(ctx)
	if err != nil {
		return "", err
	}
	subjects := map[string]string{}
	order := []string{}
	valid := map[string]bool{}
	for _, c := range cats {
		valid[c.Name] = true
		if c.OLSubject != nil {
			subjects[c.Name] = strings.ToLower(*c.OLSubject)
			order = append(order, c.Name)
		}
	}
	if name := work.MatchCategory(subjects, order); name != "" {
		return name, nil
	}
	if valid[hint] {
		return hint, nil
	}
	return "General", nil
}

// Health ให้ Render ตรวจว่า service พร้อมและต่อฐานข้อมูลได้
func (h *Handler) Health(w http.ResponseWriter, r *http.Request) {
	if err := h.Store.Ping(r.Context()); err != nil {
		log.Printf("health: %v", err)
		writeError(w, http.StatusServiceUnavailable, "DB_DOWN", "ต่อฐานข้อมูลไม่ได้")
		return
	}
	writeJSON(w, http.StatusOK, map[string]string{"status": "ok"})
}

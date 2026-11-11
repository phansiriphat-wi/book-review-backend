package handler

import (
	"errors"
	"net/http"
	"strings"
	"unicode/utf8"

	"bookreview/openlibrary"
	"bookreview/store"
)

func (h *Handler) Categories(w http.ResponseWriter, r *http.Request) {
	items, err := h.Store.ListCategories(r.Context())
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"items": items})
}

// ListBooks GET /api/books?q=&category=&sort=&page=&pageSize=  หนังสือในระบบ (สาธารณะ)
func (h *Handler) ListBooks(w http.ResponseWriter, r *http.Request) {
	q := strings.TrimSpace(r.URL.Query().Get("q"))
	category := strings.TrimSpace(r.URL.Query().Get("category"))
	if utf8.RuneCountInString(q) > 100 || utf8.RuneCountInString(category) > 50 {
		writeError(w, http.StatusBadRequest, "BAD_QUERY", "คำค้นยาวเกินไป")
		return
	}
	page, size := pageParams(r)
	result, err := h.Store.ListBooks(r.Context(), store.BookQuery{
		Q: q, Category: category, Sort: r.URL.Query().Get("sort"), Page: page, PageSize: size,
	})
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, result)
}

// GetBook GET /api/books/{id}  id เป็นเลขในระบบหรือรหัส Open Library
// หนังสือ Open Library ที่ยังไม่มีในตารางตอบ 404 BOOK_NOT_FOUND หน้าเว็บจึงไปอ่านจาก Open Library แทน
func (h *Handler) GetBook(w http.ResponseWriter, r *http.Request) {
	ref, ok := parseBookRef(r.PathValue("id"))
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "รหัสหนังสือต้องเป็นตัวเลขหรือรหัส Open Library (OL…W)")
		return
	}
	var b store.Book
	var err error
	if ref.ID > 0 {
		b, err = h.Store.GetBook(r.Context(), ref.ID)
	} else {
		b, err = h.Store.GetBookByKey(r.Context(), ref.Key)
	}
	if errors.Is(err, store.ErrNotFound) {
		writeError(w, http.StatusNotFound, "BOOK_NOT_FOUND", "ยังไม่มีหนังสือเล่มนี้ในระบบ")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, b)
}

// Ratings GET /api/books/ratings?keys=OL1W,OL2W  คะแนนเฉลี่ยของการ์ดหนังสือ Open Library ทั้งหน้าในคำขอเดียว
func (h *Handler) Ratings(w http.ResponseWriter, r *http.Request) {
	keys := []string{}
	for _, k := range strings.Split(r.URL.Query().Get("keys"), ",") {
		if k = strings.TrimSpace(k); openlibrary.KeyPattern.MatchString(k) && len(keys) < 60 {
			keys = append(keys, k)
		}
	}
	if len(keys) == 0 {
		writeJSON(w, http.StatusOK, map[string]any{"items": []store.Rating{}})
		return
	}
	items, err := h.Store.RatingsByKeys(r.Context(), keys)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"items": items})
}

// ---------- จัดการหนังสือ (admin: ครอบด้วย admin(...) ใน routes.go แล้ว) ----------

func writeBookErr(w http.ResponseWriter, err error) {
	switch {
	case errors.Is(err, store.ErrNotFound):
		writeError(w, http.StatusNotFound, "BOOK_NOT_FOUND", "ไม่พบหนังสือเล่มนี้")
	case errors.Is(err, store.ErrDuplicate):
		writeError(w, http.StatusConflict, "BOOK_EXISTS", "มีหนังสือรหัส Open Library นี้ในระบบแล้ว")
	case errors.Is(err, store.ErrBadCategory):
		writeError(w, http.StatusBadRequest, "BAD_CATEGORY", "ไม่มีหมวดหมู่นี้")
	default:
		internal(w, err)
	}
}

func (h *Handler) CreateBook(w http.ResponseWriter, r *http.Request) {
	var in store.BookInput
	if !decode(w, r, &in) {
		return
	}
	if code, msg := validateBook(&in); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	b, err := h.Store.CreateBook(r.Context(), in)
	if err != nil {
		writeBookErr(w, err)
		return
	}
	writeJSON(w, http.StatusCreated, b)
}

// adminBookID: แก้/ลบรับได้ทั้งเลขในระบบและรหัส Open Library (ต้องมีในตารางแล้ว)
func (h *Handler) adminBookID(w http.ResponseWriter, r *http.Request) (int64, bool) {
	ref, ok := parseBookRef(r.PathValue("id"))
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "รหัสหนังสือไม่ถูกต้อง")
		return 0, false
	}
	return h.resolveBook(r.Context(), w, ref, false, "")
}

func (h *Handler) UpdateBook(w http.ResponseWriter, r *http.Request) {
	id, ok := h.adminBookID(w, r)
	if !ok {
		return
	}
	var in store.BookInput
	if !decode(w, r, &in) {
		return
	}
	if code, msg := validateBook(&in); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	b, err := h.Store.UpdateBook(r.Context(), id, in)
	if err != nil {
		writeBookErr(w, err)
		return
	}
	writeJSON(w, http.StatusOK, b)
}

func (h *Handler) DeleteBook(w http.ResponseWriter, r *http.Request) {
	id, ok := h.adminBookID(w, r)
	if !ok {
		return
	}
	if err := h.Store.DeleteBook(r.Context(), id); err != nil {
		writeBookErr(w, err)
		return
	}
	w.WriteHeader(http.StatusNoContent) // ลบแล้ว ไม่มีอะไรให้ส่งกลับ
}

// AdminBook GET /api/admin/books/{id}  หนังสือ + จำนวนรีวิว/wishlist ที่จะหายถ้าลบ
func (h *Handler) AdminBook(w http.ResponseWriter, r *http.Request) {
	id, ok := h.adminBookID(w, r)
	if !ok {
		return
	}
	b, err := h.Store.GetBook(r.Context(), id)
	if err != nil {
		writeBookErr(w, err)
		return
	}
	im, err := h.Store.BookImpact(r.Context(), id)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"book": b, "impact": im})
}

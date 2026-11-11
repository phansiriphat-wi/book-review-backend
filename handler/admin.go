package handler

import (
	"net/http"
	"strings"
	"unicode/utf8"
)

// ทุก handler ในไฟล์นี้ถูกครอบด้วย RequireLogin + RequireRole("admin") ใน routes.go แล้ว
// จึงไม่ต้องเช็กบทบาทซ้ำในนี้

func (h *Handler) AdminStats(w http.ResponseWriter, r *http.Request) {
	st, err := h.Store.Stats(r.Context())
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, st)
}

// AdminUsers รายชื่อสมาชิก ดูอย่างเดียว (ไม่มีการเปลี่ยน role ตามโจทย์)
func (h *Handler) AdminUsers(w http.ResponseWriter, r *http.Request) {
	items, err := h.Store.ListUsers(r.Context())
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"items": items})
}

// AdminReviews GET /api/admin/reviews?q=&page=&pageSize=  รีวิวทั้งหมด ใหม่สุดก่อน
func (h *Handler) AdminReviews(w http.ResponseWriter, r *http.Request) {
	q := strings.TrimSpace(r.URL.Query().Get("q"))
	if utf8.RuneCountInString(q) > 100 {
		writeError(w, http.StatusBadRequest, "BAD_QUERY", "คำค้นยาวเกินไป")
		return
	}
	page, size := pageParams(r)
	result, err := h.Store.ListAllReviews(r.Context(), q, page, size)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, result)
}

package handler

import (
	"errors"
	"net/http"

	"bookreview/mw"
	"bookreview/store"
)

type reviewReq struct {
	Rating   int    `json:"rating"`
	Comment  string `json:"comment"`
	Category string `json:"category"` // ไม่บังคับ: หมวดที่ผู้ใช้เปิดดูอยู่ ใช้เมื่อจัดหมวดจาก Open Library ไม่ได้
}

// ListReviews GET /api/books/{id}/reviews  สาธารณะ
// หนังสือ Open Library ที่ยังไม่มีใครรีวิว (ยังไม่อยู่ในตาราง) ตอบรายการว่าง ไม่ใช่ 404
func (h *Handler) ListReviews(w http.ResponseWriter, r *http.Request) {
	ref, ok := parseBookRef(r.PathValue("id"))
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "รหัสหนังสือไม่ถูกต้อง")
		return
	}
	var bookID int64
	if ref.ID > 0 {
		if _, err := h.Store.GetBook(r.Context(), ref.ID); err != nil {
			writeBookErr(w, err)
			return
		}
		bookID = ref.ID
	} else {
		id, err := h.Store.BookIDByKey(r.Context(), ref.Key)
		if errors.Is(err, store.ErrNotFound) {
			writeJSON(w, http.StatusOK, map[string]any{"bookId": nil, "items": []store.Review{}, "avgRating": nil, "reviewCount": 0})
			return
		}
		if err != nil {
			internal(w, err)
			return
		}
		bookID = id
	}
	items, err := h.Store.ListReviews(r.Context(), bookID)
	if err != nil {
		internal(w, err)
		return
	}
	sum, err := h.Store.ReviewSummary(r.Context(), bookID)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"bookId": bookID, "items": items, "avgRating": sum.AvgRating, "reviewCount": sum.ReviewCount})
}

// CreateReview POST /api/books/{id}/reviews  ต้อง login
// ตรวจข้อมูลก่อน แล้วค่อยนำเข้าหนังสือจาก Open Library (ถ้ายังไม่มี) ข้อมูลผิดจะได้ไม่ไปยิง Open Library เปล่า ๆ
func (h *Handler) CreateReview(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	ref, ok := parseBookRef(r.PathValue("id"))
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "รหัสหนังสือไม่ถูกต้อง")
		return
	}
	var req reviewReq
	if !decode(w, r, &req) {
		return
	}
	if code, msg := validateReview(req.Rating, &req.Comment); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	bookID, ok := h.resolveBook(r.Context(), w, ref, true, req.Category)
	if !ok {
		return
	}
	rv, err := h.Store.CreateReview(r.Context(), userID, bookID, req.Rating, req.Comment)
	switch {
	case errors.Is(err, store.ErrDuplicate):
		writeError(w, http.StatusConflict, "ALREADY_REVIEWED", "คุณรีวิวหนังสือเล่มนี้แล้ว แก้ไขรีวิวเดิมแทนได้")
		return
	case errors.Is(err, store.ErrNotFound):
		writeError(w, http.StatusNotFound, "BOOK_NOT_FOUND", "ไม่พบหนังสือเล่มนี้")
		return
	case err != nil:
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusCreated, rv)
}

// UpdateReview PUT /api/reviews/{id}  แก้ได้เฉพาะเจ้าของ (admin ก็แก้ข้อความของคนอื่นไม่ได้ ลบได้อย่างเดียว)
func (h *Handler) UpdateReview(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	id, ok := pathID(r, "id")
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "เลขรีวิวต้องเป็นตัวเลข")
		return
	}
	var req reviewReq
	if !decode(w, r, &req) {
		return
	}
	if code, msg := validateReview(req.Rating, &req.Comment); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	rv, err := h.Store.UpdateReview(r.Context(), id, userID, req.Rating, req.Comment)
	if errors.Is(err, store.ErrNotFound) {
		// ไม่บอกว่ามีรีวิวนี้แต่เป็นของคนอื่น
		writeError(w, http.StatusNotFound, "REVIEW_NOT_FOUND", "ไม่พบรีวิวนี้ หรือไม่ใช่รีวิวของคุณ")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, rv)
}

// DeleteReview DELETE /api/reviews/{id}  เจ้าของลบของตัวเอง admin ลบรีวิวไม่เหมาะสมได้ทุกอัน
func (h *Handler) DeleteReview(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	id, ok := pathID(r, "id")
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "เลขรีวิวต้องเป็นตัวเลข")
		return
	}
	err := h.Store.DeleteReview(r.Context(), id, userID, mw.Role(r.Context()) == "admin")
	if errors.Is(err, store.ErrNotFound) {
		writeError(w, http.StatusNotFound, "REVIEW_NOT_FOUND", "ไม่พบรีวิวนี้ หรือไม่ใช่รีวิวของคุณ")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	w.WriteHeader(http.StatusNoContent)
}

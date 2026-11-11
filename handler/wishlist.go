package handler

import (
	"encoding/json"
	"errors"
	"net/http"
	"strconv"

	"bookreview/mw"
	"bookreview/store"
)

type wishlistReq struct {
	BookID   json.RawMessage `json:"bookId"`   // 15 หรือ "15" หรือ "OL27448W"
	Category string          `json:"category"` // ไม่บังคับ ใช้ตอนนำเข้าจาก Open Library
}

func (h *Handler) ListWishlist(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	items, err := h.Store.ListWishlist(r.Context(), userID)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"items": items})
}

// AddWishlist POST /api/wishlist  body { "bookId": ... }  กดซ้ำได้ผลเหมือนเดิม
func (h *Handler) AddWishlist(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	var req wishlistReq
	if !decode(w, r, &req) {
		return
	}
	var raw string
	if err := json.Unmarshal(req.BookID, &raw); err != nil {
		var n int64
		if json.Unmarshal(req.BookID, &n) != nil {
			writeError(w, http.StatusBadRequest, "BAD_ID", "ต้องระบุ bookId")
			return
		}
		raw = strconv.FormatInt(n, 10)
	}
	ref, ok := parseBookRef(raw)
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "bookId ต้องเป็นเลขในระบบหรือรหัส Open Library (OL…W)")
		return
	}
	bookID, ok := h.resolveBook(r.Context(), w, ref, true, req.Category)
	if !ok {
		return
	}
	if err := h.Store.AddWishlist(r.Context(), userID, bookID); err != nil {
		writeBookErr(w, err)
		return
	}
	b, err := h.Store.GetBook(r.Context(), bookID)
	if err != nil {
		writeBookErr(w, err)
		return
	}
	writeJSON(w, http.StatusCreated, b)
}

// RemoveWishlist DELETE /api/wishlist/{bookId}  ลบได้เฉพาะรายการของตัวเอง
func (h *Handler) RemoveWishlist(w http.ResponseWriter, r *http.Request) {
	userID, _ := mw.UserID(r.Context())
	ref, ok := parseBookRef(r.PathValue("bookId"))
	if !ok {
		writeError(w, http.StatusBadRequest, "BAD_ID", "รหัสหนังสือไม่ถูกต้อง")
		return
	}
	bookID, ok := h.resolveBook(r.Context(), w, ref, false, "")
	if !ok {
		return
	}
	err := h.Store.RemoveWishlist(r.Context(), userID, bookID)
	if errors.Is(err, store.ErrNotFound) {
		writeError(w, http.StatusNotFound, "NOT_IN_WISHLIST", "หนังสือเล่มนี้ไม่ได้อยู่ในรายการของคุณ")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	w.WriteHeader(http.StatusNoContent)
}

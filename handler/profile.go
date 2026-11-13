package handler

import (
	"errors"
	"net/http"
	"strings"

	"bookreview/auth"
	"bookreview/mw"
	"bookreview/store"
)

// ทุก handler ในไฟล์นี้อยู่หลัง RequireLogin และใช้เลขผู้ใช้จากตั๋วที่ตรวจแล้วเท่านั้น
// body ไม่มีช่อง id / role / email: ต่อให้ส่งมา JSON decoder ก็ทิ้งไป ผู้ใช้จึงแก้ได้แค่ข้อมูลของตัวเอง

type profileReq struct {
	Name string `json:"name"`
}

type changePasswordReq struct {
	CurrentPassword string `json:"currentPassword"`
	NewPassword     string `json:"newPassword"`
}

// userGone: ตั๋วยังไม่หมดอายุ แต่บัญชีถูกลบไปแล้ว
func userGone(w http.ResponseWriter) {
	writeError(w, http.StatusUnauthorized, "USER_GONE", "ไม่พบบัญชีนี้แล้ว กรุณาเข้าสู่ระบบใหม่")
}

// UpdateProfile PATCH /api/auth/profile  { name }  แก้ชื่อที่แสดงในรีวิว ตอบ User ฉบับใหม่ (เหมือน GET /api/auth/me)
func (h *Handler) UpdateProfile(w http.ResponseWriter, r *http.Request) {
	id, _ := mw.UserID(r.Context())
	var req profileReq
	if !decode(w, r, &req) {
		return
	}
	name := strings.TrimSpace(req.Name)
	if code, msg := validateName(name); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	err := h.Store.UpdateUserName(r.Context(), id, name)
	if errors.Is(err, store.ErrNotFound) {
		userGone(w)
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	u, err := h.Store.UserByID(r.Context(), id)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, u)
}

// ChangePassword POST /api/auth/change-password  { currentPassword, newPassword }
// ตรวจรหัสปัจจุบันกับ bcrypt เดิม แล้วเก็บรหัสใหม่เป็น bcrypt (ไม่เก็บ ไม่ log และไม่ส่งรหัสหรือ hash กลับ)
// สำเร็จตอบ { token, user } ตั๋วใบใหม่ให้หน้าเว็บใช้ต่อ
// รหัสปัจจุบันผิดตอบ 400 ไม่ใช่ 401 เพราะ 401 หมายถึงตั๋วใช้ไม่ได้ (หน้าเว็บจะพาออกจากระบบ)
func (h *Handler) ChangePassword(w http.ResponseWriter, r *http.Request) {
	id, _ := mw.UserID(r.Context())
	var req changePasswordReq
	if !decode(w, r, &req) {
		return
	}
	if req.CurrentPassword == "" || req.NewPassword == "" {
		writeError(w, http.StatusBadRequest, "MISSING_FIELDS", "กรอกรหัสผ่านปัจจุบันและรหัสผ่านใหม่ให้ครบ")
		return
	}
	if code, msg := validatePassword(req.NewPassword); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	if req.NewPassword == req.CurrentPassword {
		writeError(w, http.StatusBadRequest, "SAME_PASSWORD", "รหัสผ่านใหม่ต้องไม่ซ้ำกับรหัสผ่านปัจจุบัน")
		return
	}

	oldHash, err := h.Store.PasswordHashByID(r.Context(), id)
	if errors.Is(err, store.ErrNotFound) {
		userGone(w)
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	if !auth.CheckPassword(oldHash, req.CurrentPassword) {
		writeError(w, http.StatusBadRequest, "WRONG_PASSWORD", "รหัสผ่านปัจจุบันไม่ถูกต้อง")
		return
	}
	newHash, err := auth.HashPassword(req.NewPassword)
	if err != nil {
		internal(w, err)
		return
	}
	err = h.Store.UpdatePasswordHash(r.Context(), id, oldHash, newHash)
	if errors.Is(err, store.ErrNotFound) {
		// บัญชีถูกลบ หรือรหัสถูกเปลี่ยนจากอีกที่หนึ่งระหว่างนี้
		writeError(w, http.StatusConflict, "PASSWORD_CHANGED", "รหัสผ่านเพิ่งถูกเปลี่ยนจากที่อื่น กรุณาเข้าสู่ระบบใหม่")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}

	u, err := h.Store.UserByID(r.Context(), id)
	if err != nil {
		internal(w, err)
		return
	}
	token, err := h.Tickets.Issue(u.ID, u.Role) // บทบาทจากฐานข้อมูล ไม่ใช่จากตั๋วเดิม
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"token": token, "user": u})
}

// MyReviews GET /api/me/reviews?page=&pageSize=  รีวิวของคนที่ถือตั๋วเท่านั้น
// ตอบ { items, total, page, pageSize, avgRating }  แต่ละรีวิวมี book { id, title, openlibraryKey, coverUrl }
func (h *Handler) MyReviews(w http.ResponseWriter, r *http.Request) {
	id, _ := mw.UserID(r.Context())
	page, size := pageParams(r)
	out, err := h.Store.ListUserReviews(r.Context(), id, page, size)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, out)
}

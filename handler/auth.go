package handler

import (
	"errors"
	"net/http"
	"strings"

	"bookreview/auth"
	"bookreview/mw"
	"bookreview/store"
)

// registerReq ไม่มีช่อง role: ต่อให้ส่ง "role":"admin" มา JSON decoder ก็ทิ้งไป สมาชิกใหม่จึงเป็น member เสมอ
type registerReq struct {
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type loginReq struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func (h *Handler) Register(w http.ResponseWriter, r *http.Request) {
	var req registerReq
	if !decode(w, r, &req) {
		return
	}
	email := strings.ToLower(strings.TrimSpace(req.Email))
	name := strings.TrimSpace(req.Name)
	if code, msg := validateRegister(email, req.Password, name); code != "" {
		writeError(w, http.StatusBadRequest, code, msg)
		return
	}
	hash, err := auth.HashPassword(req.Password)
	if err != nil {
		internal(w, err)
		return
	}
	u, err := h.Store.CreateUser(r.Context(), email, hash, name)
	if errors.Is(err, store.ErrEmailTaken) {
		writeError(w, http.StatusConflict, "EMAIL_TAKEN", "อีเมลนี้มีบัญชีอยู่แล้ว")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusCreated, u)
}

func (h *Handler) Login(w http.ResponseWriter, r *http.Request) {
	var req loginReq
	if !decode(w, r, &req) {
		return
	}
	email := strings.ToLower(strings.TrimSpace(req.Email))
	u, err := h.Store.UserByEmail(r.Context(), email)
	if errors.Is(err, store.ErrNotFound) {
		writeError(w, http.StatusUnauthorized, "BAD_CREDENTIALS", "อีเมลหรือรหัสผ่านไม่ถูกต้อง")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	if !auth.CheckPassword(u.PasswordHash, req.Password) {
		writeError(w, http.StatusUnauthorized, "BAD_CREDENTIALS", "อีเมลหรือรหัสผ่านไม่ถูกต้อง")
		return
	}
	token, err := h.Tickets.Issue(u.ID, u.Role)
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, map[string]any{"token": token, "user": u})
}

// Me ตอบข้อมูลของคนที่ถือตั๋ว เลขผู้ใช้มาจากตั๋วที่ RequireLogin ตรวจแล้วเท่านั้น
func (h *Handler) Me(w http.ResponseWriter, r *http.Request) {
	id, ok := mw.UserID(r.Context())
	if !ok {
		writeError(w, http.StatusUnauthorized, "NO_TOKEN", "กรุณาเข้าสู่ระบบก่อน")
		return
	}
	u, err := h.Store.UserByID(r.Context(), id)
	if errors.Is(err, store.ErrNotFound) {
		writeError(w, http.StatusUnauthorized, "USER_GONE", "ไม่พบบัญชีนี้แล้ว กรุณาเข้าสู่ระบบใหม่")
		return
	}
	if err != nil {
		internal(w, err)
		return
	}
	writeJSON(w, http.StatusOK, u)
}

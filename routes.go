package main

import (
	"net/http"

	"bookreview/auth"
	"bookreview/handler"
	"bookreview/mw"
)

// routes ประกอบเส้นทางทั้งหมด (แยกจาก main.go เพื่อให้ integration test ใช้ชุดเดียวกับของจริง)
// Router คือ http.ServeMux ของ Go เอง (pattern "METHOD /path/{id}" แบบ week6-lab)
func routes(h *handler.Handler, tickets *auth.Issuer, origins []string) http.Handler {
	login := func(next http.HandlerFunc) http.HandlerFunc { return mw.RequireLogin(tickets, next) }
	admin := func(next http.HandlerFunc) http.HandlerFunc { return login(mw.RequireRole("admin", next)) }

	mux := http.NewServeMux()
	mux.HandleFunc("GET /api/health", h.Health)

	// สมาชิก
	mux.HandleFunc("POST /api/auth/register", h.Register)
	mux.HandleFunc("POST /api/auth/login", h.Login)
	mux.HandleFunc("GET /api/auth/me", login(h.Me))

	// หนังสือ: {id} = เลขในระบบ หรือรหัส Open Library เช่น OL27448W
	mux.HandleFunc("GET /api/categories", h.Categories)
	mux.HandleFunc("GET /api/books", h.ListBooks)
	mux.HandleFunc("GET /api/books/ratings", h.Ratings)
	mux.HandleFunc("GET /api/books/{id}", h.GetBook)
	mux.HandleFunc("POST /api/books", admin(h.CreateBook))
	mux.HandleFunc("PUT /api/books/{id}", admin(h.UpdateBook))
	mux.HandleFunc("DELETE /api/books/{id}", admin(h.DeleteBook))

	// รีวิว
	mux.HandleFunc("GET /api/books/{id}/reviews", h.ListReviews)
	mux.HandleFunc("POST /api/books/{id}/reviews", login(h.CreateReview))
	mux.HandleFunc("PUT /api/reviews/{id}", login(h.UpdateReview))
	mux.HandleFunc("DELETE /api/reviews/{id}", login(h.DeleteReview))

	// Wishlist
	mux.HandleFunc("GET /api/wishlist", login(h.ListWishlist))
	mux.HandleFunc("POST /api/wishlist", login(h.AddWishlist))
	mux.HandleFunc("DELETE /api/wishlist/{bookId}", login(h.RemoveWishlist))

	// หลังบ้าน: ทุกเส้นทางใต้ /api/admin ผ่าน admin(...) ไม่มีข้อยกเว้น
	mux.HandleFunc("GET /api/admin/stats", admin(h.AdminStats))
	mux.HandleFunc("GET /api/admin/users", admin(h.AdminUsers))
	mux.HandleFunc("GET /api/admin/reviews", admin(h.AdminReviews))
	mux.HandleFunc("GET /api/admin/books/{id}", admin(h.AdminBook))

	// path อื่นใต้ /api ตอบ JSON แทนหน้า 404 ข้อความธรรมดาของ Go
	mux.HandleFunc("/api/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte(`{"error":{"code":"NOT_FOUND","message":"ไม่มี endpoint นี้"}}`))
	})

	return mw.Logging(mw.CORS(origins, mux))
}

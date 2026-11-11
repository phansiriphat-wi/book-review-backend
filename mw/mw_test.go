package mw

import (
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"bookreview/auth"
)

func okHandler(w http.ResponseWriter, r *http.Request) { w.WriteHeader(http.StatusOK) }

func TestCORSAllowsListedOriginOnly(t *testing.T) {
	h := CORS([]string{"http://localhost:3000", " https://book-review.vercel.app/ "}, http.HandlerFunc(okHandler))

	for _, tc := range []struct {
		origin string
		want   string
	}{
		{"http://localhost:3000", "http://localhost:3000"},
		{"https://book-review.vercel.app", "https://book-review.vercel.app"}, // ตัดช่องว่างและ / ท้ายแล้ว
		{"https://evil.example", ""},
	} {
		req := httptest.NewRequest(http.MethodGet, "/api/books", nil)
		req.Header.Set("Origin", tc.origin)
		rec := httptest.NewRecorder()
		h.ServeHTTP(rec, req)
		if got := rec.Header().Get("Access-Control-Allow-Origin"); got != tc.want {
			t.Errorf("origin %s: got %q want %q", tc.origin, got, tc.want)
		}
	}

	pre := httptest.NewRequest(http.MethodOptions, "/api/books", nil)
	pre.Header.Set("Origin", "http://localhost:3000")
	rec := httptest.NewRecorder()
	h.ServeHTTP(rec, pre)
	if rec.Code != http.StatusNoContent {
		t.Errorf("preflight ต้องได้ 204 ได้ %d", rec.Code)
	}
}

func TestRequireLoginAndRole(t *testing.T) {
	iss := &auth.Issuer{Secret: []byte("test-secret-that-is-at-least-32-bytes-long"), TTL: time.Hour}
	admin := RequireLogin(iss, RequireRole("admin", okHandler))
	memberTok, _ := iss.Issue(1, "member")
	adminTok, _ := iss.Issue(2, "admin")

	for _, tc := range []struct {
		name, header string
		want         int
	}{
		{"ไม่มีตั๋ว", "", http.StatusUnauthorized},
		{"ตั๋วมั่ว", "Bearer not-a-jwt", http.StatusUnauthorized},
		{"member", "Bearer " + memberTok, http.StatusForbidden},
		{"admin", "Bearer " + adminTok, http.StatusOK},
	} {
		req := httptest.NewRequest(http.MethodGet, "/api/admin/stats", nil)
		if tc.header != "" {
			req.Header.Set("Authorization", tc.header)
		}
		rec := httptest.NewRecorder()
		admin(rec, req)
		if rec.Code != tc.want {
			t.Errorf("%s: got %d want %d", tc.name, rec.Code, tc.want)
		}
	}
}

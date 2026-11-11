package main

// Integration test: เส้นทางจริง (routes) + PostgreSQL จริง + Open Library จำลอง
// ล้างฐานข้อมูลทั้งหมด! ใช้กับฐานข้อมูลทดสอบในเครื่องเท่านั้น:
//   docker compose up -d
//   TEST_DATABASE_URL=postgres://postgres:localdev@localhost:5432/bookreview_test go test -run Integration -v .
// (ต้องสร้าง database bookreview_test ก่อน: psql postgres://postgres:localdev@localhost:5432/postgres -c 'CREATE DATABASE bookreview_test')

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"
	"testing"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"

	"bookreview/auth"
	"bookreview/handler"
	"bookreview/openlibrary"
	"bookreview/store"
)

type api struct {
	t   *testing.T
	url string
}

type resp struct {
	Status int
	Body   map[string]any
	Raw    string
}

func (a api) call(method, path, token string, body any) resp {
	a.t.Helper()
	var rd io.Reader
	if body != nil {
		b, _ := json.Marshal(body)
		rd = bytes.NewReader(b)
	}
	req, _ := http.NewRequest(method, a.url+path, rd)
	req.Header.Set("Content-Type", "application/json")
	if token != "" {
		req.Header.Set("Authorization", "Bearer "+token)
	}
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		a.t.Fatal(err)
	}
	defer res.Body.Close()
	raw, _ := io.ReadAll(res.Body)
	out := resp{Status: res.StatusCode, Raw: string(raw)}
	json.Unmarshal(raw, &out.Body)
	return out
}

func (a api) expect(r resp, status int, what string) resp {
	a.t.Helper()
	if r.Status != status {
		a.t.Fatalf("%s: status %d want %d body=%s", what, r.Status, status, r.Raw)
	}
	return r
}

func errCode(r resp) string {
	e, _ := r.Body["error"].(map[string]any)
	s, _ := e["code"].(string)
	return s
}

func items(r resp) []any {
	v, _ := r.Body["items"].([]any)
	return v
}

// Open Library จำลอง (ข้อมูลสมมติ รูปร่าง JSON เดียวกับของจริง)
func fakeOpenLibrary() *httptest.Server {
	return httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		switch r.URL.Path {
		case "/works/OL100W.json":
			fmt.Fprint(w, `{"title":"The Test Dragon","subjects":["Fantasy fiction","Dragons"],"covers":[42],
				"description":{"type":"/type/text","value":"A dragon story."},"authors":[{"author":{"key":"/authors/OL1A"}}]}`)
		case "/works/OL200W.json":
			fmt.Fprint(w, `{"title":"Untagged Book","description":"No subjects here.","first_publish_date":"1999"}`)
		case "/search.json":
			if strings.Contains(r.URL.Query().Get("q"), "/works/OL100W") {
				fmt.Fprint(w, `{"docs":[{"key":"/works/OL100W","author_name":["Ann Author"],"first_publish_year":2001,"cover_i":42}]}`)
				return
			}
			fmt.Fprint(w, `{"docs":[]}`)
		case "/works/OL500W.json":
			w.WriteHeader(http.StatusServiceUnavailable)
		default:
			w.WriteHeader(http.StatusNotFound)
		}
	}))
}

func resetDB(t *testing.T, pool *pgxpool.Pool) {
	t.Helper()
	ctx := context.Background()
	if _, err := pool.Exec(ctx, `DROP SCHEMA public CASCADE; CREATE SCHEMA public;`); err != nil {
		t.Fatal(err)
	}
	for _, f := range []string{"schema.sql", "seed.sql"} {
		sql, err := os.ReadFile(f)
		if err != nil {
			t.Fatal(err)
		}
		if _, err := pool.Exec(ctx, string(sql)); err != nil {
			t.Fatalf("%s: %v", f, err)
		}
	}
}

func TestIntegration(t *testing.T) {
	dbURL := os.Getenv("TEST_DATABASE_URL")
	if dbURL == "" {
		t.Skip("ตั้ง TEST_DATABASE_URL (ฐานข้อมูลทดสอบในเครื่อง) เพื่อรัน integration test")
	}
	if strings.Contains(dbURL, "supabase") {
		t.Fatal("ห้ามรัน integration test กับ Supabase: test นี้ล้างฐานข้อมูลทั้งหมด")
	}
	pool, err := pgxpool.New(context.Background(), dbURL)
	if err != nil {
		t.Fatal(err)
	}
	defer pool.Close()
	resetDB(t, pool)

	ol := fakeOpenLibrary()
	defer ol.Close()
	tickets := &auth.Issuer{Secret: []byte("integration-test-secret-0123456789abcdef"), TTL: time.Hour}
	h := &handler.Handler{Store: &store.Store{Pool: pool}, Tickets: tickets, OL: openlibrary.New(ol.URL)}
	srv := httptest.NewServer(routes(h, tickets, []string{"http://localhost:3000"}))
	defer srv.Close()
	a := api{t: t, url: srv.URL}

	login := func(email, pass string) string {
		r := a.expect(a.call("POST", "/api/auth/login", "", map[string]string{"email": email, "password": pass}), 200, "login "+email)
		return r.Body["token"].(string)
	}

	t.Run("health and public endpoints", func(t *testing.T) {
		a.expect(a.call("GET", "/api/health", "", nil), 200, "health")
		cats := a.expect(a.call("GET", "/api/categories", "", nil), 200, "categories")
		if len(items(cats)) != 9 {
			t.Fatalf("categories: %d", len(items(cats)))
		}
		a.expect(a.call("GET", "/api/books", "", nil), 200, "guest list books")
		if r := a.call("GET", "/api/nope", "", nil); r.Status != 404 || errCode(r) != "NOT_FOUND" {
			t.Fatalf("unknown endpoint: %d %s", r.Status, r.Raw)
		}
	})

	var alice, bob, admin string
	t.Run("register always creates member, no password in response", func(t *testing.T) {
		r := a.expect(a.call("POST", "/api/auth/register", "", map[string]any{
			"name": "Alice", "email": "Alice@Example.com", "password": "alice-pass-1", "role": "admin"}), 201, "register alice")
		if r.Body["role"] != "member" || r.Body["email"] != "alice@example.com" {
			t.Fatalf("role must be member: %s", r.Raw)
		}
		if strings.Contains(r.Raw, "password") || strings.Contains(r.Raw, "$2a$") {
			t.Fatalf("password leaked: %s", r.Raw)
		}
		if r := a.call("POST", "/api/auth/register", "", map[string]any{"name": "X", "email": "ALICE@example.com", "password": "12345678"}); r.Status != 409 {
			t.Fatalf("duplicate email: %d", r.Status)
		}
		if r := a.call("POST", "/api/auth/register", "", map[string]any{"name": "X", "email": "x@example.com", "password": "short"}); errCode(r) != "BAD_PASSWORD" {
			t.Fatalf("short password: %s", r.Raw)
		}
		a.expect(a.call("POST", "/api/auth/register", "", map[string]any{"name": "Bob", "email": "bob@example.com", "password": "bob-pass-12"}), 201, "register bob")
		a.expect(a.call("POST", "/api/auth/register", "", map[string]any{"name": "Carol Admin", "email": "carol@example.com", "password": "carol-pass-1"}), 201, "register carol")

		var hash string
		pool.QueryRow(context.Background(), `SELECT password_hash FROM users WHERE email = 'alice@example.com'`).Scan(&hash)
		if !strings.HasPrefix(hash, "$2a$") || strings.Contains(hash, "alice-pass-1") {
			t.Fatalf("password not hashed: %q", hash)
		}
	})

	t.Run("login and me", func(t *testing.T) {
		if r := a.call("POST", "/api/auth/login", "", map[string]string{"email": "alice@example.com", "password": "wrong-pass"}); r.Status != 401 {
			t.Fatalf("wrong password: %d", r.Status)
		}
		if r := a.call("POST", "/api/auth/login", "", map[string]string{"email": "ghost@example.com", "password": "whatever1"}); r.Status != 401 {
			t.Fatalf("unknown email: %d", r.Status)
		}
		alice = login("ALICE@example.com", "alice-pass-1")
		bob = login("bob@example.com", "bob-pass-12")
		me := a.expect(a.call("GET", "/api/auth/me", alice, nil), 200, "me")
		if me.Body["name"] != "Alice" || me.Body["role"] != "member" {
			t.Fatalf("me: %s", me.Raw)
		}
		a.expect(a.call("GET", "/api/auth/me", "", nil), 401, "me without token")
		a.expect(a.call("GET", "/api/auth/me", "garbage", nil), 401, "me bad token")
	})

	t.Run("guest cannot call protected APIs", func(t *testing.T) {
		for _, c := range [][2]string{
			{"POST", "/api/books/OL100W/reviews"}, {"PUT", "/api/reviews/1"}, {"DELETE", "/api/reviews/1"},
			{"GET", "/api/wishlist"}, {"POST", "/api/wishlist"}, {"DELETE", "/api/wishlist/1"},
			{"POST", "/api/books"}, {"PUT", "/api/books/1"}, {"DELETE", "/api/books/1"},
			{"GET", "/api/admin/stats"}, {"GET", "/api/admin/users"}, {"GET", "/api/admin/reviews"}, {"GET", "/api/admin/books/1"},
		} {
			if r := a.call(c[0], c[1], "", map[string]any{}); r.Status != 401 {
				t.Errorf("guest %s %s: %d", c[0], c[1], r.Status)
			}
		}
	})

	t.Run("member cannot call admin APIs", func(t *testing.T) {
		for _, c := range [][2]string{
			{"POST", "/api/books"}, {"PUT", "/api/books/1"}, {"DELETE", "/api/books/1"},
			{"GET", "/api/admin/stats"}, {"GET", "/api/admin/users"}, {"GET", "/api/admin/reviews"}, {"GET", "/api/admin/books/1"},
		} {
			if r := a.call(c[0], c[1], alice, map[string]any{"title": "x"}); r.Status != 403 {
				t.Errorf("member %s %s: %d", c[0], c[1], r.Status)
			}
		}
		// แก้ payload ของตั๋วเป็น admin โดยใช้ลายเซ็นเดิม ต้องไม่ผ่าน
		forged, _ := tickets.Issue(1, "admin")
		parts := strings.Split(alice, ".")
		tampered := parts[0] + "." + strings.Split(forged, ".")[1] + "." + parts[2]
		a.expect(a.call("GET", "/api/admin/stats", tampered, nil), 401, "tampered token")
	})

	var aliceReviewID, bobReviewID, olBookID float64
	t.Run("review an Open Library book imports it once", func(t *testing.T) {
		a.expect(a.call("GET", "/api/books/OL100W", "", nil), 404, "not imported yet")
		rv := a.expect(a.call("GET", "/api/books/OL100W/reviews", "", nil), 200, "reviews of unknown OL book")
		if len(items(rv)) != 0 || rv.Body["bookId"] != nil {
			t.Fatalf("expected empty: %s", rv.Raw)
		}
		// ข้อมูลผิดต้องถูกปฏิเสธก่อนนำเข้า
		if r := a.call("POST", "/api/books/OL100W/reviews", alice, map[string]any{"rating": 9, "comment": "Great dragon book!"}); errCode(r) != "BAD_RATING" {
			t.Fatalf("bad rating: %s", r.Raw)
		}
		if r := a.call("POST", "/api/books/OL100W/reviews", alice, map[string]any{"rating": 4, "comment": "short"}); errCode(r) != "COMMENT_TOO_SHORT" {
			t.Fatalf("short comment: %s", r.Raw)
		}
		a.expect(a.call("GET", "/api/books/OL100W", "", nil), 404, "invalid review must not import")

		r := a.expect(a.call("POST", "/api/books/OL100W/reviews", alice, map[string]any{"rating": 5, "comment": "Great dragon book!"}), 201, "alice review")
		aliceReviewID = r.Body["id"].(float64)
		if u := r.Body["user"].(map[string]any); u["name"] != "Alice" {
			t.Fatalf("review user: %s", r.Raw)
		}
		b := a.expect(a.call("GET", "/api/books/OL100W", "", nil), 200, "imported book")
		olBookID = b.Body["id"].(float64)
		if b.Body["title"] != "The Test Dragon" || b.Body["author"] != "Ann Author" || b.Body["category"] != "Fantasy" ||
			b.Body["publishedYear"] != float64(2001) || b.Body["coverUrl"] != "https://covers.openlibrary.org/b/id/42-L.jpg" ||
			b.Body["openlibraryKey"] != "OL100W" {
			t.Fatalf("imported fields: %s", b.Raw)
		}
		a.expect(a.call("GET", fmt.Sprintf("/api/books/%d", int(olBookID)), "", nil), 200, "same book by numeric id")

		if r := a.call("POST", "/api/books/OL100W/reviews", alice, map[string]any{"rating": 3, "comment": "Second time around"}); r.Status != 409 || errCode(r) != "ALREADY_REVIEWED" {
			t.Fatalf("duplicate review: %d %s", r.Status, r.Raw)
		}
		r = a.expect(a.call("POST", fmt.Sprintf("/api/books/%d/reviews", int(olBookID)), bob, map[string]any{"rating": 2, "comment": "Not for me, sadly."}), 201, "bob review by numeric id")
		bobReviewID = r.Body["id"].(float64)

		var n int
		pool.QueryRow(context.Background(), `SELECT count(*) FROM books WHERE openlibrary_key = 'OL100W'`).Scan(&n)
		if n != 1 {
			t.Fatalf("book imported %d times", n)
		}
		list := a.expect(a.call("GET", "/api/books/OL100W/reviews", "", nil), 200, "list reviews")
		if len(items(list)) != 2 || list.Body["avgRating"] != 3.5 || list.Body["reviewCount"] != float64(2) {
			t.Fatalf("reviews summary: %s", list.Raw)
		}
	})

	t.Run("Open Library errors", func(t *testing.T) {
		if r := a.call("POST", "/api/books/OL404W/reviews", alice, map[string]any{"rating": 4, "comment": "Does this exist?"}); r.Status != 404 {
			t.Fatalf("missing OL book: %d", r.Status)
		}
		if r := a.call("POST", "/api/books/OL500W/reviews", alice, map[string]any{"rating": 4, "comment": "Server is down?"}); r.Status != 502 || errCode(r) != "OPENLIBRARY_UNAVAILABLE" {
			t.Fatalf("OL down: %d %s", r.Status, r.Raw)
		}
		a.expect(a.call("GET", "/api/books/not-an-id", "", nil), 400, "bad id")
	})

	t.Run("members can only edit or delete their own reviews", func(t *testing.T) {
		path := fmt.Sprintf("/api/reviews/%d", int(aliceReviewID))
		a.expect(a.call("PUT", path, bob, map[string]any{"rating": 1, "comment": "Hijacked review text"}), 404, "bob edits alice")
		a.expect(a.call("DELETE", path, bob, nil), 404, "bob deletes alice")
		r := a.expect(a.call("PUT", path, alice, map[string]any{"rating": 4, "comment": "  Still great, 4 stars.  "}), 200, "alice edits own")
		if r.Body["rating"] != float64(4) || r.Body["comment"] != "Still great, 4 stars." {
			t.Fatalf("updated: %s", r.Raw)
		}
		if r := a.call("PUT", path, alice, map[string]any{"rating": 0, "comment": "Still great, 4 stars."}); r.Status != 400 {
			t.Fatalf("invalid edit: %d", r.Status)
		}
	})

	t.Run("wishlist add, idempotent, list, remove", func(t *testing.T) {
		r := a.expect(a.call("POST", "/api/wishlist", alice, map[string]any{"bookId": "OL200W", "category": "Horror"}), 201, "add OL200W")
		if r.Body["category"] != "Horror" || r.Body["publishedYear"] != float64(1999) || r.Body["author"] != "Unknown author" {
			t.Fatalf("imported via wishlist (category hint): %s", r.Raw)
		}
		a.expect(a.call("POST", "/api/wishlist", alice, map[string]any{"bookId": "OL200W"}), 201, "add again")
		a.expect(a.call("POST", "/api/wishlist", alice, map[string]any{"bookId": olBookID}), 201, "add numeric id")
		if r := a.call("POST", "/api/wishlist", alice, map[string]any{"bookId": 999999}); r.Status != 404 {
			t.Fatalf("missing book: %d", r.Status)
		}
		if r := a.call("POST", "/api/wishlist", alice, map[string]any{}); r.Status != 400 {
			t.Fatalf("no bookId: %d", r.Status)
		}
		list := a.expect(a.call("GET", "/api/wishlist", alice, nil), 200, "alice wishlist")
		if len(items(list)) != 2 {
			t.Fatalf("wishlist size: %s", list.Raw)
		}
		if first := items(list)[0].(map[string]any); first["addedAt"] == nil {
			t.Fatalf("addedAt missing: %s", list.Raw)
		}
		if len(items(a.call("GET", "/api/wishlist", bob, nil))) != 0 {
			t.Fatal("bob sees alice's wishlist")
		}
		a.expect(a.call("DELETE", "/api/wishlist/OL200W", bob, nil), 404, "bob removes alice item")
		a.expect(a.call("DELETE", "/api/wishlist/OL200W", alice, nil), 204, "alice removes")
		a.expect(a.call("DELETE", "/api/wishlist/OL200W", alice, nil), 404, "remove again")
		a.expect(a.call("DELETE", "/api/wishlist/OL999W", alice, nil), 404, "remove never-imported")
	})

	t.Run("ratings for Open Library cards", func(t *testing.T) {
		r := a.expect(a.call("GET", "/api/books/ratings?keys=OL100W,OL200W,OL777W,bad", "", nil), 200, "ratings")
		got := map[string]any{}
		for _, it := range items(r) {
			m := it.(map[string]any)
			got[m["openlibraryKey"].(string)] = m["avgRating"]
		}
		if got["OL100W"] != 3.0 || len(got) != 2 { // (4+2)/2
			t.Fatalf("ratings: %s", r.Raw)
		}
	})

	t.Run("admin dashboard, users, reviews", func(t *testing.T) {
		// วิธีเดียวกับ promote-admin.sql
		if _, err := pool.Exec(context.Background(), `UPDATE users SET role = 'admin' WHERE lower(email) = lower($1)`, "carol@example.com"); err != nil {
			t.Fatal(err)
		}
		admin = login("carol@example.com", "carol-pass-1")
		st := a.expect(a.call("GET", "/api/admin/stats", admin, nil), 200, "stats")
		if st.Body["users"] != float64(3) || st.Body["admins"] != float64(1) || st.Body["reviews"] != float64(2) || st.Body["books"] != float64(2) {
			t.Fatalf("stats: %s", st.Raw)
		}
		users := a.expect(a.call("GET", "/api/admin/users", admin, nil), 200, "users")
		if len(items(users)) != 3 || strings.Contains(users.Raw, "password") {
			t.Fatalf("users: %s", users.Raw)
		}
		rv := a.expect(a.call("GET", "/api/admin/reviews?q=sadly", admin, nil), 200, "admin reviews search")
		if rv.Body["total"] != float64(1) || items(rv)[0].(map[string]any)["book"].(map[string]any)["title"] != "The Test Dragon" {
			t.Fatalf("admin reviews: %s", rv.Raw)
		}
	})

	t.Run("admin book CRUD with validation", func(t *testing.T) {
		good := map[string]any{"title": "Admin Book", "author": "Staff Writer", "category": "History",
			"description": "Added by admin.", "coverUrl": "https://example.com/c.jpg", "publishedYear": 2020}
		bad := map[string]any{}
		for k, v := range good {
			bad[k] = v
		}
		bad["coverUrl"] = "http://insecure.example.com/c.jpg"
		if r := a.call("POST", "/api/books", admin, bad); errCode(r) != "BAD_COVER_URL" {
			t.Fatalf("http cover: %s", r.Raw)
		}
		bad["coverUrl"], bad["category"] = nil, "Cooking"
		if r := a.call("POST", "/api/books", admin, bad); errCode(r) != "BAD_CATEGORY" {
			t.Fatalf("unknown category: %s", r.Raw)
		}
		dup := map[string]any{"title": "Dup", "author": "D", "category": "Fantasy", "openlibraryKey": "OL100W"}
		if r := a.call("POST", "/api/books", admin, dup); r.Status != 409 {
			t.Fatalf("duplicate openlibraryKey: %d %s", r.Status, r.Raw)
		}
		c := a.expect(a.call("POST", "/api/books", admin, good), 201, "create")
		id := int(c.Body["id"].(float64))
		if c.Body["openlibraryKey"] != nil {
			t.Fatalf("admin book should have null key: %s", c.Raw)
		}
		good["title"] = "Admin Book (2nd ed.)"
		u := a.expect(a.call("PUT", fmt.Sprintf("/api/books/%d", id), admin, good), 200, "update")
		if u.Body["title"] != "Admin Book (2nd ed.)" {
			t.Fatalf("update: %s", u.Raw)
		}
		a.expect(a.call("PUT", "/api/books/999999", admin, good), 404, "update missing")

		search := a.expect(a.call("GET", "/api/books?q=2nd%20ed&category=History", "", nil), 200, "search")
		if search.Body["total"] != float64(1) {
			t.Fatalf("search: %s", search.Raw)
		}
		inj := a.expect(a.call("GET", "/api/books?q=%27%20OR%201%3D1%20--", "", nil), 200, "injection attempt")
		if inj.Body["total"] != float64(0) {
			t.Fatalf("injection matched rows: %s", inj.Raw)
		}
		pct := a.expect(a.call("GET", "/api/books?q=%25", "", nil), 200, "percent is literal")
		if pct.Body["total"] != float64(0) {
			t.Fatalf("%% wildcard leaked: %s", pct.Raw)
		}
		page := a.expect(a.call("GET", "/api/books?pageSize=1&page=2&sort=title", "", nil), 200, "pagination")
		if page.Body["total"] != float64(3) || len(items(page)) != 1 || page.Body["page"] != float64(2) {
			t.Fatalf("pagination: %s", page.Raw)
		}
		beyond := a.expect(a.call("GET", "/api/books?pageSize=10&page=5", "", nil), 200, "page beyond end")
		if beyond.Body["total"] != float64(3) || len(items(beyond)) != 0 {
			t.Fatalf("beyond: %s", beyond.Raw)
		}

		im := a.expect(a.call("GET", "/api/admin/books/OL100W", admin, nil), 200, "impact")
		if imp := im.Body["impact"].(map[string]any); imp["reviews"] != float64(2) || imp["wishlists"] != float64(1) {
			t.Fatalf("impact: %s", im.Raw)
		}
		a.expect(a.call("DELETE", fmt.Sprintf("/api/books/%d", id), admin, nil), 204, "delete")
		a.expect(a.call("GET", fmt.Sprintf("/api/books/%d", id), "", nil), 404, "deleted")
		a.expect(a.call("DELETE", fmt.Sprintf("/api/books/%d", id), admin, nil), 404, "delete twice")
	})

	t.Run("admin removes inappropriate review, owner deletes own", func(t *testing.T) {
		a.expect(a.call("DELETE", fmt.Sprintf("/api/reviews/%d", int(bobReviewID)), admin, nil), 204, "admin deletes bob's review")
		a.expect(a.call("DELETE", fmt.Sprintf("/api/reviews/%d", int(aliceReviewID)), alice, nil), 204, "alice deletes own")
		a.expect(a.call("DELETE", fmt.Sprintf("/api/reviews/%d", int(aliceReviewID)), alice, nil), 404, "already deleted")
		a.expect(a.call("PUT", fmt.Sprintf("/api/reviews/%d", int(bobReviewID)), admin, map[string]any{"rating": 3, "comment": "admin cannot edit"}), 404, "admin cannot edit")
	})

	t.Run("deleting a book cascades to reviews and wishlists", func(t *testing.T) {
		a.expect(a.call("POST", "/api/books/OL100W/reviews", bob, map[string]any{"rating": 5, "comment": "Re-read it, loved it."}), 201, "bob reviews again")
		a.expect(a.call("DELETE", "/api/books/OL100W", admin, nil), 204, "admin deletes imported book by key")
		if r := a.expect(a.call("GET", "/api/books/OL100W/reviews", "", nil), 200, "after delete"); len(items(r)) != 0 {
			t.Fatalf("reviews survived: %s", r.Raw)
		}
		if len(items(a.call("GET", "/api/wishlist", alice, nil))) != 0 {
			t.Fatal("wishlist survived")
		}
	})

	t.Run("CORS for frontend origin", func(t *testing.T) {
		req, _ := http.NewRequest(http.MethodOptions, srv.URL+"/api/wishlist", nil)
		req.Header.Set("Origin", "http://localhost:3000")
		req.Header.Set("Access-Control-Request-Method", "POST")
		res, err := http.DefaultClient.Do(req)
		if err != nil {
			t.Fatal(err)
		}
		res.Body.Close()
		if res.StatusCode != 204 || res.Header.Get("Access-Control-Allow-Origin") != "http://localhost:3000" ||
			!strings.Contains(res.Header.Get("Access-Control-Allow-Headers"), "Authorization") {
			t.Fatalf("preflight: %d %v", res.StatusCode, res.Header)
		}
	})
}

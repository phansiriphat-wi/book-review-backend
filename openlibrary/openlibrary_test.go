package openlibrary

import (
	"context"
	"encoding/json"
	"errors"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

// server จำลองที่ตอบรูปร่าง JSON แบบเดียวกับ Open Library (ข้อมูลสมมติ)
func fakeOL(t *testing.T) *httptest.Server {
	t.Helper()
	return httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		switch r.URL.Path {
		case "/works/OL1W.json":
			w.Write([]byte(`{"title":"Object Desc","covers":[-1,555],"subjects":["Fantasy fiction","Magic"],
				"description":{"type":"/type/text","value":"Hello [world](https://x.y).\r\n\r\n----------\r\nSee also"},
				"authors":[{"author":{"key":"/authors/OL9A"}}]}`))
		case "/works/OL2W.json":
			w.Write([]byte(`{"title":"String Desc","description":"Plain text.","first_publish_date":"March 4, 1954",
				"authors":[{"author":{"key":"/authors/OL9A"}},{"author":{"key":"/authors/OL8A"}}]}`))
		case "/works/OL3W.json":
			w.Write([]byte(`{"title":""}`))
		case "/search.json":
			if !strings.Contains(r.URL.Query().Get("q"), "/works/OL1W") {
				w.Write([]byte(`{"docs":[]}`))
				return
			}
			w.Write([]byte(`{"docs":[{"key":"/works/OL1W","author_name":["A","B","C","D"],"first_publish_year":1937,"cover_i":777}]}`))
		case "/authors/OL9A.json":
			w.Write([]byte(`{"name":"Nine"}`))
		case "/authors/OL8A.json":
			w.Write([]byte(`{"name":"Eight"}`))
		case "/works/OL500W.json":
			w.WriteHeader(http.StatusInternalServerError)
		default:
			w.WriteHeader(http.StatusNotFound)
		}
	}))
}

func TestWorkWithSearchData(t *testing.T) {
	srv := fakeOL(t)
	defer srv.Close()
	w, err := New(srv.URL).Work(context.Background(), "OL1W")
	if err != nil {
		t.Fatal(err)
	}
	if w.Title != "Object Desc" || w.Description == nil || *w.Description != "Hello world." {
		t.Fatalf("title/description: %+v %v", w.Title, w.Description)
	}
	if w.AuthorText() != "A, B, C" {
		t.Errorf("authors capped at 3: %q", w.AuthorText())
	}
	if w.PublishedYear == nil || *w.PublishedYear != 1937 {
		t.Errorf("year from search: %v", w.PublishedYear)
	}
	if w.CoverURL == nil || *w.CoverURL != CoversBase+"/555-L.jpg" {
		t.Errorf("cover from works.covers (skip -1): %v", w.CoverURL)
	}
	cat := w.MatchCategory(map[string]string{"Fantasy": "fantasy", "Horror": "horror"}, []string{"Horror", "Fantasy"})
	if cat != "Fantasy" {
		t.Errorf("category: %q", cat)
	}
}

func TestWorkFallsBackToAuthorsAndDate(t *testing.T) {
	srv := fakeOL(t)
	defer srv.Close()
	w, err := New(srv.URL).Work(context.Background(), "OL2W")
	if err != nil {
		t.Fatal(err)
	}
	if w.AuthorText() != "Nine, Eight" {
		t.Errorf("authors from /authors: %q", w.AuthorText())
	}
	if w.PublishedYear == nil || *w.PublishedYear != 1954 {
		t.Errorf("year from first_publish_date: %v", w.PublishedYear)
	}
	if w.CoverURL != nil {
		t.Errorf("no cover expected: %v", *w.CoverURL)
	}
	if w.MatchCategory(map[string]string{"Fantasy": "fantasy"}, []string{"Fantasy"}) != "" {
		t.Error("no subjects -> no category")
	}
}

func TestWorkErrors(t *testing.T) {
	srv := fakeOL(t)
	defer srv.Close()
	c := New(srv.URL)
	for key, want := range map[string]error{
		"OL404W":    ErrNotFound,
		"OL3W":      ErrNotFound, // ไม่มีชื่อ
		"OL500W":    ErrUnavailable,
		"bad-key":   ErrNotFound,
		"OL1W/../x": ErrNotFound,
	} {
		if _, err := c.Work(context.Background(), key); !errors.Is(err, want) {
			t.Errorf("%s: got %v want %v", key, err, want)
		}
	}
}

func TestCleanDescription(t *testing.T) {
	long := strings.Repeat("ก", 6000)
	raw, _ := json.Marshal(long)
	got := CleanDescription(raw)
	if got == nil || len([]rune(*got)) != 5000 {
		t.Fatalf("long description must be cut to 5000 runes")
	}
	if CleanDescription(json.RawMessage(`"   "`)) != nil || CleanDescription(nil) != nil {
		t.Error("empty -> nil")
	}
}

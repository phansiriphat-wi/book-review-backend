package handler

import (
	"strings"
	"testing"
	"time"

	"bookreview/store"
)

func ptr[T any](v T) *T { return &v }

func TestValidateBook(t *testing.T) {
	ok := func() store.BookInput {
		return store.BookInput{Title: " Dune ", Author: "Frank Herbert", Category: "Science Fiction",
			CoverURL: ptr("https://covers.openlibrary.org/b/id/1-L.jpg"), PublishedYear: ptr(1965), OpenLibraryKey: ptr("OL893415W")}
	}
	in := ok()
	if code, _ := validateBook(&in); code != "" || in.Title != "Dune" {
		t.Fatalf("valid book rejected: %s %q", code, in.Title)
	}
	empty := ok()
	empty.Description = ptr("   ")
	validateBook(&empty)
	if empty.Description != nil {
		t.Error("blank description should become NULL")
	}

	cases := map[string]func(*store.BookInput){
		"BAD_TITLE":           func(b *store.BookInput) { b.Title = "  " },
		"BAD_AUTHOR":          func(b *store.BookInput) { b.Author = "" },
		"BAD_CATEGORY":        func(b *store.BookInput) { b.Category = "" },
		"BAD_COVER_URL":       func(b *store.BookInput) { b.CoverURL = ptr("http://x.com/a.jpg") },
		"BAD_YEAR":            func(b *store.BookInput) { b.PublishedYear = ptr(time.Now().Year() + 2) },
		"BAD_OPENLIBRARY_KEY": func(b *store.BookInput) { b.OpenLibraryKey = ptr("OL123M") },
		"BAD_DESCRIPTION":     func(b *store.BookInput) { b.Description = ptr(strings.Repeat("ก", 5001)) },
	}
	for want, mutate := range cases {
		b := ok()
		mutate(&b)
		if code, _ := validateBook(&b); code != want {
			t.Errorf("want %s got %q", want, code)
		}
	}
}

func TestValidateReview(t *testing.T) {
	for _, tc := range []struct {
		rating  int
		comment string
		want    string
	}{
		{5, "อ่านสนุกมาก วางไม่ลง", ""},
		{0, "อ่านสนุกมาก วางไม่ลง", "BAD_RATING"},
		{6, "อ่านสนุกมาก วางไม่ลง", "BAD_RATING"},
		{3, "   สั้นไป   ", "COMMENT_TOO_SHORT"},
		{3, strings.Repeat("a", 2001), "COMMENT_TOO_LONG"},
		{3, "ภาษาไทย10ตัว", ""}, // นับเป็นตัวอักษร ไม่ใช่ไบต์
	} {
		c := tc.comment
		if code, _ := validateReview(tc.rating, &c); code != tc.want {
			t.Errorf("rating=%d comment=%q: got %q want %q", tc.rating, tc.comment, code, tc.want)
		}
	}
}

func TestValidateRegister(t *testing.T) {
	for _, tc := range []struct{ email, pass, name, want string }{
		{"a@b.co", "12345678", "Ann", ""},
		{"no-at", "12345678", "Ann", "BAD_EMAIL"},
		{"a@b.co", "short", "Ann", "BAD_PASSWORD"},
		{"a@b.co", strings.Repeat("x", 73), "Ann", "BAD_PASSWORD"},
		{"a@b.co", "12345678", "", "BAD_NAME"},
	} {
		if code, _ := validateRegister(tc.email, tc.pass, tc.name); code != tc.want {
			t.Errorf("%+v: got %q", tc, code)
		}
	}
}

func TestParseBookRef(t *testing.T) {
	for in, want := range map[string]bookRef{"15": {ID: 15}, "OL27448W": {Key: "OL27448W"}} {
		if got, ok := parseBookRef(in); !ok || got != want {
			t.Errorf("%s: %+v", in, got)
		}
	}
	for _, bad := range []string{"0", "-1", "OL1M", "abc", "", "OL1W;drop"} {
		if _, ok := parseBookRef(bad); ok {
			t.Errorf("%q should be rejected", bad)
		}
	}
}

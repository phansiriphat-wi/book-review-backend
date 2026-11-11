// Package openlibrary ดึงข้อมูลหนังสือจาก Open Library (https://openlibrary.org/developers/api)
// ใช้ตอนผู้ใช้รีวิวหรือเพิ่ม wishlist หนังสือที่ยังไม่มีในตาราง books: Go ดึงข้อมูลเอง ไม่เชื่อข้อมูลหนังสือจากหน้าเว็บ
package openlibrary

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"regexp"
	"strings"
	"time"
	"unicode/utf8"
)

var (
	ErrNotFound    = errors.New("openlibrary: not found")
	ErrUnavailable = errors.New("openlibrary: unavailable")

	// KeyPattern คือรูปแบบรหัส work ของ Open Library เช่น OL27448W (ตรงกับ CHECK ใน schema.sql)
	KeyPattern = regexp.MustCompile(`^OL[0-9]{1,12}W$`)

	yearPattern = regexp.MustCompile(`\b(1[0-9]{3}|20[0-9]{2})\b`)
	mdLink      = regexp.MustCompile(`\[([^\]]+)\]\([^)]*\)`)
	refLine     = regexp.MustCompile(`(?m)^\s*\[\d+\]:.*$`)
	sepLine     = regexp.MustCompile(`\r?\n-{3,}`)
)

const CoversBase = "https://covers.openlibrary.org/b/id"

type Client struct {
	Base   string // https://openlibrary.org (ทดสอบเปลี่ยนเป็น server จำลองได้ผ่าน OPENLIBRARY_BASE)
	Covers string // https://covers.openlibrary.org/b/id (เปลี่ยนได้ผ่าน OPENLIBRARY_COVERS)
	HTTP   *http.Client
}

func New(base string) *Client {
	if base == "" {
		base = "https://openlibrary.org"
	}
	return &Client{Base: strings.TrimRight(base, "/"), Covers: CoversBase, HTTP: &http.Client{Timeout: 10 * time.Second}}
}

// Work คือข้อมูลที่ระบบต้องใช้จากหนังสือ 1 เล่ม
type Work struct {
	Key           string
	Title         string
	Authors       []string
	Description   *string
	CoverURL      *string
	PublishedYear *int
	Subjects      []string
}

func (c *Client) getJSON(ctx context.Context, path string, params url.Values, v any) error {
	u := c.Base + path
	if len(params) > 0 {
		u += "?" + params.Encode()
	}
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, u, nil)
	if err != nil {
		return err
	}
	req.Header.Set("User-Agent", "BookReview/1.0 (course project)")
	res, err := c.HTTP.Do(req)
	if err != nil {
		return fmt.Errorf("%w: %v", ErrUnavailable, err)
	}
	defer res.Body.Close()
	switch {
	case res.StatusCode == http.StatusNotFound:
		return ErrNotFound
	case res.StatusCode != http.StatusOK:
		return fmt.Errorf("%w: status %d", ErrUnavailable, res.StatusCode)
	}
	return json.NewDecoder(http.MaxBytesReader(nil, res.Body, 2<<20)).Decode(v)
}

// CleanDescription รับ description ที่มาได้ 2 แบบ (string หรือ {"type","value"}) แล้วตัดส่วนเกิน
func CleanDescription(raw json.RawMessage) *string {
	if len(raw) == 0 {
		return nil
	}
	var text string
	if err := json.Unmarshal(raw, &text); err != nil {
		var obj struct {
			Value string `json:"value"`
		}
		if json.Unmarshal(raw, &obj) != nil {
			return nil
		}
		text = obj.Value
	}
	text = sepLine.Split(text, 2)[0]           // ตัดส่วน "See also" ท้ายเรื่องย่อ
	text = mdLink.ReplaceAllString(text, "$1") // [ข้อความ](ลิงก์) เหลือแค่ข้อความ
	text = refLine.ReplaceAllString(text, "")  // บรรทัดอ้างอิงลิงก์ [1]: https://...
	text = strings.TrimSpace(text)
	if text == "" {
		return nil
	}
	if utf8.RuneCountInString(text) > 5000 {
		text = string([]rune(text)[:4999]) + "…"
	}
	return &text
}

// Work ดึงรายละเอียดจาก /works/{key}.json แล้วเติมผู้แต่ง ปี และปกจาก search.json (เส้นทางเดียวกับหน้าเว็บ)
func (c *Client) Work(ctx context.Context, key string) (Work, error) {
	if !KeyPattern.MatchString(key) {
		return Work{}, ErrNotFound
	}
	var w struct {
		Title            string          `json:"title"`
		Description      json.RawMessage `json:"description"`
		Covers           []int           `json:"covers"`
		FirstPublishDate string          `json:"first_publish_date"`
		Subjects         []string        `json:"subjects"`
		Authors          []struct {
			Author struct {
				Key string `json:"key"`
			} `json:"author"`
		} `json:"authors"`
	}
	if err := c.getJSON(ctx, "/works/"+key+".json", nil, &w); err != nil {
		return Work{}, err
	}
	out := Work{Key: key, Title: strings.TrimSpace(w.Title), Description: CleanDescription(w.Description), Subjects: w.Subjects}
	if out.Title == "" {
		return Work{}, ErrNotFound // redirect / work ที่ถูกลบ ไม่มีชื่อ
	}
	for _, id := range w.Covers {
		if id > 0 {
			u := fmt.Sprintf("%s/%d-L.jpg", c.Covers, id)
			out.CoverURL = &u
			break
		}
	}
	if m := yearPattern.FindString(w.FirstPublishDate); m != "" {
		var y int
		fmt.Sscan(m, &y)
		out.PublishedYear = &y
	}

	// search.json ให้ author_name และ first_publish_year มาในคำขอเดียว (ถ้าพลาดไม่เป็นไร ใช้ข้อมูลจาก works)
	var s struct {
		Docs []struct {
			Key              string   `json:"key"`
			AuthorName       []string `json:"author_name"`
			FirstPublishYear int      `json:"first_publish_year"`
			CoverI           int      `json:"cover_i"`
		} `json:"docs"`
	}
	params := url.Values{"q": {`key:"/works/` + key + `"`}, "fields": {"key,author_name,first_publish_year,cover_i"}, "limit": {"1"}}
	if err := c.getJSON(ctx, "/search.json", params, &s); err == nil && len(s.Docs) > 0 && s.Docs[0].Key == "/works/"+key {
		d := s.Docs[0]
		out.Authors = d.AuthorName
		if d.FirstPublishYear >= 1 && d.FirstPublishYear <= 2100 {
			y := d.FirstPublishYear
			out.PublishedYear = &y
		}
		if out.CoverURL == nil && d.CoverI > 0 {
			u := fmt.Sprintf("%s/%d-L.jpg", c.Covers, d.CoverI)
			out.CoverURL = &u
		}
	}

	// ไม่ได้ชื่อผู้แต่งจาก search ให้ถามทีละคนจาก /authors/{id}.json (สูงสุด 3 คน)
	if len(out.Authors) == 0 {
		for i, a := range w.Authors {
			if i == 3 || !strings.HasPrefix(a.Author.Key, "/authors/") {
				break
			}
			var au struct {
				Name string `json:"name"`
			}
			if err := c.getJSON(ctx, a.Author.Key+".json", nil, &au); err == nil && strings.TrimSpace(au.Name) != "" {
				out.Authors = append(out.Authors, strings.TrimSpace(au.Name))
			}
		}
	}
	if len(out.Authors) > 3 {
		out.Authors = out.Authors[:3]
	}
	return out, nil
}

// AuthorText ต่อชื่อผู้แต่งด้วยจุลภาค (กติกาเดียวกับ make-seed.mjs) ไม่มีเลยใช้ "Unknown author"
func (w Work) AuthorText() string {
	if len(w.Authors) == 0 {
		return "Unknown author"
	}
	s := strings.Join(w.Authors, ", ")
	if utf8.RuneCountInString(s) > 255 {
		s = string([]rune(s)[:255])
	}
	return s
}

// MatchCategory เลือกหมวดของเราจาก subjects ของ Open Library ตามลำดับหมวด ไม่ตรงเลยคืน ""
func (w Work) MatchCategory(subjects map[string]string, order []string) string {
	lower := make([]string, len(w.Subjects))
	for i, s := range w.Subjects {
		lower[i] = strings.ToLower(s)
	}
	for _, name := range order {
		needle := subjects[name]
		if needle == "" {
			continue
		}
		for _, s := range lower {
			if strings.Contains(s, needle) {
				return name
			}
		}
	}
	return ""
}

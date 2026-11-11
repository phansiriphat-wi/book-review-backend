package auth

import (
	"strings"
	"testing"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

var secret = []byte("test-secret-that-is-at-least-32-bytes-long")

func TestIssueThenParse(t *testing.T) {
	iss := &Issuer{Secret: secret, TTL: time.Hour}
	tok, err := iss.Issue(42, "admin")
	if err != nil {
		t.Fatal(err)
	}
	id, role, err := iss.Parse(tok)
	if err != nil || id != 42 || role != "admin" {
		t.Fatalf("got id=%d role=%q err=%v", id, role, err)
	}
}

func TestParseRejectsWrongSecret(t *testing.T) {
	tok, _ := (&Issuer{Secret: secret, TTL: time.Hour}).Issue(1, "member")
	other := &Issuer{Secret: []byte("another-secret-that-is-also-32-bytes!!"), TTL: time.Hour}
	if _, _, err := other.Parse(tok); err == nil {
		t.Fatal("ตั๋วที่เซ็นด้วย secret อื่นต้องไม่ผ่าน")
	}
}

func TestParseRejectsExpired(t *testing.T) {
	iss := &Issuer{Secret: secret, TTL: -time.Minute}
	tok, _ := iss.Issue(1, "member")
	if _, _, err := iss.Parse(tok); err == nil {
		t.Fatal("ตั๋วหมดอายุต้องไม่ผ่าน")
	}
}

func TestParseRejectsAlgNone(t *testing.T) {
	claims := Claims{Role: "admin", RegisteredClaims: jwt.RegisteredClaims{
		Subject: "1", ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour)),
	}}
	tok, err := jwt.NewWithClaims(jwt.SigningMethodNone, claims).SignedString(jwt.UnsafeAllowNoneSignatureType)
	if err != nil {
		t.Fatal(err)
	}
	if _, _, err := (&Issuer{Secret: secret, TTL: time.Hour}).Parse(tok); err == nil {
		t.Fatal("ตั๋ว alg=none ต้องไม่ผ่าน")
	}
}

func TestParseRejectsTamperedRole(t *testing.T) {
	iss := &Issuer{Secret: secret, TTL: time.Hour}
	tok, _ := iss.Issue(7, "member")
	parts := strings.Split(tok, ".")
	// เปลี่ยน payload เป็นของคนอื่น (role admin) แต่ใช้ลายเซ็นเดิม
	forged, _ := iss.Issue(7, "admin")
	tampered := parts[0] + "." + strings.Split(forged, ".")[1] + "." + parts[2]
	if _, _, err := iss.Parse(tampered); err == nil {
		t.Fatal("ตั๋วที่ถูกแก้ payload ต้องไม่ผ่าน")
	}
}

func TestPasswordHash(t *testing.T) {
	h, err := HashPassword("correct horse battery")
	if err != nil {
		t.Fatal(err)
	}
	if !strings.HasPrefix(h, "$2") || len(h) != 60 {
		t.Fatalf("ไม่ใช่ bcrypt: %q", h)
	}
	if !CheckPassword(h, "correct horse battery") || CheckPassword(h, "wrong") {
		t.Fatal("CheckPassword ผิด")
	}
}

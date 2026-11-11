package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/joho/godotenv/autoload" // โหลด .env ให้เองถ้ามีไฟล์ (ในเครื่อง) บน Render ไม่มีไฟล์ก็เงียบ

	"bookreview/auth"
	"bookreview/handler"
	"bookreview/openlibrary"
	"bookreview/store"
)

func main() {
	secret := os.Getenv("JWT_SECRET")
	if len(secret) < 32 {
		log.Fatal("JWT_SECRET ต้องยาวอย่างน้อย 32 ตัวอักษร")
	}
	dbURL := os.Getenv("DATABASE_URL")
	if dbURL == "" {
		log.Fatal("ต้องตั้ง DATABASE_URL (Connection string ของ Supabase)")
	}
	pool, err := pgxpool.New(context.Background(), dbURL)
	if err != nil {
		log.Fatal(err)
	}
	defer pool.Close()
	ctx, cancel := context.WithTimeout(context.Background(), 15*time.Second)
	defer cancel()
	if err := pool.Ping(ctx); err != nil {
		log.Fatal("ต่อฐานข้อมูลไม่ติด ", err)
	}

	tickets := &auth.Issuer{Secret: []byte(secret), TTL: time.Hour}
	h := &handler.Handler{
		Store:   &store.Store{Pool: pool},
		Tickets: tickets,
		OL:      openlibrary.New(os.Getenv("OPENLIBRARY_BASE")), // ว่าง = https://openlibrary.org
	}
	if covers := os.Getenv("OPENLIBRARY_COVERS"); covers != "" { // ใช้ตอนทดสอบกับ server จำลองเท่านั้น
		h.OL.Covers = strings.TrimRight(covers, "/")
	}

	origins := strings.Split(os.Getenv("ALLOWED_ORIGINS"), ",")

	port := os.Getenv("PORT") // Render ส่งมาให้ ในเครื่องไม่มีก็ใช้ 8080
	if port == "" {
		port = "8080"
	}

	srv := &http.Server{
		Addr:              ":" + port,
		Handler:           routes(h, tickets, origins),
		ReadHeaderTimeout: 10 * time.Second,
	}
	log.Println("Book Review API ฟังอยู่ที่ :"+port, "ต้อนรับ", origins)
	log.Fatal(srv.ListenAndServe())
}

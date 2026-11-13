# Book Review API

Base URL: `http://localhost:8080` (ในเครื่อง) หรือ `https://<service>.onrender.com`
ทุก endpoint ตอบ JSON ยกเว้น 204, error ตอบ `{ "error": { "code": "BAD_RATING", "message": "ให้คะแนนได้ 1 ถึง 5 ดาว" } }`
🔒 = ต้องแนบ `Authorization: Bearer <token>` (ตั๋ว JWT HS256 อายุ 1 ชั่วโมง) · 👑 = ต้องเป็น admin ด้วย (member ได้ 403)

`{ref}` ของหนังสือ = เลขในระบบ (`15`) หรือรหัส work ของ Open Library (`OL27448W`)

| Method | Path | สิทธิ์ | Body / Query | ตอบ |
|---|---|---|---|---|
| GET | `/api/health` | | | `{ status: "ok" }` (ping ฐานข้อมูล ใช้กับ Render) |
| POST | `/api/auth/register` | | `{ name, email, password }` | 201 User (role = member เสมอ) · 409 `EMAIL_TAKEN` |
| POST | `/api/auth/login` | | `{ email, password }` | `{ token, user }` · 401 `BAD_CREDENTIALS` |
| GET | `/api/auth/me` | 🔒 | | User + `reviewCount`, `wishlistCount` · 401 `USER_GONE` |
| PATCH | `/api/auth/profile` | 🔒 | `{ name }` (1–50 ตัวอักษร  id / role / email ส่งมาก็ไม่ถูกใช้) | User ฉบับใหม่ · 400 `BAD_NAME` |
| POST | `/api/auth/change-password` | 🔒 | `{ currentPassword, newPassword }` | `{ token, user }` ตั๋วใบใหม่ · 400 `MISSING_FIELDS` / `BAD_PASSWORD` / `SAME_PASSWORD` / `WRONG_PASSWORD` · 409 `PASSWORD_CHANGED` |
| GET | `/api/me/reviews` | 🔒 | `?page=&pageSize=` | `{ items: Review[] + book { id, title, openlibraryKey, coverUrl }, total, page, pageSize, avgRating }` เฉพาะของตัวเอง |
| GET | `/api/categories` | | | `{ items: [{ name, nameTh, olSubject }] }` |
| GET | `/api/books` | | `?q=&category=&sort=newest\|rating\|title&page=&pageSize=` (สูงสุด 48) | `{ items: Book[], total, page, pageSize }` |
| GET | `/api/books/ratings` | | `?keys=OL1W,OL2W` (สูงสุด 60) | `{ items: [{ openlibraryKey, bookId, avgRating, reviewCount }] }` |
| GET | `/api/books/{ref}` | | | Book · 404 `BOOK_NOT_FOUND` |
| POST | `/api/books` | 👑 | Book input | 201 Book · 400 · 409 `BOOK_EXISTS` |
| PUT | `/api/books/{ref}` | 👑 | Book input | Book |
| DELETE | `/api/books/{ref}` | 👑 | | 204 (รีวิวและ wishlist ของเล่มนี้ถูกลบตาม) |
| GET | `/api/books/{ref}/reviews` | | | `{ bookId, items: Review[], avgRating, reviewCount }` (หนังสือ Open Library ที่ยังไม่มีในระบบได้ `bookId: null`, `items: []`) |
| POST | `/api/books/{ref}/reviews` | 🔒 | `{ rating, comment, category? }` | 201 Review (นำเข้าหนังสือจาก Open Library ก่อนถ้ายังไม่มี) · 409 `ALREADY_REVIEWED` · 502 `OPENLIBRARY_UNAVAILABLE` |
| PUT | `/api/reviews/{id}` | 🔒 | `{ rating, comment }` | Review (เฉพาะเจ้าของ อื่น ๆ 404) |
| DELETE | `/api/reviews/{id}` | 🔒 | | 204 (เจ้าของ หรือ admin) |
| GET | `/api/wishlist` | 🔒 | | `{ items: Book[] }` + `addedAt` |
| POST | `/api/wishlist` | 🔒 | `{ bookId: ref, category? }` | 201 Book (กดซ้ำได้ ไม่เพิ่มแถวซ้ำ) |
| DELETE | `/api/wishlist/{ref}` | 🔒 | | 204 · 404 `NOT_IN_WISHLIST` |
| GET | `/api/admin/stats` | 👑 | | `{ books, users, admins, reviews, wishlists, avgRating, booksByCategory, topRated, newestUsers, latestReviews }` |
| GET | `/api/admin/users` | 👑 | | `{ items: User[] + reviewCount, wishlistCount }` (ดูอย่างเดียว) |
| GET | `/api/admin/reviews` | 👑 | `?q=&page=&pageSize=` | `{ items: Review[] + book, total, page, pageSize }` |
| GET | `/api/admin/books/{ref}` | 👑 | | `{ book, impact: { reviews, wishlists } }` (ใช้ในกล่องยืนยันการลบ) |

**Book input**: `{ title, author, category, description?, coverUrl?, publishedYear?, openlibraryKey? }`
ตรวจ: title/author 1–255 ตัว, category ต้องมีจริง, description ≤ 5000, coverUrl ต้อง `https://` ≤ 500, publishedYear 1 ถึงปีหน้า, openlibraryKey รูปแบบ `OL\d+W`

**Validation รีวิว**: rating จำนวนเต็ม 1–5, comment 10–2000 ตัวอักษร (นับตัวอักษร ไม่ใช่ไบต์)

## ตัวอย่าง

```bash
API=http://localhost:8080
curl -s -X POST $API/api/auth/register -H 'Content-Type: application/json' \
  -d '{"name":"Mali","email":"mali@example.com","password":"mali-pass-1"}'
TOKEN=$(curl -s -X POST $API/api/auth/login -H 'Content-Type: application/json' \
  -d '{"email":"mali@example.com","password":"mali-pass-1"}' | jq -r .token)
curl -s -X POST $API/api/books/OL27448W/reviews -H "Authorization: Bearer $TOKEN" -H 'Content-Type: application/json' \
  -d '{"rating":5,"comment":"อ่านสนุกมาก วางไม่ลง"}'
curl -s $API/api/books/OL27448W/reviews
```

## โปรไฟล์และการเปลี่ยนรหัสผ่าน

- ทุกเส้นทางใช้เลขผู้ใช้จากตั๋วที่ตรวจแล้วเท่านั้น ไม่มีช่องให้ระบุ id ของคนอื่น ผู้ใช้จึงแก้ได้แค่ข้อมูลของตัวเอง
- `WRONG_PASSWORD` (รหัสปัจจุบันผิด) ตอบ 400 ไม่ใช่ 401 เพราะ 401 แปลว่าตั๋วใช้ไม่ได้ และหน้าเว็บจะพาออกจากระบบ
- รหัสผ่านใหม่เก็บเป็น bcrypt แบบเดียวกับตอนสมัคร ไม่มีการ log รหัสผ่าน ตั๋ว หรือ hash และไม่ส่ง hash กลับ
- เปลี่ยนรหัสสำเร็จได้ตั๋วใบใหม่ ตั๋วใบเก่าที่ออกไปแล้ว (เช่น บนอุปกรณ์อื่น) ยังใช้ได้จนหมดอายุ ไม่เกิน 1 ชั่วโมง เพราะตั๋วเป็น JWT ที่ไม่ได้เก็บในฐานข้อมูล

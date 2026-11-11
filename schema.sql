-- Book Review database schema (PostgreSQL 15+ / Supabase)
-- ที่มาของข้อมูลหนังสือตั้งต้น: Open Library (https://openlibrary.org)  ดูคำอธิบายทั้งหมดใน docs/db-schema.md
-- รันครั้งเดียวบนฐานข้อมูลว่าง:  psql "$DATABASE_URL" -f schema.sql   แล้วตามด้วย seed.sql
-- ไฟล์นี้ไม่มีรหัสผ่านหรือข้อมูลลับใด ๆ  admin คนแรกสร้างตามขั้นตอนใน promote-admin.sql

BEGIN;

-- ===========================================================================
-- ข้อมูลหนังสือ
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- categories: หมวดหมู่หนังสือ (แนวเดียวกับตาราง genres ของ MovieHub)
-- ใช้ทำ chip กรองในหน้า Books และ dropdown ในฟอร์มหลังบ้าน ผ่าน GET /api/categories
-- ---------------------------------------------------------------------------
CREATE TABLE categories (
    name        VARCHAR(50)  PRIMARY KEY,           -- ชื่อที่เก็บใน books.category และส่งออก API เช่น 'Fantasy'
    name_th     VARCHAR(50)  NOT NULL,              -- ชื่อไทยสำหรับแสดงบนหน้าเว็บ
    ol_subject  VARCHAR(100),                       -- คำค้น subject ของ Open Library (หน้า Books และ make-seed.mjs ใช้)  NULL = หมวดภายใน เช่น General
    position    SMALLINT     NOT NULL UNIQUE        -- ลำดับการแสดงผล
);

-- ---------------------------------------------------------------------------
-- books: หนังสือ 1 แถวต่อ 1 เล่ม  ข้อมูลหลักของระบบ (admin เพิ่ม แก้ ลบได้)
-- id เป็นเลขของเราเอง ส่วน openlibrary_key เก็บรหัส work ของ Open Library ไว้กันนำเข้าเล่มเดิมซ้ำ
-- หนังสือจาก Open Library ถูกบันทึกลงตารางนี้อัตโนมัติเมื่อมีคนรีวิวหรือเพิ่ม wishlist ครั้งแรก (ดู docs/db-schema.md)
-- ---------------------------------------------------------------------------
CREATE TABLE books (
    id              BIGSERIAL     PRIMARY KEY,
    openlibrary_key VARCHAR(30)   UNIQUE CHECK (openlibrary_key ~ '^OL[0-9]+W$'),  -- เช่น 'OL27448W'  เล่มที่ admin เพิ่มเองไม่มี = NULL (NULL ซ้ำกันได้)
    title           VARCHAR(255)  NOT NULL CHECK (char_length(btrim(title)) >= 1),
    author          VARCHAR(255)  NOT NULL CHECK (char_length(btrim(author)) >= 1),
    description     TEXT          CHECK (description IS NULL OR char_length(description) <= 5000),
    category        VARCHAR(50)   NOT NULL REFERENCES categories (name) ON UPDATE CASCADE,
    cover_url       VARCHAR(500)  CHECK (cover_url IS NULL OR cover_url ~ '^https://'),  -- รูปต้องเป็น https เพราะหน้าเว็บบน Vercel เป็น https
    published_year  SMALLINT      CHECK (published_year BETWEEN 1 AND 2100),
    created_at      TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ   NOT NULL DEFAULT now()
);

-- ค้นหาจากชื่อหรือผู้แต่ง (GET /api/books?q=) และกรองตามหมวด (GET /api/books?category=)
CREATE INDEX idx_books_title_lower  ON books (lower(title));
CREATE INDEX idx_books_author_lower ON books (lower(author));
CREATE INDEX idx_books_category     ON books (category);

-- ===========================================================================
-- ข้อมูลของเว็บเราเอง (ไม่ได้มาจาก Open Library)
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- users: สมาชิกและผู้ดูแลระบบ
-- ---------------------------------------------------------------------------
CREATE TABLE users (
    id             BIGSERIAL     PRIMARY KEY,
    name           VARCHAR(50)   NOT NULL CHECK (char_length(btrim(name)) >= 1),
    email          VARCHAR(255)  NOT NULL CHECK (position('@' IN email) > 1),
    -- bcrypt จาก golang.org/x/crypto/bcrypt เท่านั้น CHECK นี้กันการเผลอใส่รหัสผ่านตรง ๆ ลงตาราง
    password_hash  VARCHAR(255)  NOT NULL CHECK (password_hash ~ '^\$2[aby]\$[0-9]{2}\$[./A-Za-z0-9]{53}$'),
    role           VARCHAR(10)   NOT NULL DEFAULT 'member' CHECK (role IN ('member', 'admin')),
    created_at     TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ   NOT NULL DEFAULT now()
);

-- อีเมลห้ามซ้ำโดยไม่สนตัวพิมพ์เล็กใหญ่ (Go lower() ก่อนบันทึกและก่อนค้นตอน login)
CREATE UNIQUE INDEX uq_users_email ON users (lower(email));

-- ---------------------------------------------------------------------------
-- reviews: รีวิว + คะแนนดาว 1–5 ในแถวเดียวกัน
-- สมาชิก 1 คนรีวิวหนังสือ 1 เล่มได้ 1 ครั้ง (แก้ไขได้ด้วย PUT /api/reviews/{id})
-- ---------------------------------------------------------------------------
CREATE TABLE reviews (
    id          BIGSERIAL    PRIMARY KEY,
    user_id     BIGINT       NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    book_id     BIGINT       NOT NULL REFERENCES books (id) ON DELETE CASCADE,
    rating      SMALLINT     NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT         NOT NULL CHECK (char_length(btrim(comment)) BETWEEN 10 AND 2000),  -- กติกาเดียวกับหน้าเว็บ
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ  NOT NULL DEFAULT now(),
    UNIQUE (user_id, book_id)
);

CREATE INDEX idx_reviews_book_created ON reviews (book_id, created_at DESC);
CREATE INDEX idx_reviews_created      ON reviews (created_at DESC);   -- GET /api/admin/reviews เรียงใหม่สุดก่อน

-- คะแนนเฉลี่ยต่อเล่ม คำนวณสดจาก reviews ไม่ต้องเก็บซ้ำ (แนวเดียวกับ movie_vote_stats)
-- security_invoker: view ใช้สิทธิ์ของผู้เรียก จึงไม่ข้าม Row Level Security ด้านล่าง
CREATE VIEW book_rating_stats WITH (security_invoker = true) AS
SELECT book_id,
       count(*)                 AS review_count,
       round(avg(rating), 1)    AS avg_rating
FROM reviews
GROUP BY book_id;

-- ---------------------------------------------------------------------------
-- wishlists: หนังสือที่สมาชิกอยากอ่าน  เล่มเดิมใส่ซ้ำไม่ได้
-- ---------------------------------------------------------------------------
CREATE TABLE wishlists (
    id          BIGSERIAL    PRIMARY KEY,
    user_id     BIGINT       NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    book_id     BIGINT       NOT NULL REFERENCES books (id) ON DELETE CASCADE,
    added_at    TIMESTAMPTZ  NOT NULL DEFAULT now(),
    UNIQUE (user_id, book_id)
);

CREATE INDEX idx_wishlists_user_added ON wishlists (user_id, added_at DESC);

-- ---------------------------------------------------------------------------
-- Supabase: ปิดทางเข้าตารางผ่าน Data API (anon key)
-- เปิด RLS โดยไม่สร้าง policy = role anon/authenticated อ่านเขียนไม่ได้เลย
-- Go ต่อด้วย DATABASE_URL ในฐานะเจ้าของตาราง จึงไม่ถูก RLS กัน ทุกคำขอต้องผ่าน Go เท่านั้น
-- (บน PostgreSQL ในเครื่องคำสั่งนี้ไม่มีผลอะไร)
-- ---------------------------------------------------------------------------
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE books      ENABLE ROW LEVEL SECURITY;
ALTER TABLE users      ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews    ENABLE ROW LEVEL SECURITY;
ALTER TABLE wishlists  ENABLE ROW LEVEL SECURITY;

-- ---------------------------------------------------------------------------
-- seed: หมวดหมู่ทั้งหมด (เปลี่ยนน้อยมาก จึงใส่ไว้ในไฟล์นี้แบบเดียวกับ genres ของ MovieHub)
-- ---------------------------------------------------------------------------
INSERT INTO categories (name, name_th, ol_subject, position) VALUES
    ('Fantasy',         'แฟนตาซี',          'fantasy',             1),
    ('Science Fiction', 'นิยายวิทยาศาสตร์',   'science fiction',     2),
    ('Mystery',         'สืบสวนสอบสวน',      'mystery',             3),
    ('Romance',         'โรแมนติก',          'romance',             4),
    ('Horror',          'สยองขวัญ',          'horror',              5),
    ('History',         'ประวัติศาสตร์',       'history',             6),
    ('Biography',       'ชีวประวัติ',          'biography',           7),
    ('Children',        'หนังสือเด็ก',         'children''s fiction', 8),
    ('General',         'ทั่วไป',             NULL,                  9);   -- หนังสือที่จัดเข้าหมวดอื่นไม่ได้

COMMIT;

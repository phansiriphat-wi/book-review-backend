-- ทดสอบ constraint ของ schema.sql  ทั้งไฟล์อยู่ใน transaction เดียวแล้ว ROLLBACK ตอนจบ ข้อมูลจริงไม่เปลี่ยน
--   psql "$DATABASE_URL" -f db-test.sql
-- ผลที่ถูกต้อง: ทุกบรรทัดเป็น PASS และ failed = 0  (ใช้ได้ทั้งก่อนและหลังรัน seed.sql)
-- แนะนำให้รันกับฐานข้อมูลในเครื่อง (docker compose) ก่อนรันบน Supabase

\set QUIET on
\set ON_ERROR_STOP on
BEGIN;

CREATE TEMP TABLE results (n serial, name text, ok boolean, detail text);

-- รันคำสั่งใน savepoint ของตัวเอง แล้วบันทึกว่าพัง (should_fail = true) หรือผ่านตามที่คาดไว้
CREATE FUNCTION pg_temp.expect(name text, stmt text, should_fail boolean) RETURNS void AS $$
BEGIN
  BEGIN
    EXECUTE stmt;
    INSERT INTO results (name, ok, detail) VALUES (name, NOT should_fail, 'no error');
  EXCEPTION WHEN OTHERS THEN
    INSERT INTO results (name, ok, detail) VALUES (name, should_fail, SQLSTATE || ' ' || SQLERRM);
  END;
END $$ LANGUAGE plpgsql;

-- hash รูปแบบ bcrypt (ของจริงมาจาก Go เสมอ) ใช้แค่ผ่าน CHECK รูปแบบ
\set h '$2a$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUVWXYZ01234'

-- ---------- users ----------
SELECT pg_temp.expect('users: insert ok', format(
  'INSERT INTO users (name, email, password_hash) VALUES (%L, %L, %L), (%L, %L, %L)',
  'Test A', 'test-a@db-test.local', :'h', 'Test B', 'test-b@db-test.local', :'h'), false);
SELECT pg_temp.expect('users: default role = member',
  $q$DO $d$ BEGIN IF (SELECT role FROM users WHERE email = 'test-a@db-test.local') <> 'member' THEN RAISE EXCEPTION 'role'; END IF; END $d$$q$, false);
SELECT pg_temp.expect('users: email ซ้ำ (ต่างตัวพิมพ์) ต้องพัง', format(
  'INSERT INTO users (name, email, password_hash) VALUES (%L, %L, %L)', 'X', 'TEST-A@db-test.local', :'h'), true);
SELECT pg_temp.expect('users: รหัสผ่าน plain text ต้องพัง',
  $q$INSERT INTO users (name, email, password_hash) VALUES ('P', 'p@db-test.local', 'password1234')$q$, true);
SELECT pg_temp.expect('users: name ว่างต้องพัง', format(
  'INSERT INTO users (name, email, password_hash) VALUES (%L, %L, %L)', '   ', 'n@db-test.local', :'h'), true);
SELECT pg_temp.expect('users: role อื่นต้องพัง', format(
  'INSERT INTO users (name, email, password_hash, role) VALUES (%L, %L, %L, %L)', 'R', 'r@db-test.local', :'h', 'root'), true);

-- ---------- books ----------
SELECT pg_temp.expect('books: insert ok (ไม่มี openlibrary_key 2 เล่มได้)',
  $q$INSERT INTO books (title, author, category, published_year, cover_url)
     VALUES ('DB Test Book 1', 'Tester', 'Fantasy', 2001, 'https://covers.openlibrary.org/b/id/1-L.jpg'),
            ('DB Test Book 2', 'Tester', 'History', NULL, NULL)$q$, false);
SELECT pg_temp.expect('books: insert ok (มี openlibrary_key)',
  $q$INSERT INTO books (openlibrary_key, title, author, category) VALUES ('OL999999001W', 'DB Test Book 3', 'Tester', 'Mystery')$q$, false);
SELECT pg_temp.expect('books: openlibrary_key ซ้ำต้องพัง',
  $q$INSERT INTO books (openlibrary_key, title, author, category) VALUES ('OL999999001W', 'Dup', 'Tester', 'Mystery')$q$, true);
SELECT pg_temp.expect('books: หมวดที่ไม่มีต้องพัง',
  $q$INSERT INTO books (title, author, category) VALUES ('B', 'A', 'Cooking')$q$, true);
SELECT pg_temp.expect('books: title ว่างต้องพัง',
  $q$INSERT INTO books (title, author, category) VALUES ('  ', 'A', 'Fantasy')$q$, true);
SELECT pg_temp.expect('books: author ว่างต้องพัง',
  $q$INSERT INTO books (title, author, category) VALUES ('B', '', 'Fantasy')$q$, true);
SELECT pg_temp.expect('books: cover แบบ http ต้องพัง',
  $q$INSERT INTO books (title, author, category, cover_url) VALUES ('B', 'A', 'Fantasy', 'http://x/y.jpg')$q$, true);
SELECT pg_temp.expect('books: ปี 0 ต้องพัง',
  $q$INSERT INTO books (title, author, category, published_year) VALUES ('B', 'A', 'Fantasy', 0)$q$, true);
SELECT pg_temp.expect('categories: เปลี่ยนชื่อหมวดแล้ว books ตามไปด้วย',
  $q$DO $d$ BEGIN
       UPDATE categories SET name = 'DBTEST-Fantasy' WHERE name = 'Fantasy';
       IF NOT EXISTS (SELECT 1 FROM books WHERE title = 'DB Test Book 1' AND category = 'DBTEST-Fantasy') THEN RAISE EXCEPTION 'cascade'; END IF;
       UPDATE categories SET name = 'Fantasy' WHERE name = 'DBTEST-Fantasy';
     END $d$$q$, false);
SELECT pg_temp.expect('categories: ลบหมวดที่มีหนังสือต้องพัง',
  $q$DELETE FROM categories WHERE name = 'Fantasy'$q$, true);

-- ---------- reviews ----------
SELECT pg_temp.expect('reviews: insert ok (2 คน เล่มเดียวกัน)',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment)
     SELECT u.id, b.id, CASE u.email WHEN 'test-a@db-test.local' THEN 5 ELSE 2 END, 'Review written by db-test'
     FROM users u, books b WHERE u.email LIKE 'test-_@db-test.local' AND b.title = 'DB Test Book 1'$q$, false);
SELECT pg_temp.expect('reviews: ได้ 2 แถวจริง',
  $q$DO $d$ BEGIN IF (SELECT count(*) FROM reviews r JOIN books b ON b.id = r.book_id WHERE b.title = 'DB Test Book 1') <> 2 THEN RAISE EXCEPTION 'count'; END IF; END $d$$q$, false);
SELECT pg_temp.expect('reviews: คนเดิมรีวิวเล่มเดิมซ้ำต้องพัง',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment)
     SELECT u.id, b.id, 4, 'Second review attempt' FROM users u, books b
     WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 1'$q$, true);
SELECT pg_temp.expect('reviews: rating 0 ต้องพัง',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment) SELECT u.id, b.id, 0, 'Rating zero test'
     FROM users u, books b WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'$q$, true);
SELECT pg_temp.expect('reviews: rating 6 ต้องพัง',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment) SELECT u.id, b.id, 6, 'Rating six test'
     FROM users u, books b WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'$q$, true);
SELECT pg_temp.expect('reviews: comment สั้นกว่า 10 ตัวต้องพัง',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment) SELECT u.id, b.id, 3, '   short   '
     FROM users u, books b WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'$q$, true);
SELECT pg_temp.expect('reviews: book ที่ไม่มีต้องพัง',
  $q$INSERT INTO reviews (user_id, book_id, rating, comment) SELECT id, -1, 3, 'Missing book test'
     FROM users WHERE email = 'test-a@db-test.local'$q$, true);
SELECT pg_temp.expect('book_rating_stats: เฉลี่ย (5+2)/2 = 3.5 และนับ 2',
  $q$DO $d$ BEGIN
       IF (SELECT (avg_rating, review_count) FROM book_rating_stats s JOIN books b ON b.id = s.book_id
           WHERE b.title = 'DB Test Book 1') IS DISTINCT FROM (3.5::numeric, 2::bigint) THEN RAISE EXCEPTION 'stats'; END IF;
     END $d$$q$, false);

-- ---------- wishlists ----------
SELECT pg_temp.expect('wishlists: insert ok',
  $q$INSERT INTO wishlists (user_id, book_id) SELECT u.id, b.id FROM users u, books b
     WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'$q$, false);
SELECT pg_temp.expect('wishlists: เล่มเดิมซ้ำต้องพัง',
  $q$INSERT INTO wishlists (user_id, book_id) SELECT u.id, b.id FROM users u, books b
     WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'$q$, true);
SELECT pg_temp.expect('wishlists: ON CONFLICT DO NOTHING กดซ้ำได้ (แบบที่ POST /api/wishlist จะใช้)',
  $q$INSERT INTO wishlists (user_id, book_id) SELECT u.id, b.id FROM users u, books b
     WHERE u.email = 'test-a@db-test.local' AND b.title = 'DB Test Book 2'
     ON CONFLICT (user_id, book_id) DO NOTHING$q$, false);

-- ---------- ON DELETE CASCADE ----------
SELECT pg_temp.expect('ลบหนังสือ: รีวิวของเล่มนั้นหายตาม',
  $q$DO $d$ DECLARE bid bigint; BEGIN
       SELECT id INTO bid FROM books WHERE title = 'DB Test Book 1';
       DELETE FROM books WHERE id = bid;
       IF EXISTS (SELECT 1 FROM reviews WHERE book_id = bid) THEN RAISE EXCEPTION 'orphan reviews'; END IF;
     END $d$$q$, false);
SELECT pg_temp.expect('ลบสมาชิก: wishlist ของคนนั้นหายตาม',
  $q$DO $d$ DECLARE uid bigint; BEGIN
       SELECT id INTO uid FROM users WHERE email = 'test-a@db-test.local';
       DELETE FROM users WHERE id = uid;
       IF EXISTS (SELECT 1 FROM wishlists WHERE user_id = uid) THEN RAISE EXCEPTION 'orphan wishlist'; END IF;
     END $d$$q$, false);

\set QUIET off
SELECT CASE WHEN ok THEN 'PASS' ELSE 'FAIL' END AS result, name, left(detail, 80) AS detail FROM results ORDER BY n;
SELECT count(*) FILTER (WHERE ok) AS passed, count(*) FILTER (WHERE NOT ok) AS failed FROM results;

ROLLBACK;

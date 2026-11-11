-- seed.sql: หนังสือตั้งต้นจาก Open Library
-- ไฟล์นี้ถูกเขียนทับโดย make-seed.mjs  วิธีสร้าง (ต้องต่ออินเทอร์เน็ตได้ Node 18+):
--     node make-seed.mjs
-- แล้ว commit ไฟล์ seed.sql ที่ได้ ก่อนรัน:  psql "$DATABASE_URL" -f seed.sql
--
-- ยังไม่ได้สร้างข้อมูลจริง: เวอร์ชันนี้จึงไม่ใส่หนังสือ (ระบบยังใช้งานได้ครบ เพราะหน้า Books ดึงจาก Open Library โดยตรง
-- และหนังสือจะถูกบันทึกเข้าตาราง books อัตโนมัติเมื่อมีคนรีวิวหรือเพิ่ม wishlist)
-- หมวดหมู่ (categories) อยู่ใน schema.sql แล้ว

BEGIN;
COMMIT;

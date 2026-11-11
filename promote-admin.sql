-- ตั้ง admin คนแรกอย่างปลอดภัย: ไฟล์นี้ไม่มีรหัสผ่าน และไม่สร้างบัญชีเอง
--
-- ขั้นตอน
--   1) สมัครบัญชีตามปกติผ่านหน้า Register หรือ POST /api/auth/register
--      (Go เป็นคนแปลงรหัสผ่านเป็น bcrypt รหัสจริงไม่เคยผ่าน SQL หรือ git)
--   2) เลื่อนบัญชีนั้นเป็น admin ด้วยอีเมล:
--        psql "$DATABASE_URL" -v email='you@example.com' -f promote-admin.sql
--      บน Supabase SQL Editor (ใช้ตัวแปร psql ไม่ได้) ให้รันคำสั่ง UPDATE ด้านล่างโดยแทนอีเมลเอง
--   3) ออกจากระบบแล้วเข้าใหม่ เพราะ role อยู่ในตั๋ว JWT ใบเดิม (หมดอายุภายใน 1 ชั่วโมง)

\set ON_ERROR_STOP on

\if :{?email}
\else
    \echo 'ต้องระบุอีเมล:  psql "$DATABASE_URL" -v email=you@example.com -f promote-admin.sql'
    \quit
\endif

SELECT count(*) = 1 AS found FROM users WHERE lower(email) = lower(:'email') \gset

\if :found
    UPDATE users SET role = 'admin', updated_at = now()
    WHERE lower(email) = lower(:'email')
    RETURNING id, name, email, role;
\else
    \echo 'ไม่พบบัญชีอีเมลนี้ ให้สมัครสมาชิกก่อน แล้วค่อยรันไฟล์นี้อีกครั้ง'
\endif

// สร้าง seed.sql จาก Open Library: หนังสือหมวดละ PER_CATEGORY เล่ม ตามหมวดในตาราง categories
// วิธีรัน (Node 18+ ใช้ fetch ในตัว ไม่ต้องติดตั้งอะไรเพิ่ม):  node make-seed.mjs
// ต้องรัน schema.sql ก่อน แล้วค่อยรัน seed.sql ที่ได้  (Open Library ไม่ต้องใช้ API key)
import { writeFileSync } from 'node:fs';

const BASE = process.env.OPENLIBRARY_BASE || 'https://openlibrary.org';   // เปลี่ยนได้เฉพาะตอนทดสอบกับ server จำลอง
const COVERS = 'https://covers.openlibrary.org/b/id';
const PER_CATEGORY = 50;
const OUT = new URL('./seed.sql', import.meta.url);

// ต้องตรงกับ INSERT INTO categories ใน schema.sql (name ผิดจะติด foreign key ตอนรัน seed.sql)
const CATEGORIES = [
  { name: 'Fantasy',         subject: 'fantasy' },
  { name: 'Science Fiction', subject: 'science fiction' },
  { name: 'Mystery',         subject: 'mystery' },
  { name: 'Romance',         subject: 'romance' },
  { name: 'Horror',          subject: 'horror' },
  { name: 'History',         subject: 'history' },
  { name: 'Biography',       subject: 'biography' },
  { name: 'Children',        subject: "children's fiction" },
];

// Open Library ขอให้บอกว่าใครเรียก (ใส่อีเมลติดต่อได้ทาง OL_CONTACT ไม่บังคับ)
const HEADERS = { 'User-Agent': `BookReview-seed/1.0${process.env.OL_CONTACT ? ` (${process.env.OL_CONTACT})` : ''}` };

async function getJSON(path, params = {}) {
  const url = new URL(BASE + path);
  for (const [name, value] of Object.entries(params)) url.searchParams.set(name, value);
  for (let attempt = 1; ; attempt++) {
    const res = await fetch(url, { headers: HEADERS });
    if (res.ok) return res.json();
    if (attempt < 3 && (res.status === 429 || res.status >= 500)) {   // server ยุ่ง รอแล้วลองใหม่
      await new Promise(r => setTimeout(r, 2000 * attempt));
      continue;
    }
    throw new Error(`Open Library ตอบกลับ ${res.status} (${path})`);
  }
}

// ค้นหนังสือภาษาอังกฤษในหมวดนั้น เก็บเฉพาะเล่มที่มีปกและผู้แต่ง และยังไม่ถูกหมวดอื่นเลือกไป
async function collect(category, seen) {
  const data = await getJSON('/search.json', {
    q: `subject:"${category.subject}" language:eng`,
    fields: 'key,title,author_name,first_publish_year,cover_i',
    limit: PER_CATEGORY * 3,
  });
  const picked = [];
  for (const doc of data.docs) {
    if (!/^\/works\/OL\d+W$/.test(doc.key || '')) continue;                      // รูปแบบเดียวกับ CHECK ใน schema.sql
    if (!doc.cover_i || !doc.author_name?.length || !doc.title || seen.has(doc.key)) continue;
    seen.add(doc.key);
    picked.push({ ...doc, category: category.name });
    if (picked.length === PER_CATEGORY) break;
  }
  return picked;
}

// เรื่องย่อมีเฉพาะใน /works/{id}.json  และมาได้ 2 แบบ: string หรือ { type, value }
function cleanDescription(d) {
  let text = typeof d === 'string' ? d : d?.value;
  if (!text) return null;
  text = text.split(/\n-{3,}/)[0]                          // ตัดส่วน "See also" ท้ายเรื่องย่อ
    .replace(/\[([^\]]+)\]\([^)]*\)/g, '$1')               // [ข้อความ](ลิงก์) เหลือแค่ข้อความ
    .replace(/^\s*\[\d+\]:.*$/gm, '')                      // บรรทัดอ้างอิงลิงก์ [1]: https://...
    .trim();
  if (!text) return null;
  return text.length > 5000 ? text.slice(0, 4999) + '…' : text;
}

async function getDescription(book) {
  try {
    const work = await getJSON(`${book.key}.json`);       // book.key เช่น '/works/OL27448W'
    return cleanDescription(work.description);
  } catch {
    return null;                                          // ไม่มีเรื่องย่อก็ยังเก็บเล่มนี้ได้
  }
}

// ทำทีละ size เล่ม เพื่อไม่ยิง Open Library พร้อมกันเยอะเกิน
async function inBatches(items, size, fn) {
  const out = [];
  for (let i = 0; i < items.length; i += size) {
    out.push(...await Promise.all(items.slice(i, i + size).map(fn)));
  }
  return out;
}

function sql(v) {
  if (v === null || v === undefined || v === '') return 'NULL';
  if (typeof v === 'number') return String(v);
  return `'${String(v).replace(/'/g, "''")}'`;
}

function toRow(b, description) {
  const year = Number.isInteger(b.first_publish_year) && b.first_publish_year >= 1 && b.first_publish_year <= 2100
    ? b.first_publish_year : null;
  return [
    b.key.replace('/works/', ''),                          // openlibrary_key
    b.title.slice(0, 255),
    b.author_name.slice(0, 3).join(', ').slice(0, 255),    // ผู้แต่งหลายคนต่อด้วยจุลภาค สูงสุด 3 คน
    description,
    b.category,
    `${COVERS}/${b.cover_i}-L.jpg`,
    year,
  ];
}

const seen = new Set();
const books = [];
for (const category of CATEGORIES) {
  const picked = await collect(category, seen);
  console.log(`${category.name}: ${picked.length} เล่ม`);
  books.push(...picked);
}
if (books.length === 0) throw new Error('ไม่ได้หนังสือเลย ตรวจการเชื่อมต่อ Open Library');
const descriptions = await inBatches(books, 5, getDescription);

const lines = [
  `-- สร้างโดย make-seed.mjs เมื่อ ${new Date().toISOString()}`,
  `-- ${CATEGORIES.length} หมวด รวม ${books.length} เล่ม  ข้อมูลจาก Open Library (https://openlibrary.org)`,
  '-- รันซ้ำได้: เล่มที่มี openlibrary_key อยู่แล้วจะถูกข้าม (ไม่ทับข้อมูลที่ admin แก้ไว้)',
  '',
  'BEGIN;',
  '',
  'INSERT INTO books (openlibrary_key, title, author, description, category, cover_url, published_year)',
  'VALUES',
  books.map((b, i) => '    (' + toRow(b, descriptions[i]).map(sql).join(', ') + ')').join(',\n'),
  'ON CONFLICT (openlibrary_key) DO NOTHING;',
  '',
  'COMMIT;',
  '',
];

writeFileSync(OUT, lines.join('\n'));
console.log(`เขียน ${OUT.pathname}: ${books.length} เล่ม (มีเรื่องย่อ ${descriptions.filter(Boolean).length} เล่ม)`);

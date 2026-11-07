use sakila;

-- TASK1: ใช้  query SELECT * FROM lab_customer WHERE last_name = 'SMITH' 
-- เพราะเป็นการค้นหาแบบ Equality ที่สามารถใช้ Index บน last_name เพื่อช่วยลดจำนวนแถวที่ต้องตรวจสอบได้

CREATE INDEX idx_customer_last_name
ON lab_customer(last_name);

EXPLAIN FORMAT=TRADITIONAL
SELECT *
FROM lab_customer
WHERE last_name = 'SMITH';

-- MySQL เลือกใช้ Index idx_customer_last_name เพราะ WHERE last_name = 'SMITH' เป็นการค้นหานามสกุลแบบ Equality 
-- โดยผล EXPLAIN แสดง type = ref และ rows = 1 แสดงว่าคาดว่าจะตรวจสอบข้อมูลเพียง 1 แถว จึงช่วยลดจำนวนแถวที่ต้องตรวจสอบ


-- TASK 2

CREATE INDEX idx_customer_date
ON lab_payment(customer_id, payment_date);

CREATE INDEX idx_date_customer
ON lab_payment(payment_date, customer_id);

EXPLAIN FORMAT=TRADITIONAL
SELECT customer_id, payment_date
FROM lab_payment
FORCE INDEX (idx_customer_date)
WHERE customer_id = 1
AND payment_date >= '2005-07-01';
-- Index 1 เหมาะกับ Query นี้มากกว่า เพราะเริ่มค้นหาจาก customer_id
-- ที่ระบุค่าชัดเจนก่อน แล้วค่อยค้นหาตามช่วงวันที่
-- ทำให้สามารถจำกัดจำนวนข้อมูลที่ต้องตรวจสอบได้ดีขึ้น
-- โดย EXPLAIN แสดง rows = 1 และ filtered = 100%
  
EXPLAIN FORMAT=TRADITIONAL
SELECT customer_id, payment_date
FROM lab_payment
FORCE INDEX (idx_date_customer)
WHERE customer_id = 1
AND payment_date >= '2005-07-01';
-- Index 2 เริ่มค้นหาจากช่วงวันที่ก่อน ทำให้อาจต้องตรวจสอบ
-- รายการชำระเงินของลูกค้าหลายคน ก่อนกรองเฉพาะ customer_id ที่ต้องการ
-- โดย EXPLAIN แสดง rows = 1 และ filtered = 5%

-- ตาม Leftmost Prefix Rule คอลัมน์ที่อยู่ซ้ายสุดของ Index
-- มีความสำคัญ เพราะเป็นจุดเริ่มต้นในการค้นหาข้อมูล
-- จึงควรเลือกคอลัมน์ที่ถูกใช้ค้นหาบ่อยและช่วยกรองข้อมูลได้ดี
-- สำหรับ Query นี้ customer_id เหมาะจะอยู่ก่อน payment_date
-- เพราะค้นหาด้วยค่าที่แน่นอน แล้วจึงค้นหาตามช่วงวันที่


-- TASK 3
EXPLAIN FORMAT=TRADITIONAL
SELECT *
FROM lab_payment
WHERE amount = 0.99;

EXPLAIN ANALYZE FORMAT=TREE
SELECT *
FROM lab_payment
WHERE amount = 0.99;

-- ก่อนสร้าง Index MySQL ใช้วิธี Full Table Scan
-- เพราะยังไม่มี Index ที่เหมาะสมกับเงื่อนไข amount = 0.99
-- โดยตรวจสอบข้อมูลจริง 16,044 แถว และพบข้อมูลที่ตรงเงื่อนไข 2,977 แถว
-- ใช้เวลาประมาณ 3.85 ms

CREATE INDEX idx_payment_amount
ON lab_payment(amount);

EXPLAIN FORMAT=TRADITIONAL
SELECT *
FROM lab_payment
WHERE amount = 0.99;

EXPLAIN ANALYZE FORMAT=TREE
SELECT *
FROM lab_payment
WHERE amount = 0.99;

-- หลังสร้าง Index MySQL เลือกใช้ idx_payment_amount
-- ทำให้จำนวนแถวที่อ่านลดลงเหลือ 2,977 แถว
-- โดยใช้เวลาทำงานเฉลี่ยประมาณ 3.71 ms 

-- สรุป Index ช่วยลดจำนวนแถวที่อ่านจาก 16,044 เหลือ 2,977 แถว
-- และใช้เวลาเฉลี่ย 3.71 ms เทียบกับ 3.85 ms ก่อนสร้าง Index
-- แสดงว่า Index ช่วยลดการอ่านข้อมูลได้ชัดเจน
-- แต่เพิ่มความเร็วได้เพียงเล็กน้อย เพราะยังต้องอ่านข้อมูล
-- ของแต่ละแถวเพิ่มเติมจากตาราง เนื่องจากใช้ SELECT *


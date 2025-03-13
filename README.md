# SQL
About SQL (Structured Query Language)

# Constraints คือ ข้อกำหนดที่ใช้ควบคุมค่าข้อมูลในตาราง เพื่อให้แน่ใจว่าข้อมูลมีความถูกต้อง (Accuracy) และความสมบูรณ์ (Integrity)
<b>1. PRIMARY KEY (กำหนดคีย์หลัก)</b>
- ใช้กำหนดรหัสหลักของตาราง ต้องมีค่าเสมอ ห้ามซ้ำ และห้ามเป็น NULL

<b>2. FOREIGN KEY (กำหนดความสัมพันธ์ระหว่างตาราง)</b>
- ใช้เพื่อเชื่อมความสัมพันธ์กับอีกตารางหนึ่ง
- ค่าที่อยู่ใน FOREIGN KEY ต้องมีอยู่ใน PRIMARY KEY ของตารางที่อ้างอิง

<b>3. NOT NULL (ห้ามเป็นค่าว่าง)</b>
- ใช้บังคับว่าคอลัมน์ต้องมีค่าเสมอ

<b>4. UNIQUE (ห้ามค่าซ้ำ)</b>
- ใช้บังคับว่าค่าต้องไม่ซ้ำกัน
- สามารถใช้กับหลายคอลัมน์ได้

<b>5. CHECK (กำหนดเงื่อนไขให้กับค่าของคอลัมน์)</b>
- ใช้กำหนดเงื่อนไขของข้อมูลที่สามารถบันทึกได้

<b>6. DEFAULT (กำหนดค่าเริ่มต้น)</b>
- ใช้กำหนดค่าดีฟอลต์ให้กับคอลัมน์ ถ้าไม่ได้กำหนดค่าอะไร

<b>7. AUTO_INCREMENT (เพิ่มค่าต่อเนื่องอัตโนมัติ)</b>
- ใช้กับ PRIMARY KEY เพื่อให้เพิ่มค่าอัตโนมัติ
- ใช้ได้ใน MySQL, PostgreSQL, SQL Server

<b>🎯 สรุป</b>
<table>
  <tr>
    <td><b>Constraint</b></td>
    <td><b>ความหมาย</b></td>
    <td><b>ตัวอย่าง</b></td>
  </tr>
  <tr>
    <td>PRIMARY KEY</td>
    <td>ใช้กำหนดคีย์หลักของตาราง ห้ามซ้ำ และห้ามเป็น NULL (ระบุตัวตนของแถว)</td>
    <td>id INT PRIMARY KEY</td>
  </tr>
  <tr>
    <td>FOREIGN KEY</td>
    <td>เชื่อมความสัมพันธ์กับอีกตาราง ต้องอ้างอิงถึง PRIMARY KEY ของอีกตารางหนึ่ง</td>
    <td>user_id INT REFERENCES users(id)</td>
  </tr>
  <tr>
    <td>NOT NULL</td>
    <td>บังคับให้คอลัมน์ต้องมีค่า ห้ามเป็น NULL</td>
    <td>name VARCHAR(255) NOT NULL</td>
  </tr>
  <tr>
    <td>UNIQUE</td>
    <td>ห้ามค่าซ้ำในคอลัมน์</td>
    <td>email VARCHAR(255) UNIQUE</td>
  </tr>
  <tr>
    <td>CHECK</td>
    <td>กำหนดเงื่อนไขของข้อมูลให้กับค่าของคอลัมน์</td>
    <td>age INT CHECK (age >= 18)</td>
  </tr>
  <tr>
    <td>DEFAULT</td>
    <td>กำหนดค่าเริ่มต้นให้กับคอลัมน์ ถ้าไม่มีการใส่ค่า</td>
    <td>status VARCHAR(50) DEFAULT 'active'</td>
  </tr>
  <tr>
    <td>AUTO_INCREMENT</td>
    <td>ใช้กับ PRIMARY KEY เพื่อให้เพิ่มค่าอัตโนมัติ (เฉพาะ MySQL, PostgreSQL, SQL Server)</td>
    <td>id INT PRIMARY KEY AUTO_INCREMENT</td>
  </tr>
</table>

# JOIN
<b>1. INNER JOIN (JOIN ปกติ)</b>
- ใช้เพื่อดึงเฉพาะข้อมูลที่ตรงกันทั้งสองตาราง
- ถ้าข้อมูลไม่มีในทั้งสองตาราง จะไม่ถูกแสดง

<b>2. LEFT JOIN (หรือ LEFT OUTER JOIN)</b>
- ดึงข้อมูลทั้งหมดจากตารางซ้าย และข้อมูลที่ตรงกันจากตารางขวา
- ถ้าไม่มีข้อมูลที่ตรงกันจากตารางขวา จะได้ค่า NULL

<b>3. RIGHT JOIN (หรือ RIGHT OUTER JOIN)</b>
- ดึงข้อมูลทั้งหมดจากตารางขวา และข้อมูลที่ตรงกันจากตารางซ้าย
- ถ้าไม่มีข้อมูลที่ตรงกันจากตารางซ้าย จะได้ค่า NULL

<b>4. FULL JOIN (หรือ FULL OUTER JOIN)</b>
- ดึงข้อมูลทั้งหมดจากทั้งสองตาราง
- ถ้าไม่มีข้อมูลที่ตรงกัน จะได้ค่า NULL ในฝั่งที่ไม่มีข้อมูล

<b>5. CROSS JOIN (หรือ CARTESIAN JOIN)</b>
- ใช้รวมข้อมูลทุกแถวจากตารางแรกกับทุกแถวในตารางที่สอง
- ไม่มีเงื่อนไขการจับคู่ ทำให้ได้ ผลลัพธ์เยอะมาก (คูณจำนวนแถวของทั้งสองตาราง)

<b>6. SELF JOIN</b>
- ใช้ JOIN ตารางตัวเอง โดยให้สร้าง ALIAS (ชื่อชั่วคราว) เพื่อแยกการใช้งาน

<b>🎯 สรุป</b>
<table>
  <tr>
    <td><b>JOIN</b></td>
    <td><b>ใช้งานเมื่อไหร่?</b></td>
  </tr>
  <tr>
    <td>INNER JOIN</td>
    <td>ดึงเฉพาะข้อมูลที่มีตรงกันจากทั้งสองตาราง</td>
  </tr>
  <tr>
    <td>LEFT JOIN</td>
    <td>ดึงข้อมูลทั้งหมดจากตารางซ้าย และข้อมูลที่ตรงกันจากตารางขวา (ถ้าไม่มี ตรงขวาจะเป็น NULL)</td>
  </tr>
  <tr>
    <td>RIGHT JOIN</td>
    <td>ดึงข้อมูลทั้งหมดจากตารางขวา และข้อมูลที่ตรงกันจากตารางซ้าย (ถ้าไม่มี ตรงซ้ายจะเป็น NULL)</td>
  </tr>
  <tr>
    <td>FULL JOIN</td>
    <td>ดึงทุกข้อมูลจากทั้งสองตาราง (ถ้าไม่มี ตรงข้ามจะเป็น NULL)</td>
  </tr>
  <tr>
    <td>CROSS JOIN</td>
    <td>จับคู่ทุกแถวของสองตารางเข้าด้วยกัน (ผลลัพธ์จะเยอะมาก)</td>
  </tr>
  <tr>
    <td>SELF JOIN</td>
    <td>ใช้ JOIN กับตัวเอง โดยให้สร้าง ALIAS (ชื่อชั่วคราว) เพื่อแยกการใช้งาน</td>
  </tr>
</table>

# SQL Command อื่น ๆ
<table>
  <tr>
    <td><b>คำสั่งอื่น ๆ</b></td>
    <td><b>ใช้งานเมื่อไหร่?</b></td>
  </tr>
  <tr>
    <td>UNION</td>
    <td>การรวมข้อมูลชนิดเดียวกันทั้ง 2 ตาราง</td>
  </tr>
  <tr>
    <td>INTERSECT</td>
    <td>การรวมข้อมูล 2 ตารางเฉพาะที่เหมือนกัน</td>
  </tr>
  <tr>
    <td>EXCEPT</td>
    <td>การเลือกข้อมูลที่มีเฉพาะตารางแรก</td>
  </tr>
  <tr>
    <td>NULL</td>
    <td>ข้อมูลที่ไม่สามารถระบุค่าได้ หรือ ไม่มีค่า</td>
  </tr>
  <tr>
    <td>ALIAS</td>
    <td>การตั้งนามแฝงให้กับ table หรือ column</td>
  </tr>
  <tr>
    <td>INDEX</td>
    <td>ระบบดรรชนีค้นหาที่ระบุตำแหน่งข้อมูลให้รวดเร็ว</td>
  </tr>
  <tr>
    <td>ALTER</td>
    <td>คำสั่งเปลี่ยนแปลงข้อมูล column ในตาราง</td>
  </tr>
  <tr>
    <td>TRUNCATE</td>
    <td>การลบข้อมูลภายในตารางทั้งหมด</td>
  </tr>
  <tr>
    <td>VIEW</td>
    <td>กำหนดการแสดงผลจากรูปแบบ query statement</td>
  </tr>
  <tr>
    <td>HAVING</td>
    <td>กำหนดเงื่อนไขแสดงผลของ GROUP BY</td>
  </tr>
  <tr>
    <td>TRANSACTION</td>
    <td>หน่วยของข้อมูลที่เปลี่ยนแปลงบนฐานข้อมูล</td>
  </tr>
  <tr>
    <td>WILDCARD</td>
    <td>การแทนค่าอักษรอะไรก็ได้</td>
  </tr>
  <tr>
    <td>DATE Function</td>
    <td>ฟังก์ชันการใช้งานข้อมูลวันที่และเวลา</td>
  </tr>
  <tr>
    <td>sub query</td>
    <td>การดึงข้อมูลภายใต้ query หลัก</td>
  </tr>
</table>

# SELECT
select multiple fields by listing them after the SELECT keyword, seperated by comma (,). Or select all fields from a table by using an asterisk (*) instead of listing each fields individually.

# DISTINCT
The DISTINCT keyword helps you retrieve unique values from a volumn, eliminating duplicate entries.

# Creating Views
A view us a saved SQL query that acts like a virtual table. It allows you to reuse complex queries and ensures that the results are always up-to-date with the underlying data.

-- Create a view for unique authors
CREATE VIEW unique_authors AS
SELECT DISTINCT author AS unique_author
FROM books;

# SQL Flavors
SQL has different versions, or "flavors", such as PostgreSQL and SQL Server. Each flavor follows universal standards but may have additional features. For example, to limit the number of records returned, PostgreSQL use the LIMIT keyword, while SQL Server use the TOP keyword.

-- PostgreSQL query to limit results
SELECT employee_name, employee_id
FROM employees
LIMIT 2;

-- SQL Server query to limit results
SELECT TOP 2 employee_name, employee_id
FROM employees;

# WHERE
With the WHERE clause, you can filter the results based on specific conditions.

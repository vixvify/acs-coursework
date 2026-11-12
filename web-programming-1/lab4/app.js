const express = require("express");
const app = express();

app.use(express.json());

const books = [];

// เมื่อ Restart Server ข้อมูลหนังสือทั้งหมดจะหายไป เพราะเก็บข้อมูลไว้ใน Array ซึ่งอยู่ใน RAM และจะถูกสร้างใหม่เป็น Array ว่าง หากต้องการเก็บข้อมูลถาวรต้องใช้ฐานข้อมูล เช่น PostgreSQL หรือ MySQL

app.get("/", (req, res) => {
  res.send("Hello backend!");
});

app.get("/books", (req, res) => {
  res.json(books);
});

app.post("/books", (req, res) => {
  const title = req.body?.title;
  if (typeof title !== "string" || !title.trim()) {
    return res.status(400).json({ error: "Title required" });
  }
  const book = { id: books.length + 1, title: title.trim() };
  books.push(book);
  res.status(201).json(book);
});

app.listen(3000, () => {
  console.log("http://localhost:3000");
});

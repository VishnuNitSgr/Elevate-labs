# Online Retail Sales Database Design

## 📌 Project Overview
This project demonstrates the design and implementation of a **normalized SQL database schema** for an online retail (e-commerce) platform.

The system manages:

- Customers
- Products
- Orders
- Order Items
- Payments

The database is designed using **relational database principles** and normalized to **Third Normal Form (3NF)** to eliminate redundancy and maintain data integrity.

---

## 🎯 Objectives

- Design a normalized relational database
- Implement SQL schema using DDL
- Insert sample data using DML
- Perform analytical queries using JOIN operations
- Generate sales reports using SQL Views

---

## 🛠 Technologies Used

- SQL
- MySQL / PostgreSQL
- ER Diagram Tool (dbdiagram.io)
- Git & GitHub

---

## 🗂 Database Schema

The database contains the following tables:

| Table Name | Description |
|------------|-------------|
| Customers | Stores customer details |
| Products | Stores product information |
| Orders | Stores order details |
| Order_Items | Stores products within orders |
| Payments | Stores payment transactions |

---

## 🧩 Entity Relationship Overview
Customers (1) ---- (M) Orders
Orders (1) ---- (M) Order_Items
Products (1) ---- (M) Order_Items
Orders (1) ---- (1) Payments


---

## 🗃 SQL Schema

Example table structure:

```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
📊 Sample Queries
Customer Order History
SELECT c.name, o.order_id, o.order_date, o.status
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
Order Details with Products
SELECT 
o.order_id,
p.name AS product_name,
oi.quantity,
oi.price
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id;
Total Sales Report
SELECT SUM(quantity * price) AS total_sales
FROM Order_Items;
📈 Sales Report View
CREATE VIEW Sales_Report AS
SELECT 
o.order_id,
c.name AS customer,
p.name AS product,
oi.quantity,
oi.price,
(oi.quantity * oi.price) AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;
📁 Project Structure
online-retail-database
│
├── schema.sql
├── sample_data.sql
├── queries.sql
├── er_diagram.png
└── README.md

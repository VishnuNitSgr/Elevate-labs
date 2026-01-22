# Day 5 – Aggregate Functions & GROUP BY (SQL)

## 📌 Task Overview

This task focuses on understanding **aggregate functions** and the **GROUP BY** clause in SQL.
The objective is to analyze datasets statistically and extract meaningful insights from grouped data.

---

## 🛠 Tools Used

* **MySQL Workbench**
* **MySQL CLI**
* Alternatives: PostgreSQL, BigQuery Sandbox

---

## 📂 Files Included

| File Name  | Description                                                                       |
| ---------- | --------------------------------------------------------------------------------- |
| `Day5.sql` | SQL script demonstrating aggregate functions, GROUP BY, HAVING, and NULL handling |

---

## 📚 Concepts Covered

### 1️⃣ Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Used to calculate totals, averages, and summary statistics from data.

---

### 2️⃣ GROUP BY

* Grouping students by **age**
* Grouping students by **department**
* Applying aggregate functions on grouped data

---

### 3️⃣ HAVING Clause

* Filtering grouped results using aggregate conditions
* Example: departments with average marks greater than a specific value

---

### 4️⃣ WHERE vs HAVING

* **WHERE** filters rows **before grouping**
* **HAVING** filters groups **after aggregation**

---

### 5️⃣ Real-World Use Case

* Department-wise student count
* Department-wise performance analysis
* Statistical reporting

---

### 6️⃣ Handling NULL Values

* `COUNT(column)` ignores NULL values
* `AVG()`, `SUM()`, `MIN()`, `MAX()` ignore NULL by default
* `IFNULL()` used to handle NULL explicitly

---



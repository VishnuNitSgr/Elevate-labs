# Employee Analytics Using Window Functions (MySQL 8+)

## Overview

This project demonstrates advanced SQL analytics using **Window Functions** in MySQL 8+.  

It covers:

- Extending employee table structure
- ROW_NUMBER()
- RANK() vs DENSE_RANK()
- Running totals using SUM() OVER()
- LAG() and LEAD()
- Using window functions without collapsing rows
- Filtering window results using subqueries
- Real-world analytics use cases

This script is designed for learning **SQL analytics, reporting, and business intelligence concepts**.

---

## Database Schema

### Table: `employees`

| Column        | Type           | Description |
|--------------|---------------|-------------|
| id           | INT (PK)      | Employee ID |
| name         | VARCHAR(100)  | Employee name |
| department   | VARCHAR(100)  | Department name |
| salary       | DECIMAL(10,2) | Employee salary |
| joining_date | DATE          | Date of joining |

---

## Window Functions Implemented

### 1️⃣ ROW_NUMBER()

Assigns a unique sequential number within each department.

```sql
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC)

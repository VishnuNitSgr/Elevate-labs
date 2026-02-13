# Employee Management – Stored Procedures & Functions (MySQL)

## Overview

This project demonstrates the use of:

- Stored Procedures
- IN and OUT Parameters
- User Defined Functions (UDF)
- Error Handling with Transactions
- Indexing for Optimization
- Procedure Calls and Output Verification

The script creates an employee management system with reusable business logic inside the database.

---

## Database Schema

### Table: `employees`

| Column      | Type           | Description |
|------------|---------------|-------------|
| id         | INT (PK)      | Auto-increment employee ID |
| name       | VARCHAR(100)  | Employee name |
| department | VARCHAR(100)  | Department name |
| salary     | DECIMAL(10,2) | Employee salary |
| bonus      | DECIMAL(10,2) | Bonus amount |
| created_at | TIMESTAMP     | Record creation time |

---

## Stored Procedures

### 1. InsertEmployee

Inserts a new employee record.

**Parameters:**
- `emp_name` (IN)
- `emp_department` (IN)
- `emp_salary` (IN)
- `emp_bonus` (IN)

**Usage:**
```sql
CALL InsertEmployee('Vishnu', 'IT', 50000, 5000);

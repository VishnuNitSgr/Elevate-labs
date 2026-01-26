# Departments and Employees – SQL Foreign Key Demonstration

## 📌 Objective
This project demonstrates the use of **PRIMARY KEY**, **FOREIGN KEY**, and **ON DELETE CASCADE** constraints in SQL to maintain **referential integrity** between relational tables.

We model a real-world organization structure:
**Company → Departments → Employees**

---

## 🗂️ Tables Overview

### 1. `departments`
Stores department-level details.

| Column Name     | Data Type     | Constraint        |
|-----------------|--------------|------------------|
| department_id   | INT          | PRIMARY KEY      |
| department_name | VARCHAR(100) | NOT NULL         |

---

### 2. `employees`
Stores employee records linked to departments.

| Column Name   | Data Type     | Constraint                    |
|---------------|--------------|-------------------------------|
| employee_id   | INT          | PRIMARY KEY                   |
| employee_name | VARCHAR(100) | NOT NULL                      |
| department_id | INT          | FOREIGN KEY → departments     |

---

## 🔑 Key Concepts Used

- **PRIMARY KEY**  
  Ensures each department and employee is uniquely identified.

- **FOREIGN KEY**  
  Ensures employees can only belong to existing departments.

- **ON DELETE CASCADE**  
  Automatically deletes dependent employee records when a department is removed.

---

## 🛠️ SQL Implementation

### Create Tables
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
INSERT INTO departments VALUES (1, 'Engineering');
INSERT INTO departments VALUES (2, 'HR');

INSERT INTO employees VALUES (101, 'Alice', 1);
INSERT INTO employees VALUES (102, 'Bob', 2);
❌ Invalid Foreign Key Test
INSERT INTO employees VALUES (103, 'Charlie', 5);
Result
ERROR: violates foreign key constraint
ON DELETE CASCADE Implementation
ALTER TABLE employees
DROP CONSTRAINT fk_department;

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE CASCADE;

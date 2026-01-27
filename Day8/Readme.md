# SQL JOIN Operations – MySQL

This project demonstrates the usage of different SQL JOIN types using existing
`employees` and `departments` tables in **MySQL**.  
Since MySQL does not support `FULL JOIN` directly, it is simulated using `UNION`.

---

## 📂 Tables Used

### `departments`
| Column    | Type | Description |
|-----------|------|-------------|
| dept_id   | INT  | Primary Key |
| dept_name | VARCHAR | Department name |

### `employees`
| Column   | Type | Description |
|----------|------|-------------|
| emp_id   | INT | Primary Key |
| emp_name | VARCHAR | Employee name |
| dept_id  | INT | Foreign Key (nullable) |

---

## 🔗 JOIN Types Covered

### 1. INNER JOIN
Fetches only employees who are assigned to a department.

**Use case:**  
Reports where only valid employee–department mappings are required.

---

### 2. LEFT JOIN
Fetches all employees, including those without a department.

**Use case:**  
Identifying employees pending department allocation.

---

### 3. RIGHT JOIN
Fetches all departments, including those without employees.

**Use case:**  
Auditing departments that currently have no staff.

---

### 4. FULL JOIN (Simulated)
MySQL does not support `FULL JOIN`.  
It is simulated using:


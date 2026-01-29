# Advanced SQL Subqueries Practice

## Objective
This project is designed to help interns and learners understand **advanced SQL subqueries**, their execution flow, and how they compare with equivalent JOIN-based queries. It strengthens logical thinking required for complex database queries.

---

## Database Schema

### Tables Used

**departments**
- `dept_id` (PRIMARY KEY)
- `dept_name`

**employees**
- `emp_id` (PRIMARY KEY)
- `emp_name`
- `salary`
- `dept_id` (FOREIGN KEY → departments.dept_id)

---

## Topics Covered

### 1. Salary Data Creation
Employee records include salary values and department mappings, including a `NULL` department case to handle edge scenarios.

### 2. Subqueries in WHERE Clause
Used to filter rows based on aggregate results, such as employees earning more than the average salary.

### 3. Subqueries in SELECT Clause
Demonstrates how subqueries can be used to compute derived values alongside row-level data.

### 4. Subqueries in FROM Clause
Shows derived tables (inline views) for grouping and filtering aggregated results.

### 5. Correlated Subqueries
Implements subqueries that depend on values from the outer query, such as comparing employee salary with their department’s average salary.

### 6. EXISTS Subquery
Demonstrates existence checks for related records between tables.

### 7. JOIN vs Subquery Comparison
Each major subquery use case is paired with a JOIN-based equivalent to understand performance and readability differences.

---

## Key Learnings
- How nested queries execute step-by-step  
- When correlated subqueries are required  
- When JOINs are more optimized than subqueries  
- Common patterns used in interviews and real-world SQL  
- Handling NULLs and edge cases in subqueries  

---


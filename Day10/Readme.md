# SQL Views: Employees & Departments

## Overview
This project demonstrates how to use **SQL Views** to simplify complex queries, improve security, and support reporting use cases.  
It covers creating tables, joining data, converting queries into views, querying views, applying filters/sorting, handling insert limitations, and safely recreating views.

---

## Database Schema

### Tables
- **departments**
  - dept_id (PK)
  - dept_name
  - location

- **employees**
  - emp_id (PK)
  - emp_name
  - salary
  - hire_date
  - dept_id (FK → departments.dept_id)

---


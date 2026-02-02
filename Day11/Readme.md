# Index Performance Analysis in SQL

## Overview
This project demonstrates how database indexes affect query performance when working with large datasets. It shows how to identify slow-running queries, analyze execution plans, create indexes, and compare performance before and after indexing.

The implementation uses **MySQL (InnoDB)** and focuses on practical use of `EXPLAIN` for query optimization.

---

## Objectives
- Identify slow-running queries on large tables  
- Execute queries without indexes and observe performance  
- Create indexes on frequently searched columns  
- Re-run queries and compare execution plans  
- Understand clustered and non-clustered indexes  
- Identify cases where indexes do not improve performance  
- Document indexing best practices  

---

## Database Details
- Database Name: `performance_test`
- Table Name: `orders`
- Storage Engine: InnoDB
- Approximate Rows Inserted: 500,000

---

## Table Structure
The `orders` table contains:
- `order_id` (Primary Key)
- `customer_id`
- `product_id`
- `order_date`
- `order_amount`
- `status`

---

## Steps Performed

### 1. Database and Table Creation
A database and an `orders` table are created to simulate a real-world transactional dataset.

### 2. Large Dataset Insertion
A large volume of randomized data is inserted to make query performance differences noticeable.

### 3. Query Execution Without Index
Queries are executed on non-indexed columns to observe full table scans using `EXPLAIN`.

### 4. Index Creation
Indexes are created on frequently searched columns such as:
- `customer_id`
- `(status, order_date)` composite index

### 5. Query Execution With Index
The same queries are re-executed after indexing to compare execution plans and row scans.

### 6. Execution Plan Analysis
`EXPLAIN` is used before and after index creation to analyze:
- Access type
- Index usage
- Estimated rows scanned

### 7. Index Performance Pitfalls
An index is created on a low-cardinality column (`status`) to demonstrate cases where indexing may not improve performance.

### 8. Clustered Index Demonstration
The primary key (`order_id`) is used to show how clustered indexes work in InnoDB.

---

## Key Observations
- Indexes significantly reduce the number of rows scanned for selective queries  
- Composite indexes improve performance when query conditions match index order  
- Indexes on low-cardinality columns may not always be beneficial  
- Excessive indexing can slow down insert, update, and delete operations  

---

## Best Practices for Indexing
- Index columns used frequently in `WHERE`, `JOIN`, and `ORDER BY` clauses  
- Avoid indexing columns with very few distinct values alone  
- Use composite indexes based on query patterns  
- Keep the number of indexes minimal  
- Always analyze queries using `EXPLAIN`  
- Prefer stable and sequential primary keys for clustered indexes  

---

## How to Run
1. Open MySQL CLI or a MySQL-compatible client  
2. Execute the provided SQL file:
   ```sql
   source index_performance_analysis.sql;

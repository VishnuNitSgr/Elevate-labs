# Database Constraints Demonstration

This project demonstrates the practical use of **database-level constraints**
such as `CHECK`, `DEFAULT`, `UNIQUE`, and `NOT NULL` to enforce data integrity.
It also highlights how databases handle invalid data and why constraints are
critical compared to application-level validation.

---

## Objectives Covered

1. Create tables using CHECK, DEFAULT, and UNIQUE constraints  
2. Validate numeric ranges using CHECK constraints  
3. Apply DEFAULT values for timestamps  
4. Test constraint violations intentionally  
5. Combine multiple constraints on a single column  
6. Understand constraint enforcement order  
7. Compare application-level vs database-level validation  
8. Document constraint design decisions  

---

## Tables Overview

### 1. Users Table
- Ensures unique email addresses
- Restricts age between 18 and 60
- Automatically stores creation timestamp

### 2. Products Table
- Validates product price range using CHECK constraints

### 3. Orders Table
- Automatically records order time using DEFAULT timestamp

### 4. Employees Table
- Demonstrates multiple constraints on a single column:
  - NOT NULL
  - DEFAULT value
  - CHECK condition

---

## Constraint Usage

### CHECK
Used to enforce valid ranges for numeric data such as age, price, and salary.

### UNIQUE
Prevents duplicate records, such as duplicate email addresses.

### DEFAULT
Automatically assigns values when no input is provided, reducing manual errors.

### NOT NULL
Ensures mandatory fields are always populated.

---

## Constraint Violation Testing

The SQL script intentionally includes invalid INSERT statements to demonstrate:
- Duplicate UNIQUE values
- CHECK constraint failures
- NOT NULL violations

These operations are rejected by the database, proving that constraints are
actively enforced.

---

## Constraint Enforcement Order

In general, databases enforce constraints in the following order:

1. NOT NULL  
2. CHECK  
3. UNIQUE  
4. PRIMARY KEY / FOREIGN KEY  

If multiple constraints are violated, the database reports the first detected
error.

---

## Application-Level vs Database-Level Validation

### Application-Level Validation
- Provides faster feedback to users
- Improves user experience
- Can be bypassed if not handled carefully

### Database-Level Validation
- Acts as the final authority
- Protects data integrity regardless of data source
- Prevents invalid data from entering the database

**Best Practice:** Use both together.

---

## Design Decisions

- Age limits ensure valid user data
- Price limits prevent incorrect business values
- Salary constraints enforce company policy
- Default timestamps reduce human error
- Unique constraints avoid duplicate records

---

## How to Run

1. Open any SQL-compatible database (MySQL / PostgreSQL / SQLite*)
2. Paste and execute the provided SQL script
3. Observe successful inserts and intentional constraint failures

\* Some constraint behavior may vary slightly by database engine.

---

## Conclusion

This project demonstrates how database constraints:
- Improve data quality
- Prevent invalid data
- Reduce dependency on application logic
- Enforce business rules at the database level

---

# SQL Transactions and ACID Properties

This project demonstrates how **SQL transactions** are used to ensure data
integrity in real-world systems such as banking applications. It covers
transaction control commands, failure handling, isolation levels, and ACID
properties through practical SQL examples.

---

## Objectives Covered

1. Execute multiple SQL statements as a single transaction  
2. Use `START TRANSACTION`, `COMMIT`, and `ROLLBACK`  
3. Simulate failure scenarios and rollback changes  
4. Understand ACID properties  
5. Analyze transaction isolation levels  
6. Handle concurrent data updates  
7. Prevent dirty reads  
8. Map transactions to real-world banking systems  

---

## Database Schema

### Accounts Table
The `accounts` table represents bank accounts.

**Columns:**
- `account_id` – Unique account identifier
- `holder_name` – Account holder name
- `balance` – Current account balance (must be non-negative)

A `CHECK` constraint ensures balances never go below zero.

---

## Transaction Demonstration

### Successful Transaction
A money transfer between two accounts:
- Amount is debited from one account
- Same amount is credited to another account
- Changes are permanently saved using `COMMIT`

This demonstrates **atomicity** and **consistency**.

---

### Failed Transaction with Rollback
An invalid transfer is attempted:
- Withdrawal exceeds available balance
- Transaction is rolled back using `ROLLBACK`
- Database remains unchanged

This demonstrates **atomicity** and **data safety**.

---

## ACID Properties Explained

### Atomicity
All operations in a transaction either complete together or none are applied.

### Consistency
Database constraints ensure data remains valid before and after a transaction.

### Isolation
Concurrent transactions do not interfere with each other.

### Durability
Once committed, data remains permanent even after failures.

---

## Transaction Isolation Levels

The script demonstrates isolation levels such as:

- **READ COMMITTED**
  - Prevents dirty reads
  - Only committed data is visible

- **SERIALIZABLE**
  - Highest isolation level
  - Prevents concurrent update conflicts

---

## Preventing Dirty Reads

By using `READ COMMITTED`, transactions only read data that has already been
committed, ensuring reliability in concurrent environments.

---

## Banking System Mapping

This project maps directly to real-world banking scenarios:

- Account-to-account money transfer
- Rollback on insufficient balance
- Concurrent transaction safety
- Strong data integrity guarantees

---

## How to Run

1. Open any SQL-supported database (MySQL / PostgreSQL)
2. Execute the provided `transactions.sql` file
3. Observe:
   - Successful commits
   - Rollbacks on failure
   - Isolation behavior

---

## Conclusion

This project shows how SQL transactions:
- Protect critical data
- Prevent partial updates
- Handle failures safely
- Support concurrent users
- Form the backbone of financial systems

---



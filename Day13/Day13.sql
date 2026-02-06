DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2) CHECK (balance >= 0)
);

INSERT INTO accounts VALUES
(1, 'Alice', 5000),
(2, 'Bob', 3000);

START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 7000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 7000
WHERE account_id = 2;

ROLLBACK;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT balance FROM accounts WHERE account_id = 1;

COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 2;

COMMIT;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 2;

ROLLBACK;


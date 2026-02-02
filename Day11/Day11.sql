CREATE DATABASE IF NOT EXISTS performance_test;
USE performance_test;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    status VARCHAR(20)
) ENGINE=InnoDB;

INSERT INTO orders (customer_id, product_id, order_date, order_amount, status)
SELECT
    FLOOR(RAND() * 100000),
    FLOOR(RAND() * 5000),
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY),
    ROUND(RAND() * 10000, 2),
    IF(RAND() > 0.5, 'COMPLETED', 'PENDING')
FROM information_schema.tables t1
CROSS JOIN information_schema.tables t2
LIMIT 500000;

SELECT *
FROM orders
WHERE customer_id = 54321;

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 54321;

CREATE INDEX idx_customer_id ON orders(customer_id);

SELECT *
FROM orders
WHERE customer_id = 54321;

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 54321;

SELECT *
FROM orders
WHERE status = 'COMPLETED'
AND order_date >= '2025-01-01';

EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED'
AND order_date >= '2025-01-01';

CREATE INDEX idx_status_date ON orders(status, order_date);

EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED'
AND order_date >= '2025-01-01';

CREATE INDEX idx_status_only ON orders(status);

EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED';

EXPLAIN
SELECT *
FROM orders
WHERE order_id = 1000;


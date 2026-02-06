DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS orders;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    age INT CHECK (age BETWEEN 18 AND 60),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price >= 0 AND price <= 100000)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    salary INT NOT NULL DEFAULT 20000 CHECK (salary >= 20000)
);

INSERT INTO users (user_id, email, age)
VALUES (1, 'user1@example.com', 25);

INSERT INTO products (product_id, price)
VALUES (101, 49999.50);

INSERT INTO employees (emp_id)
VALUES (1);

INSERT INTO orders (order_id)
VALUES (1001);

INSERT INTO users (user_id, email, age)
VALUES (2, 'user1@example.com', 30);

INSERT INTO users (user_id, email, age)
VALUES (3, 'user3@example.com', 15);

INSERT INTO products (product_id, price)
VALUES (102, -500);

INSERT INTO employees (emp_id, salary)
VALUES (2, 10000);

INSERT INTO employees (emp_id, salary)
VALUES (3, NULL);


DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    created_at DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (name,email,city,created_at) VALUES
('Vishnu','vishnu@email.com','Delhi','2022-01-10'),
('Rahul','rahul@email.com','Mumbai','2021-03-12'),
('Anita','anita@email.com','Bangalore','2023-06-15'),
('Priya','priya@email.com','Chennai','2020-05-20'),
('Karan','karan@email.com','Hyderabad','2022-09-01');

INSERT INTO products (product_name,category,price) VALUES
('Laptop','Electronics',70000),
('Phone','Electronics',30000),
('Headphones','Accessories',2000),
('Shoes','Fashion',4000),
('Watch','Fashion',8000);

INSERT INTO orders (customer_id,order_date) VALUES
(1,'2024-01-10'),
(2,'2024-01-15'),
(1,'2024-02-20'),
(3,'2024-03-05'),
(4,'2024-03-18'),
(2,'2024-04-01'),
(5,'2024-04-25');

INSERT INTO order_items (order_id,product_id,quantity) VALUES
(1,1,1),
(1,3,2),
(2,2,1),
(3,2,1),
(3,4,3),
(4,1,1),
(4,5,2),
(5,4,1),
(6,1,2),
(6,3,1),
(7,5,1);

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

SELECT 
    DATE_FORMAT(o.order_date,'%Y-%m') AS month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m')
ORDER BY month;

SELECT 
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) = 0;

SELECT 
    c.customer_id,
    c.name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id
HAVING total_spent > 100000
ORDER BY total_spent DESC;

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_orders_date ON orders(order_date);

SELECT 
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue,
    RANK() OVER(ORDER BY SUM(oi.quantity * p.price) DESC) AS revenue_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

SELECT 
    DATE_FORMAT(o.order_date,'%Y-%m') AS month,
    SUM(oi.quantity * p.price) AS revenue,
    SUM(SUM(oi.quantity * p.price)) OVER(ORDER BY DATE_FORMAT(o.order_date,'%Y-%m')) AS cumulative_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m')
ORDER BY month;


CREATE DATABASE online_retail;

USE online_retail;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(50),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATE,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);
INSERT INTO Customers(name,email,phone,address)
VALUES
('Rahul Sharma','rahul@gmail.com','9876543210','Delhi'),
('Ananya Singh','ananya@gmail.com','9876543211','Mumbai'),
('Amit Verma','amit@gmail.com','9876543212','Bangalore');
INSERT INTO Products(name,category,price,stock)
VALUES
('Laptop','Electronics',70000,10),
('Headphones','Electronics',2000,50),
('Shoes','Fashion',3000,30),
('Mobile','Electronics',40000,20);
INSERT INTO Orders(customer_id,order_date,status)
VALUES
(1,'2026-03-01','Delivered'),
(2,'2026-03-02','Processing'),
(3,'2026-03-03','Shipped');
INSERT INTO Order_Items(order_id,product_id,quantity,price)
VALUES
(1,1,1,70000),
(1,2,2,2000),
(2,3,1,3000),
(3,4,1,40000);
INSERT INTO Payments(order_id,payment_method,payment_status,payment_date)
VALUES
(1,'Credit Card','Success','2026-03-01'),
(2,'UPI','Pending','2026-03-02'),
(3,'Debit Card','Success','2026-03-03');
SELECT c.name, o.order_id, o.order_date, o.status
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
SELECT 
o.order_id,
p.name AS product_name,
oi.quantity,
oi.price
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id;
SELECT SUM(quantity * price) AS total_sales
FROM Order_Items;
CREATE VIEW Sales_Report AS
SELECT 
o.order_id,
c.name AS customer,
p.name AS product,
oi.quantity,
oi.price,
(oi.quantity * oi.price) AS total_price
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id;
SELECT * FROM Sales_Report;
CREATE INDEX idx_customer
ON Orders(customer_id);

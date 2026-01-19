CREATE DATABASE intern_training_db;
USE intern_training_db;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    city VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1, 'Vishnu Tripathi', 21, 'vishnu@gmail.com', 'Lucknow', 85),
(2, 'Amit Sharma', 19, 'amit@yahoo.com', 'Delhi', 72),
(3, 'Neha Verma', 22, 'neha@gmail.com', 'Mumbai', 90),
(4, 'Rahul Singh', 18, NULL, 'Delhi', 65),
(5, 'Ankit Gupta', 20, 'ankit@outlook.com', 'Jaipur', 78),
(6, 'Nisha Jain', 23, 'nisha@gmail.com', 'Mumbai', 88);

SELECT * 
FROM students
WHERE age > 20;

SELECT name, age, marks
FROM students
WHERE age > 20 AND marks >= 80;

SELECT name, city
FROM students
WHERE city = 'Delhi' OR city = 'Mumbai';


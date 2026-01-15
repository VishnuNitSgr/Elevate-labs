CREATE DATABASE intern_training_db;
USE intern_training_db;
CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
age INT
);
INSERT INTO students (name, email, age) VALUES
('Amit Sharma', 'amit@gmail.com', 21),
('Neha Verma', 'neha@gmail.com', 22),
('Rahul Singh', 'rahul@gmail.com', 20),
('Pooja Mehta', 'pooja@gmail.com', 23),
('Rohan Gupta', 'rohan@gmail.com', 21);

SELECT * FROM students;
SELECT  name FROM students;
SELECT name from students where age>21;
SELECT email from students;




CREATE DATABASE intern_training_db;
USE intern_training_db;
show tables;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,   
    name VARCHAR(100) NOT NULL,           
    email VARCHAR(150) NOT NULL UNIQUE,  
    age INT NOT NULL,                     
    dob DATE NOT NULL                    
);
INSERT INTO students (name, email, age, dob) VALUES
('Amit Sharma', 'amit@gmail.com', 21, '2003-02-15'),
('Neha Verma', 'neha@gmail.com', 22, '2002-07-10'),
('Rahul Singh', 'rahul@gmail.com', 20, '2004-01-05');
select* from students;
INSERT INTO students (name, email, age, dob)
VALUES ('Rohan Gupta', 'amit@gmail.com', 23, '2001-06-01');
INSERT INTO students (name, email, age)
VALUES ('Pooja Mehta', 'pooja@gmail.com', 22);
ALTER TABLE students
ADD phone_number VARCHAR(15);
ALTER TABLE students
DROP COLUMN age;
DESC students;




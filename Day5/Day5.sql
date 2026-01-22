-- ================================
-- Day 5: Aggregate Functions & GROUP BY
-- ================================

-- Create database (optional)
CREATE DATABASE IF NOT EXISTS aggregate_demo;
USE aggregate_demo;

-- ================================
-- Table Creation
-- ================================
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    marks INT
);

-- ================================
-- Insert Sample Data
-- ================================
INSERT INTO students (name, age, department, marks) VALUES
('Amit', 20, 'CSE', 85),
('Riya', 21, 'ECE', 92),
('Vishnu', 20, 'CSE', 88),
('Neha', 22, 'ECE', 75),
('Rahul', 21, 'ME', 70),
('Pooja', 20, 'ME', 82),
('Karan', 22, 'CSE', NULL),
('Ankit', 21, 'CSE', 90);

-- ================================
-- 1. Aggregate Functions
-- ================================

-- Total number of students
SELECT COUNT(*) AS total_students FROM students;

-- Count of students with marks (NULL excluded)
SELECT COUNT(marks) AS students_with_marks FROM students;

-- Sum of marks
SELECT SUM(marks) AS total_marks FROM students;

-- Average marks
SELECT AVG(marks) AS average_marks FROM students;

-- Minimum and Maximum marks
SELECT MIN(marks) AS min_marks, MAX(marks) AS max_marks FROM students;

-- ================================
-- 2. Group students by age
-- ================================
SELECT age, COUNT(*) AS student_count
FROM students
GROUP BY age;

-- ================================
-- 3. GROUP BY with aggregates
-- ================================
SELECT department,
       COUNT(*) AS total_students,
       AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- ================================
-- 4. HAVING with GROUP BY
-- ================================
-- Departments with average marks greater than 80
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 80;

-- ================================
-- 5. WHERE vs HAVING
-- ================================

-- WHERE filters rows BEFORE grouping
SELECT department, AVG(marks) AS avg_marks
FROM students
WHERE marks IS NOT NULL
GROUP BY department;

-- HAVING filters groups AFTER aggregation
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING COUNT(*) > 2;

-- ================================
-- 6. Real-world example: Department-wise count
-- ================================
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department;

-- ================================
-- 7. Analyze result sets
-- ================================
-- Department-wise performance analysis
SELECT department,
       COUNT(*) AS total_students,
       MIN(marks) AS min_marks,
       MAX(marks) AS max_marks,
       AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- ================================
-- 8. Handling NULLs in aggregates
-- ================================
-- NULL marks are ignored by AVG, SUM, MIN, MAX
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- Use IFNULL to handle NULL explicitly
SELECT department, AVG(IFNULL(marks, 0)) AS avg_marks_with_zero
FROM students
GROUP BY department;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees (emp_id, name, department, salary, city) VALUES
(1, 'Amit', 'IT', 60000, 'Delhi'),
(2, 'Neha', 'HR', 45000, 'Mumbai'),
(3, 'Ravi', 'IT', 75000, 'Bangalore'),
(4, 'Priya', 'Finance', 50000, 'Delhi'),
(5, 'Karan', 'IT', 40000, 'Pune'),
(6, 'Sneha', 'HR', 55000, 'Mumbai');

SELECT * FROM employees
WHERE department = 'IT';

SELECT * FROM employees
WHERE salary > 50000;

UPDATE employees
SET salary = salary + salary * 0.10
WHERE department = 'IT';

DELETE FROM employees
WHERE salary < 45000;

DELETE FROM employees
WHERE emp_id = 6;

START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE emp_id = 2;

SELECT * FROM employees WHERE emp_id = 2;

ROLLBACK;

SELECT * FROM employees;

SELECT * FROM employees;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Bangalore'),
(2, 'HR', 'Delhi'),
(3, 'Finance', 'Mumbai');

INSERT INTO employees VALUES
(101, 'Amit', 80000, '2021-03-15', 1),
(102, 'Neha', 60000, '2020-07-20', 2),
(103, 'Rahul', 90000, '2019-01-10', 1),
(104, 'Pooja', 75000, '2022-05-01', 3);

SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    (e.salary * 12) AS annual_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    (e.salary * 12) AS annual_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_department_view;

SELECT *
FROM employee_department_view
WHERE salary > 70000;

SELECT *
FROM employee_department_view
ORDER BY annual_salary DESC;

INSERT INTO employee_department_view 
(emp_id, emp_name, salary, dept_name, location)
VALUES (105, 'Ravi', 70000, 'Engineering', 'Bangalore');

DROP VIEW IF EXISTS employee_department_view;

CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    (e.salary * 12) AS annual_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT dept_name, AVG(salary)
FROM employee_department_view
GROUP BY dept_name;

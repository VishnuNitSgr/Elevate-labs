DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Marketing'),
(4, 'Finance');

INSERT INTO employees VALUES
(101, 'Amit', 70000, 1),
(102, 'Neha', 85000, 1),
(103, 'Rahul', 40000, 2),
(104, 'Priya', 50000, 2),
(105, 'Karan', 60000, 3),
(106, 'Sneha', 90000, 4),
(107, 'Vikas', 30000, NULL);

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT e.emp_name, e.salary
FROM employees e
JOIN (
    SELECT AVG(salary) AS avg_salary
    FROM employees
) a ON e.salary > a.avg_salary;

SELECT emp_name,
       salary,
       (SELECT AVG(salary) FROM employees)
FROM employees;

SELECT dept_id, avg_dept_salary
FROM (
    SELECT dept_id, AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY dept_id
) t
WHERE avg_dept_salary > 60000;

SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;

SELECT e1.emp_name, e1.salary, e1.dept_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e1.dept_id
);

SELECT e.emp_name, e.salary, e.dept_id
FROM employees e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;

SELECT emp_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.dept_id = e.dept_id
);


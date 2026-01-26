CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
-- Insert departments
INSERT INTO departments VALUES (1, 'Engineering');
INSERT INTO departments VALUES (2, 'HR');

-- Insert employees with valid department_id
INSERT INTO employees VALUES (101, 'Alice', 1);
INSERT INTO employees VALUES (102, 'Bob', 2);
-- Invalid department_id (does not exist)
INSERT INTO employees VALUES (103, 'Charlie', 5);
ALTER TABLE employees
DROP CONSTRAINT fk_department;

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE CASCADE;
-- Delete a department
DELETE FROM departments WHERE department_id = 1;
SELECT * FROM departments;
SELECT * FROM employees;


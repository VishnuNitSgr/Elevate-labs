
CREATE DATABASE Employee_Managment;
USE Employee_Managment;
-- =========================
-- EMPLOYEE MANAGEMENT SYSTEM (MySQL)
-- =========================

DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS roles;

-- =========================
-- TABLES
-- =========================

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100),
    salary DECIMAL(10,2)
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    role_id INT,
    join_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE attendance (
    att_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    check_in DATETIME,
    check_out DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- =========================
-- INSERT DATA
-- =========================

INSERT INTO departments (dept_name) VALUES
('HR'), ('Engineering'), ('Sales'), ('Marketing'), ('Finance');

INSERT INTO roles (role_name, salary) VALUES
('Manager', 80000),
('Developer', 60000),
('Analyst', 50000),
('Intern', 20000);

-- Insert 200 employees manually using loop-like trick
INSERT INTO employees (name, email, dept_id, role_id)
SELECT 
    CONCAT('Employee_', t.n),
    CONCAT('emp', t.n, '@company.com'),
    FLOOR(1 + RAND()*5),
    FLOOR(1 + RAND()*4)
FROM (
    SELECT a.N + b.N*10 + 1 n
    FROM 
    (SELECT 0 N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
     UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
    (SELECT 0 N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
     UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
) t
LIMIT 200;

-- =========================
-- TRIGGER
-- =========================

DELIMITER $$

CREATE TRIGGER attendance_status_trigger
BEFORE INSERT ON attendance
FOR EACH ROW
BEGIN
    IF TIME(NEW.check_in) > '09:30:00' THEN
        SET NEW.status = 'Late';
    ELSE
        SET NEW.status = 'On Time';
    END IF;
END$$

DELIMITER ;

-- =========================
-- INSERT ATTENDANCE
-- =========================

INSERT INTO attendance (emp_id, check_in, check_out)
SELECT 
    emp_id,
    NOW() - INTERVAL FLOOR(RAND()*30) DAY + INTERVAL 9 HOUR,
    NOW() - INTERVAL FLOOR(RAND()*30) DAY + INTERVAL 17 HOUR
FROM employees;

-- =========================
-- FUNCTION (Work Hours)
-- =========================

DELIMITER $$

CREATE FUNCTION calculate_work_hours(in_time DATETIME, out_time DATETIME)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(SECOND, in_time, out_time)/3600;
END$$

DELIMITER ;

-- =========================
-- QUERIES
-- =========================

-- Monthly Attendance
SELECT emp_id, COUNT(*) AS total_days
FROM attendance
WHERE MONTH(check_in) = MONTH(CURDATE())
GROUP BY emp_id;

-- Late Arrivals
SELECT emp_id, COUNT(*) AS late_days
FROM attendance
WHERE status = 'Late'
GROUP BY emp_id;

-- Employees with >5 late days
SELECT emp_id, COUNT(*) AS late_count
FROM attendance
WHERE status = 'Late'
GROUP BY emp_id
HAVING COUNT(*) > 5;

-- Department-wise Attendance
SELECT d.dept_name, COUNT(a.att_id) AS total_attendance
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Total Work Hours
SELECT emp_id,
SUM(calculate_work_hours(check_in, check_out)) AS total_hours
FROM attendance
GROUP BY emp_id;

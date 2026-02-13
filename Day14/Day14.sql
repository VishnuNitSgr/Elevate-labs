
DROP TABLE IF EXISTS employees;
DROP PROCEDURE IF EXISTS InsertEmployee;
DROP PROCEDURE IF EXISTS GetEmployeeCount;
DROP PROCEDURE IF EXISTS SafeInsertEmployee;
DROP FUNCTION IF EXISTS CalculateTax;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE PROCEDURE InsertEmployee(
    IN emp_name VARCHAR(100),
    IN emp_department VARCHAR(100),
    IN emp_salary DECIMAL(10,2),
    IN emp_bonus DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees(name, department, salary, bonus)
    VALUES(emp_name, emp_department, emp_salary, emp_bonus);
END //

CREATE PROCEDURE GetEmployeeCount(
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total FROM employees;
END //

CREATE FUNCTION CalculateTax(emp_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tax DECIMAL(10,2);
    IF emp_salary < 50000 THEN
        SET tax = emp_salary * 0.10;
    ELSE
        SET tax = emp_salary * 0.20;
    END IF;
    RETURN tax;
END //

CREATE PROCEDURE SafeInsertEmployee(
    IN emp_name VARCHAR(100),
    IN emp_department VARCHAR(100),
    IN emp_salary DECIMAL(10,2),
    IN emp_bonus DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred. Transaction rolled back.' AS message;
    END;

    START TRANSACTION;

    INSERT INTO employees(name, department, salary, bonus)
    VALUES(emp_name, emp_department, emp_salary, emp_bonus);

    COMMIT;
END //

DELIMITER ;

CREATE INDEX idx_department ON employees(department);

CALL InsertEmployee('Vishnu', 'IT', 50000, 5000);
CALL InsertEmployee('Rahul', 'HR', 40000, 4000);
CALL SafeInsertEmployee('Anita', 'Finance', 60000, 6000);

CALL GetEmployeeCount(@empCount);
SELECT @empCount AS TotalEmployees;

SELECT name, salary, CalculateTax(salary) AS tax, bonus FROM employees;
SELECT * FROM employees;


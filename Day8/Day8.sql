SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id

UNION

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;

SELECT 'INNER JOIN' AS join_type, COUNT(*) AS rows_count
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id

UNION ALL

SELECT 'LEFT JOIN', COUNT(*)
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION ALL

SELECT 'RIGHT JOIN', COUNT(*)
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees AS e
JOIN departments AS d
    ON e.dept_id = d.dept_id;



CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    score INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO students (name, department, score) VALUES
('Amit', 'CSE', 85),
('Riya', 'ECE', 92),
('Vishnu', 'CSE', 92),
('Ankit', 'ME', 78),
('Neha', 'ECE', 88),
('Rahul', 'CSE', 70),
('Pooja', 'ME', 85),
('Karan', 'CSE', 95);

SELECT * FROM students
ORDER BY score ASC;

-- Descending order
SELECT * FROM students
ORDER BY score DESC;

SELECT * FROM students
ORDER BY score DESC, name ASC;

SELECT * FROM students
ORDER BY score DESC
LIMIT 3;

SELECT * FROM students
WHERE department = 'CSE'
ORDER BY score DESC;

SELECT * FROM students
ORDER BY score DESC
LIMIT 3 OFFSET 0;

SELECT * FROM students
ORDER BY score DESC
LIMIT 3 OFFSET 3;
SELECT * FROM students
ORDER BY score DESC;

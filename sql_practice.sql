
USE mydatabase;

-- 🔹 Create Table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    dept_id INT
);


-- 🔹 Sample Data
INSERT INTO employees (name, salary, city, dept_id) VALUES
('Ravi', 50000, 'Bangalore', 101),
('Ali', 60000, 'Mumbai', 102),
('John', 55000, 'Bangalore', 101),
('Sara', 70000, 'Mumbai', 103);


-- 🔹 Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');


-- ============================================
-- 🔹 BASIC SELECT
-- ============================================

-- Q1: Select all columns from employees
SELECT *
FROM employees;


-- Q2: Select only name and salary
SELECT name, salary
FROM employees;


-- Q3: Get employees with salary > 55000
SELECT *
FROM employees
WHERE salary > 55000;


-- Q4: Get names where salary <= 55000
SELECT name
FROM employees
WHERE salary <= 55000;


-- Q5: Find employee with name 'Ali'
SELECT *
FROM employees
WHERE name = 'Ali';


-- Q6: Salary between 50000 and 60000
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 60000;


-- ============================================
-- 🔹 ORDER BY + LIMIT
-- ============================================

-- Q7: Sort by salary ASC
SELECT *
FROM employees
ORDER BY salary ASC;


-- Q8: Sort by salary DESC
SELECT *
FROM employees
ORDER BY salary DESC;


-- Q9: Top 2 highest paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 2;


-- Q10: Top 2 lowest paid employees
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 2;


-- Q11: Sort by salary DESC, then name ASC
SELECT *
FROM employees
ORDER BY salary DESC, name ASC;


-- Q12: Top 3 highest paid (name & salary only)
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- ============================================
-- 🔹 INSERT, UPDATE, DELETE
-- ============================================

-- Q13: Insert new employee
INSERT INTO employees (id, name, salary)
VALUES (5, 'Khalandar', 70000);


-- Q14: Insert employee without id (auto increment)
INSERT INTO employees (name, salary)
VALUES ('Sufi', 58415);


-- Q15: Update salary to 75000 for id = 5
UPDATE employees
SET salary = 75000
WHERE id = 5;


-- Q16: Increase salary by 5000 for all employees
UPDATE employees
SET salary = salary + 5000;


-- Q17: Delete employee with id = 5
DELETE FROM employees
WHERE id = 5;


-- Q18: Delete all records (DANGEROUS)
-- This will remove all rows from the table
DELETE FROM employees;


-- ============================================
-- 🔹 GROUP BY + AGGREGATION
-- ============================================

-- Q19: Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;


-- Q20: Count employees per city
SELECT city, COUNT(*) AS total_emp
FROM employees
GROUP BY city;


-- Q21: Average salary per city
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city;


-- Q22: Cities with avg salary > 55000
SELECT city
FROM employees
GROUP BY city
HAVING AVG(salary) > 55000;


-- Q23: Total salary per city > 100000
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
HAVING SUM(salary) > 100000;


-- ============================================
-- 🔹 JOINS
-- ============================================

-- Q24: INNER JOIN (only matching records)
SELECT Emp.name, Dep.dept_name
FROM employees AS Emp
INNER JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id;


-- Q25: LEFT JOIN (all employees)
SELECT Emp.name, Dep.dept_name
FROM employees AS Emp
LEFT JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id;


-- Q26: Employees without department
SELECT *
FROM employees AS Emp
LEFT JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id
WHERE Dep.dept_id IS NULL;


-- Q27: RIGHT JOIN (all departments)
SELECT Emp.name, Dep.dept_name
FROM employees AS Emp
RIGHT JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id;


-- Q28: FULL JOIN using UNION
SELECT Emp.name, Dep.dept_name
FROM employees AS Emp
LEFT JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id

UNION

SELECT Emp.name, Dep.dept_name
FROM employees AS Emp
RIGHT JOIN departments AS Dep
ON Emp.dept_id = Dep.dept_id;

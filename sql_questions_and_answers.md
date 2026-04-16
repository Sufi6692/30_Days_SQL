# SQL Interview Questions and Answers

This file keeps the content in one place with:

- questions
- short answers
- comparison tables
- SQL code examples

## 1. Primary Key vs Unique Key

Answer: A primary key uniquely identifies each row and cannot be `NULL`. A unique key also enforces uniqueness, but many databases allow `NULL` values in a unique key.

| Feature | Primary Key | Unique Key |
|---|---|---|
| Uniqueness | Required | Required |
| NULL values | Not allowed | Often allowed |
| Count per table | One | Multiple |
| Purpose | Row identification | Enforce uniqueness |

## 2. WHERE vs HAVING

Answer: `WHERE` filters rows before grouping. `HAVING` filters grouped data after aggregation.

| Feature | WHERE | HAVING |
|---|---|---|
| Works on | Rows | Groups |
| Used before/after grouping | Before | After |
| Aggregate functions | No | Yes |

```sql
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 3;
```

## 3. DDL, DML, DCL, TCL, DQL

Answer:

- `DDL`: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
- `DML`: `INSERT`, `UPDATE`, `DELETE`
- `DCL`: `GRANT`, `REVOKE`
- `TCL`: `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- `DQL`: `SELECT`

## 4. DROP vs DELETE

Answer: `DELETE` removes rows. `DROP` removes the whole table structure and its data.

| Feature | DELETE | DROP |
|---|---|---|
| Removes rows | Yes | Yes |
| Removes table structure | No | Yes |
| WHERE supported | Yes | No |
| Rollback possible | Usually yes in transaction | Usually no |

## 5. BETWEEN vs IN

Answer: `BETWEEN` checks a range. `IN` checks a list of values.

| Feature | BETWEEN | IN |
|---|---|---|
| Best for | Ranges | Value lists |
| Example | `salary BETWEEN 10000 AND 50000` | `id IN (1,2,3)` |

## 6. UNION vs UNION ALL

Answer: `UNION` removes duplicates. `UNION ALL` keeps duplicates and is faster.

| Feature | UNION | UNION ALL |
|---|---|---|
| Duplicate removal | Yes | No |
| Performance | Slower | Faster |

## 7. SQL vs NoSQL

Answer: SQL databases are relational and table-based. NoSQL databases are non-relational and schema-flexible.

| Feature | SQL | NoSQL |
|---|---|---|
| Data model | Tables | Documents, key-value, graph |
| Schema | Fixed | Flexible |
| Scaling | Vertical | Horizontal |

## 8. SQL vs PL/SQL

Answer: SQL is a query language. PL/SQL is Oracle's procedural extension to SQL.

| Feature | SQL | PL/SQL |
|---|---|---|
| Type | Query language | Procedural language |
| Loops/conditions | No | Yes |
| Error handling | Limited | Advanced |

## 9. On-Premise SQL vs Cloud SQL

| Feature | On-Premise SQL | Cloud SQL |
|---|---|---|
| Hosting | Local servers | Cloud |
| Scaling | Limited | Easier |
| Maintenance | Manual | Managed |

## 10. INNER JOIN vs SELF JOIN

Answer: `INNER JOIN` joins related rows from two sources. `SELF JOIN` joins a table with itself.

| Feature | INNER JOIN | SELF JOIN |
|---|---|---|
| Tables used | Usually 2 tables | Same table twice |
| Common use | Match related data | Employee-manager hierarchy |

## 11. LEFT JOIN vs RIGHT JOIN

| Feature | LEFT JOIN | RIGHT JOIN |
|---|---|---|
| Keeps all rows from | Left table | Right table |
| Nulls appear on | Right side | Left side |

## 12. FULL JOIN vs CARTESIAN JOIN

| Feature | FULL JOIN | CARTESIAN JOIN / CROSS JOIN |
|---|---|---|
| Join condition | Yes | Not required |
| Output | Matched + unmatched rows | Every row combination |

## 13. JOIN vs UNION

| Feature | JOIN | UNION |
|---|---|---|
| Combines | Columns | Rows |
| Requirement | Related tables | Same number of columns |

## 14. NULL vs 0 vs Empty String

| Value | Meaning |
|---|---|
| `NULL` | Unknown or missing value |
| `0` | Numeric zero |
| `''` | Empty text |

## 15. CHAR vs VARCHAR vs VARCHAR2

| Type | Meaning |
|---|---|
| `CHAR` | Fixed-length string |
| `VARCHAR` | Variable-length string |
| `VARCHAR2` | Oracle variable-length string |

## 16. Clustered Index vs Non-Clustered Index

| Feature | Clustered | Non-Clustered |
|---|---|---|
| Data order | Physical | Separate index structure |
| Count per table | One | Multiple |

## 17. OLTP vs OLAP

| Feature | OLTP | OLAP |
|---|---|---|
| Use | Transactions | Analytics |
| Queries | Short and frequent | Complex and heavy |

## 18. RDBMS vs DBMS

| Feature | DBMS | RDBMS |
|---|---|---|
| Relationships | Limited | Supported |
| Data form | General storage | Relational tables |

## 19. What is a constraint?

Answer: Constraints are rules that enforce data integrity, such as `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, and `DEFAULT`.

## 20. What is COALESCE?

Answer: `COALESCE` returns the first non-`NULL` value.

```sql
SELECT COALESCE(phone, mobile, 'Not Available') AS contact_number
FROM customers;
```

## 21. UNION, MINUS, INTERSECT

Answer:

- `UNION`: combines results and removes duplicates
- `MINUS` / `EXCEPT`: rows in first query but not second
- `INTERSECT`: common rows in both queries

## 22. What is a view?

Answer: A view is a virtual table based on a query.

Types:

- Simple view
- Complex view
- Inline view
- Materialized view

## 23. What is a temporary table?

Answer: A temporary table stores data only for a session or transaction.

```sql
CREATE TEMPORARY TABLE TempEmployees (
  ID INT,
  Name VARCHAR(50)
);
```

## 24. What are ACID properties?

Answer:

- Atomicity
- Consistency
- Isolation
- Durability

## 25. When do you use DISTINCT?

Answer: Use `DISTINCT` to remove duplicate rows from a result.

```sql
SELECT DISTINCT department
FROM employees;
```

## 26. What is a foreign key?

Answer: A foreign key links a column in one table to the primary key of another table.

## 27. How do you prevent SQL injection?

Answer: Use prepared statements or parameterized queries, validate input, and avoid string concatenation.

```sql
-- Bad
SELECT * FROM users WHERE id = " + user_input;

-- Good
SELECT * FROM users WHERE id = ?;
```

## 28. What is a function in SQL?

Answer: A function performs an operation and returns a value. It improves reuse and readability.

## 29. What is normalization?

Answer: Normalization reduces redundancy and improves integrity.

- `1NF`: atomic values
- `2NF`: no partial dependency
- `3NF`: no transitive dependency
- `BCNF`: every determinant is a candidate key

## 30. What is AUTO_INCREMENT?

Answer: `AUTO_INCREMENT` generates unique numeric values automatically for new rows.

```sql
CREATE TABLE Employee (
  Employee_id INT NOT NULL AUTO_INCREMENT,
  Employee_name VARCHAR(255) NOT NULL,
  Employee_designation VARCHAR(255),
  Age INT,
  PRIMARY KEY (Employee_id)
);
```

## 31. What are aggregate functions?

Answer: They return one result from many rows.

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

## 32. What are SQL dialects?

Answer: Vendor-specific versions of SQL, like:

- T-SQL
- PL/SQL
- PostgreSQL SQL
- MySQL SQL extensions

## 33. Types of SQL operators

Answer:

- Arithmetic
- Comparison
- Logical
- Set

## 34. How to select all columns?

```sql
SELECT * FROM table_name;
```

## 35. What are scalar functions?

Answer: Functions returning one value, such as `UPPER()`, `LOWER()`, `ROUND()`, `LEN()`, and date functions.

## 36. What are indexed views?

Answer: Indexed views store indexed results physically to improve performance in some systems like SQL Server.

## 37. Isolation levels

Answer:

1. Read Uncommitted
2. Read Committed
3. Repeatable Read
4. Serializable
5. Snapshot

## 38. What is SSIS?

Answer: SQL Server Integration Services is Microsoft's ETL tool for extract, transform, and load workflows.

## 39. Applications of SQL

- Database operations
- Analytics and reporting
- Backend development
- ETL and warehousing
- Security and access control

## 40. What is DESC?

Answer: `DESC` sorts values in descending order.

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

## 41. What is a schema?

Answer: A schema is a logical namespace that groups database objects.

```sql
CREATE SCHEMA sales;
```

## 42. Can we rollback DELETE?

Answer: Yes, if the `DELETE` is inside a transaction and not committed yet.

```sql
BEGIN TRANSACTION;
DELETE FROM employees WHERE employee_id = 101;
ROLLBACK;
```

## 43. CASE statement

Answer: `CASE` applies if-else logic in SQL.

```sql
SELECT product_name,
       CASE
         WHEN price > 100 THEN 'Premium'
         WHEN price > 50 THEN 'Standard'
         ELSE 'Budget'
       END AS tier
FROM products;
```

## 44. What is PIVOT?

Answer: `PIVOT` turns row values into columns for easier reporting.

```sql
SELECT product, [2022] AS sales_2022, [2023] AS sales_2023
FROM (
  SELECT product, year, sales
  FROM sales
) AS SourceTable
PIVOT (
  SUM(sales) FOR year IN ([2022], [2023])
) AS PivotTable;
```

## 45. What is dynamic SQL?

Answer: Dynamic SQL is built at runtime.

```sql
DECLARE @tableName NVARCHAR(50) = 'employees';
DECLARE @query NVARCHAR(MAX);

SET @query = 'SELECT * FROM ' + @tableName + ' WHERE department = ''HR''';
EXEC(@query);
```

## 46. What is RDBMS?

Answer: An RDBMS stores data in related tables and supports keys, normalization, and relationships.

## 47. What is an alias?

Answer: An alias is a temporary name for a table or column.

```sql
SELECT e.employee_name AS name
FROM employees e;
```

## 48. Order of execution in SQL

1. `FROM`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`

## 49. What is NULL?

Answer: `NULL` means unknown or missing value. It is not the same as `0` or an empty string.

## 50. What is SQL JOIN?

Answer: A JOIN combines rows from tables based on a relationship.

## 51. Types of JOINs

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- SELF JOIN
- CROSS JOIN

## 52. Is SELF JOIN inner or outer?

Answer: It can be written as inner, left, right, or cross. "Self" only means the same table is used twice.

## 53. What is NATURAL JOIN?

Answer: It automatically joins on columns with the same names and compatible types.

## 54. What is EQUI JOIN?

Answer: An equi join matches rows using `=`.

```sql
SELECT t1.col1, t2.col2
FROM table1 t1
JOIN table2 t2
  ON t1.id = t2.id;
```

## 55. Can you join a table to itself?

Answer: Yes, that is a self join.

## 56. What is HASH JOIN?

Answer: A hash join uses a hash table to find matches and is efficient for large unsorted data.

## 57. What is MERGE JOIN?

Answer: A merge join works best when both inputs are sorted.

## 58. What is NESTED JOIN / Nested Loop Join?

Answer: It compares each row from one input with matching rows in another input. Good for smaller or indexed datasets.

## 59. How do you map a many-to-many relationship?

Answer: Use a junction table with foreign keys from both related tables.

## 60. What is CROSS JOIN?

Answer: It returns every possible combination of rows.

## 61. What is a CTE?

Answer: A Common Table Expression is a temporary named result set created with `WITH`.

```sql
WITH DeptAvg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT *
FROM DeptAvg;
```

## 62. What is a recursive CTE?

Answer: A recursive CTE references itself to process hierarchies.

```sql
WITH RECURSIVE employee_hierarchy AS (
  SELECT id, name, manager_id
  FROM employees
  WHERE manager_id IS NULL

  UNION ALL

  SELECT e.id, e.name, e.manager_id
  FROM employees e
  JOIN employee_hierarchy eh
    ON e.manager_id = eh.id
)
SELECT *
FROM employee_hierarchy;
```

## 63. One-to-many relationship join structure

Answer: Put the primary key from the "one" side into the "many" side as a foreign key.

## 64. Detect cycle in employee-manager hierarchy

```sql
WITH RECURSIVE Hierarchy AS (
  SELECT employee_id,
         manager_id,
         CAST(employee_id AS VARCHAR(200)) AS path
  FROM Supervision

  UNION ALL

  SELECT s.employee_id,
         s.manager_id,
         CONCAT(h.path, '->', s.employee_id) AS path
  FROM Supervision s
  JOIN Hierarchy h
    ON s.manager_id = h.employee_id
  WHERE h.path NOT LIKE CONCAT('%', s.employee_id, '%')
)
SELECT DISTINCT employee_id, path
FROM Hierarchy
WHERE path LIKE CONCAT('%', employee_id, '%');
```

## 65. Update total_sales for each employee

```sql
UPDATE Intellipaat_Emp e
SET total_sales = (
  SELECT COALESCE(SUM(s.sale_amount), 0)
  FROM sales s
  WHERE s.employee_id = e.employee_id
)
WHERE EXISTS (
  SELECT 1
  FROM sales s
  WHERE s.employee_id = e.employee_id
);
```

## 66. Join 3 tables

```sql
SELECT t1.col1, t2.col2, t3.col3
FROM table1 t1
JOIN table2 t2 ON t1.col1 = t2.col1
JOIN table3 t3 ON t2.col1 = t3.col1;
```

## 67. Select name and age from Employees

```sql
SELECT name, age
FROM Employees;
```

## 68. Employees older than 35 in operations

```sql
SELECT *
FROM Intellipaat_Emp
WHERE age > 35
  AND department = 'operations';
```

## 69. Average salary for each department

```sql
SELECT department, AVG(salary) AS avg_salary
FROM Intellipaat_Emp
GROUP BY department;
```

## 70. Employees whose names start with 'Int'

```sql
SELECT *
FROM Intellipaat_Emp
WHERE employee_name LIKE 'Int%';
```

## 71. Add a new employee record

```sql
INSERT INTO Intellipaat_Emp (Employee_name, Age, Department, Salary)
VALUES ('John Doe', 28, 'Marketing', 50000);
```

## 72. Last five records by ID

```sql
SELECT *
FROM Intellipaat_Emp
ORDER BY Employee_id DESC
LIMIT 5;
```

## 73. Label salaries above 5000 as High Salary

```sql
SELECT Employee_name,
       Salary,
       CASE
         WHEN Salary > 5000 THEN 'High Salary'
         ELSE 'Low Salary'
       END AS salary_category
FROM Intellipaat_Emp;
```

## 74. All employees and project names, NULL if no project

```sql
SELECT e.Employee_name, p.project_name
FROM Intellipaat_Emp e
LEFT JOIN Projects p
  ON e.project_id = p.id;
```

## 75. All departments with employee names

```sql
SELECT dept.DepartmentName, emp.Employee_name
FROM Departments dept
LEFT JOIN Intellipaat_Emp emp
  ON emp.DepartmentID = dept.DepartmentID;
```

## 76. Increase HR salary by 10%

```sql
UPDATE Intellipaat_Emp
SET Salary = Salary * 1.1
WHERE Department = 'HR';
```

## 77. Duplicate employee names

```sql
SELECT Employee_name
FROM Intellipaat_Emp
GROUP BY Employee_name
HAVING COUNT(*) > 1;
```

## 78. Find duplicate rows

```sql
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY Employee_name, Age, Department, Salary
           ORDER BY Employee_id
         ) AS rn
  FROM Intellipaat_Emp
) t
WHERE rn > 1;
```

## 79. Total sales in each category

```sql
SELECT category, SUM(sales_amt) AS total_sales
FROM sales
GROUP BY category;
```

## 80. Copy data from one table to another

```sql
INSERT INTO employee_duplicate
SELECT *
FROM employees;
```

## 81. Employees earning more than average salary

```sql
SELECT *
FROM Intellipaat_Emp
WHERE salary > (
  SELECT AVG(salary)
  FROM Intellipaat_Emp
);
```

## 82. Second-highest salary

```sql
SELECT MAX(salary)
FROM Intellipaat_Emp
WHERE salary < (
  SELECT MAX(salary)
  FROM Intellipaat_Emp
);
```

## 83. Even and odd rows using ID

```sql
SELECT *
FROM Intellipaat_Emp
WHERE Employee_id % 2 = 0;

SELECT *
FROM Intellipaat_Emp
WHERE Employee_id % 2 = 1;
```

## 84. Top 2 salaries from each department

```sql
SELECT Employee_name, Department, Salary
FROM (
  SELECT Employee_name,
         Department,
         Salary,
         ROW_NUMBER() OVER (
           PARTITION BY Department
           ORDER BY Salary DESC
         ) AS salary_rank
  FROM Intellipaat_Emp
) ranked
WHERE salary_rank <= 2;
```

## 85. Find missing numbers in sequence

```sql
SELECT (e.Employee_id + 1) AS missing_id
FROM Intellipaat_Emp e
WHERE (e.Employee_id + 1) NOT IN (
  SELECT Employee_id
  FROM Intellipaat_Emp
);
```

## 86. Swap Male and Female

```sql
UPDATE Intellipaat_Emp
SET Gender = CASE
               WHEN Gender = 'Male' THEN 'Female'
               WHEN Gender = 'Female' THEN 'Male'
               ELSE Gender
             END;
```

## 87. Find pairs of employees with same salary

```sql
SELECT A.Employee_name AS employee1,
       B.Employee_name AS employee2,
       A.Salary
FROM Intellipaat_Emp A
JOIN Intellipaat_Emp B
  ON A.Salary = B.Salary
 AND A.Employee_name < B.Employee_name;
```

## 88. Number of days with company

```sql
SELECT Employee_name,
       DATEDIFF(CURDATE(), Joining_date) AS days_with_company
FROM Intellipaat_Emp;
```

## 89. Employees hired on same day

```sql
SELECT A.Employee_name AS employee1,
       B.Employee_name AS employee2,
       A.Joining_date
FROM Intellipaat_Emp A
JOIN Intellipaat_Emp B
  ON A.Joining_date = B.Joining_date
 AND A.Employee_name < B.Employee_name;
```

## 90. Median salary in each department

```sql
WITH RankedSalaries AS (
  SELECT Department,
         Salary,
         ROW_NUMBER() OVER (
           PARTITION BY Department
           ORDER BY Salary
         ) AS rn_asc,
         ROW_NUMBER() OVER (
           PARTITION BY Department
           ORDER BY Salary DESC
         ) AS rn_desc
  FROM Intellipaat_Emp
)
SELECT Department, AVG(Salary) AS median_salary
FROM RankedSalaries
WHERE rn_asc = rn_desc
   OR rn_asc + 1 = rn_desc
GROUP BY Department;
```

## 91. Top 10% employees by salary

```sql
SELECT *
FROM (
  SELECT Employee_name,
         Salary,
         PERCENT_RANK() OVER (ORDER BY Salary DESC) AS pct_rank
  FROM Intellipaat_Emp
) Ranked
WHERE pct_rank <= 0.1;
```

## 92. Running total salary within each department

```sql
SELECT Department,
       Employee_name,
       Salary,
       SUM(Salary) OVER (
         PARTITION BY Department
         ORDER BY Salary
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_salary
FROM Intellipaat_Emp;
```

## 93. Time gap between consecutive logins

```sql
SELECT user_id,
       login_time,
       TIMESTAMPDIFF(
         HOUR,
         LAG(login_time) OVER (
           PARTITION BY user_id
           ORDER BY login_time
         ),
         login_time
       ) AS hours_since_last_login
FROM Logins;
```

## 94. List all products including products with no sales

```sql
SELECT p.product_id,
       p.product_name,
       COALESCE(SUM(s.sale_amount), 0) AS total_sales
FROM product_dim p
LEFT JOIN sales_fact s
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name;
```

## 95. Calculate YTD sales for each product

```sql
SELECT product_id,
       SUM(sale_amount) AS ytd_sales
FROM sales_fact
WHERE sale_date >= DATE_FORMAT(CURRENT_DATE, '%Y-01-01')
  AND sale_date <= CURRENT_DATE
GROUP BY product_id;
```

## 96. Another way to find second-highest salary

```sql
SELECT e_salary
FROM (
  SELECT e_salary,
         DENSE_RANK() OVER (ORDER BY e_salary DESC) AS rnk
  FROM employee
) ranked
WHERE rnk = 2;
```

## 97. Fetch most recent entries

```sql
SELECT *
FROM table_name
ORDER BY timestamp_column DESC;
```

## 98. Find products with no sales

```sql
SELECT p.product_id, p.product_name
FROM product p
LEFT JOIN sales s
  ON p.product_id = s.product_id
WHERE s.product_id IS NULL;
```

```sql
SELECT p.product_id, p.product_name
FROM products p
WHERE NOT EXISTS (
  SELECT 1
  FROM sales s
  WHERE s.product_id = p.product_id
);
```

## 99. Average and highest salary by vertical

```sql
SELECT vertical,
       AVG(salary) AS average_salary,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY vertical;
```

## 100. Top 3 products in each category by price

```sql
SELECT category, product_name, price
FROM (
  SELECT category,
         product_name,
         price,
         ROW_NUMBER() OVER (
           PARTITION BY category
           ORDER BY price DESC
         ) AS price_rank
  FROM inventory
) ranked
WHERE price_rank <= 3;
```

## 101. Month-on-month sales of a product

```sql
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS year_month,
       SUM(quantity_sold) AS total_sales
FROM sales
WHERE product_id = 'your_product_id'
GROUP BY year_month
ORDER BY year_month;
```

## 102. Managers and employees under them

```sql
SELECT M.employee_id AS manager_id,
       M.employee_name AS manager_name,
       E.employee_id AS employee_id,
       E.employee_name AS employee_name
FROM employees E
JOIN employees M
  ON E.manager_id = M.employee_id
ORDER BY M.employee_id, E.employee_id;
```

## 103. Total quantity of top purchased product

```sql
SELECT product_id,
       SUM(quantity_purchased) AS total_quantity_purchased
FROM purchases
GROUP BY product_id
ORDER BY total_quantity_purchased DESC
LIMIT 1;
```

## 104. Create materialized view for monthly total sales

```sql
CREATE MATERIALIZED VIEW mv_monthly_sales AS
SELECT product_id,
       YEAR(sale_date) AS year,
       MONTH(sale_date) AS month,
       SUM(sale_amount) AS total_sales
FROM sales_fact
GROUP BY product_id, YEAR(sale_date), MONTH(sale_date);
```

## 105. Detect missing dates in a sales sequence

```sql
WITH RECURSIVE DateSeries AS (
  SELECT MIN(sale_date) AS date_value,
         MAX(sale_date) AS max_date
  FROM sales

  UNION ALL

  SELECT date_value + INTERVAL 1 DAY,
         max_date
  FROM DateSeries
  WHERE date_value < max_date
)
SELECT date_value AS missing_date
FROM DateSeries
WHERE date_value NOT IN (
  SELECT sale_date
  FROM sales
)
ORDER BY missing_date;
```

## 106. Rank customers by total purchase amount and get top 10

```sql
WITH RankedCustomers AS (
  SELECT customer_id,
         SUM(purchase_amount) AS total_spent,
         DENSE_RANK() OVER (
           ORDER BY SUM(purchase_amount) DESC
         ) AS rank_num
  FROM orders
  GROUP BY customer_id
)
SELECT customer_id, total_spent
FROM RankedCustomers
WHERE rank_num <= 10;
```

## 107. Employee with third-highest salary

```sql
WITH CTE AS (
  SELECT Name,
         Salary,
         ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RN
  FROM EMPLOYEE
)
SELECT Name, Salary
FROM CTE
WHERE RN = 3;
```

## 108. Customer name and product name ordered by first name

```sql
SELECT a.first_name, b.Product_name
FROM customer a
LEFT OUTER JOIN Product b
  ON a.customer_id = b.customer_id
ORDER BY a.first_name;
```

## 109. Customer name and product name with default label

```sql
SELECT a.First_Name,
       ISNULL(b.Product_name, '-No Project Assigned') AS Product_Name
FROM customer a
LEFT OUTER JOIN product b
  ON a.customer_id = b.customer_id
ORDER BY a.first_name;
```

## 110. All product names even without matching customer ID

```sql
SELECT a.first_name, b.Product_name
FROM customer a
RIGHT OUTER JOIN product b
  ON a.customer_id = b.customer_id
ORDER BY a.first_name;
```

## 111. Complete record from both tables, show NULL if no match

```sql
SELECT a.first_name, b.Product_name
FROM customer a
FULL OUTER JOIN product b
  ON a.customer_id = b.customer_id
ORDER BY a.first_name;
```

## 112. Product not assigned to any employee or customer

```sql
SELECT b.Product_name
FROM customer a
RIGHT OUTER JOIN product b
  ON a.customer_id = b.customer_id
WHERE a.first_name IS NULL;
```

## 113. ProductName with more than one customer

```sql
SELECT p.Product_name, c.first_name
FROM product p
INNER JOIN customer c
  ON p.customer_id = c.customer_id
WHERE p.Product_name IN (
  SELECT Product_name
  FROM product
  GROUP BY Product_name
  HAVING COUNT(1) > 1
);
```

## 114. Nth highest salary

```sql
SELECT salary
FROM (
  SELECT salary,
         DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_num
  FROM employees
) ranked_salaries
WHERE rank_num = N;
```

## 115. Find and remove duplicate rows

```sql
DELETE FROM employees
WHERE id NOT IN (
  SELECT MIN(id)
  FROM employees
  GROUP BY name, salary
);
```

## 116. Names starting with A and ending with n

```sql
SELECT *
FROM employees
WHERE name LIKE 'A%n';
```

## 117. Show current date and time

SQL Server:

```sql
SELECT GETDATE();
```

MySQL:

```sql
SELECT NOW();
```

## 118. Create empty table with same structure

```sql
SELECT *
INTO new_table
FROM existing_table
WHERE 1 = 0;
```

## 119. Check if table exists before creating it

SQL Server:

```sql
IF NOT EXISTS (
  SELECT *
  FROM sys.tables
  WHERE name = 'employees'
)
BEGIN
  CREATE TABLE employees (
    id INT,
    name VARCHAR(50)
  );
END
```

MySQL:

```sql
CREATE TABLE IF NOT EXISTS employees (
  id INT,
  name VARCHAR(50)
);
```

## 120. How do you optimize a slow SQL query?

Answer:

- add indexes on filter and join columns
- avoid `SELECT *`
- filter early with `WHERE`
- inspect execution plan with `EXPLAIN`
- replace costly correlated subqueries when possible
- paginate or limit results
- avoid unnecessary sorting

## 121. What is database partitioning?

Answer: Partitioning splits a large table into smaller pieces for performance and manageability.

## 122. Horizontal vs vertical partitioning

| Type | Meaning |
|---|---|
| Horizontal | Split by rows |
| Vertical | Split by columns |

## 123. Third-party tools used in SQL Server

- SQL Prompt
- SQL Backup
- SQL Doc
- LiteSpeed
- SQL Check

## 124. How to track changes to sensitive data for auditing

Answer: Use audit tables, triggers, CDC, temporal tables, or built-in audit features.

```sql
CREATE TABLE audit_log (
  change_time TIMESTAMP,
  user_id INT,
  old_value JSONB,
  new_value JSONB
);
```

## 125. Best index for filtering by customer_id, order_date, and status

Answer: A composite index on those columns is a strong starting point.

```sql
CREATE INDEX idx_orders_customer_date_status
ON orders (customer_id, order_date, status);
```

## 126. What is denormalization?

Answer: Denormalization intentionally adds redundancy to improve read performance, especially in reporting systems.

## 127. View vs materialized view

| Feature | View | Materialized View |
|---|---|---|
| Storage | Query only | Stores data physically |
| Speed | Slower for heavy queries | Faster |
| Refresh needed | No | Yes |

## 128. What is a cursor?

Answer: A cursor processes rows one by one. Avoid it when set-based SQL can do the same job more efficiently.

## 129. RANK vs DENSE_RANK vs ROW_NUMBER

| Function | Ties | Gaps | Unique sequence |
|---|---|---|---|
| `RANK()` | Yes | Yes | No |
| `DENSE_RANK()` | Yes | No | No |
| `ROW_NUMBER()` | No | No | Yes |

## 130. How does an index work internally?

Answer: Most database indexes use a B-tree structure storing sorted keys and pointers, which speeds up lookups.

## 131. CAP theorem

Answer: In distributed systems, you generally choose two of the three:

- Consistency
- Availability
- Partition Tolerance

## 132. What is a stored procedure?

Answer: A stored procedure is a reusable set of SQL statements stored in the database.

## 133. GROUP BY and HAVING

Answer:

- `GROUP BY` creates groups for aggregation
- `HAVING` filters those groups

## 134. Types of SQL commands

Answer:

- DDL
- DML
- DCL
- TCL
- DQL

## 135. What is a subquery?

Answer: A subquery is a query written inside another query.

## 136. Correlated subquery vs nested subquery

| Type | Meaning |
|---|---|
| Correlated subquery | Depends on outer query row |
| Nested subquery | Independent subquery |

## 137. How do window functions work?

Answer: Window functions calculate across related rows without collapsing the result set like `GROUP BY` does.

```sql
SELECT employee_name,
       department,
       salary,
       RANK() OVER (
         PARTITION BY department
         ORDER BY salary DESC
       ) AS dept_rank
FROM employees;
```

## 138. What is a trigger?

Answer: A trigger is code that runs automatically when an event like `INSERT`, `UPDATE`, or `DELETE` happens on a table.

```sql
CREATE TRIGGER trigger_name
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  -- trigger logic
END;
```


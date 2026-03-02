USE mydatabase;
--  SELECT QUERY
-- 1. Retrieve All Customers Data 

SELECT *
FROM  customers;


-- 2.Retrieve each customer's name, Country and score
SELECT 
	first_name,
	country,
	score
FROM customers;


-- "WHERE"

-- 3.Retrives customers with a score not equal to 0
SELECT * 
FROM customers 
WHERE score != 0;


-- 4. Retrives customers from Germany
SELECT
	 first_name,
	 country
FROM customers
WHERE country = "Germany";


-- ORDERBY

-- 5.Retrive all customers and sort the results by the highest score frist

SELECT *
FROM customers
ORDER BY score DESC;

-- 6. Retrive all customers and sort the results by the lowest score frist

SELECT *
FROM customers
ORDER BY score ASC;

 /* 7. Retrive all customers and
 sort the results by the country
 and then by the highest score */
 
 SELECT * 
 FROM customers
 ORDER BY 
 country ASC,
 score DESC;
 
 
 -- GROUP BY
 
 
-- 8. Find the total score for each country 



SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country;


-- 9. Find the total score  and total number of  customers for each country 
SELECT 
	country,
	SUM(score) AS total_score,
    COUNT(id)  AS total_customers
FROM customers
GROUP BY country;
/* ==============================================================================
   HAVING
=============================================================================== */

/*10. Find the average score for each country
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430;

/* 11. Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- 12. Return Unique list of all countries
SELECT DISTINCT country
FROM customers;

/* ==============================================================================
   TOP
=============================================================================== */

-- 13. Retrieve only 3 Customers
SELECT *
FROM customers
LIMIT 3;

-- 14. Retrieve the Top 3 Customers with the Highest Scores
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;

-- 15. Retrieve the Lowest 2 Customers based on the score
SELECT  *
FROM customers
ORDER BY score ASC
LIMIT 2;

-- Get the Two Most Recent Orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 2;

/* ==============================================================================
   All Together
=============================================================================== */

/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC;

/* ============================================================================== 
   COOL STUFF - Additional SQL Features
=============================================================================== */

-- Execute multiple queries at once
SELECT * FROM customers;
SELECT * FROM orders;

/* Selecting Static Data */
-- Select a static or constant value without accessing any table
SELECT 123 AS static_number;

SELECT 'Hello' AS static_string;

-- Assign a constant value to a column in a query
SELECT
    id,
    first_name,
    'New Customer' AS customer_type
FROM customers;
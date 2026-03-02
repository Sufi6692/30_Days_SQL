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
-- WHERE Operators 

-- (I. Comparison Operators)

 -- "="
USE mydatabase;
-- 1. Retrieve all customers from Germany
SELECT *
FROM customers
WHERE country = "Germany";

-- 2. Retrieve all customers who are not from Germany 

-- "<>, !="
SELECT *
FROM customers 
WHERE country <> "Germany";

-- or 

SELECT * 
FROM customers 
WHERE country != "Germany";

-- 3. Retrieve all customers with a score greater than 500
 -- ">"
SELECT *
FROM customers
WHERE score > 500;


-- 4. Retrieve all customers with a score of 500 or more
-- ">="
SELECT * 
FROM customers
WHERE score >= 500;


-- 5. Retrieve all customers with a score less than 500

-- "<"
SELECT *
FROM customers 
WHERE score < 500;

-- 6. Retrieve all customers with a score of 500 or less

-- "<="

SELECT *
FROM customers 
WHERE score <= 500;


-- (II. Logical Operators)

-- "AND"

-- 7. Retrieve all customers who are from USA  And have a score greater than 500 

SELECT *
FROM customers 
WHERE country ="USA"  AND score > 500;


-- "OR"

/*  8. Retrieve all customers who are either from the USA 
OR have a score greater than 500 */

SELECT * 
FROM customers 
WHERE country = "USA"  OR score > 500;



-- 9. Retrieve all customers with a score NOT less than 500 

SELECT *
FROM customers
WHERE NOT score < 500 ;


-- (III. Range Operator )

-- "BETWEEN"

/* 10. Retrieve all customers whose score falls 
in the range between 100 and 500 */

SELECT * 
FROM customers 
WHERE score BETWEEN 100 AND 500;


-- OR

SELECT *
FROM customers 
WHERE score >= 100 AND score <= 500;


-- (IV. Membership Operator)

-- "IN"

/*  11. Retrieve all customers from 
either Germany or USA */

SELECT *
FROM customers 
WHERE country IN ("Germany", "USA");

-- OR 

SELECT * 
FROM customers 
WHERE country = "Germany" OR country = "USA";

-- "NOT IN"

/* 12. Retrive all customers not from Germany and USA */


SELECT *
FROM customers 
WHERE country NOT IN ("Germany","USA");


-- ( V. Serach Operator)

-- "LIKE"

-- 13. FInd all customers whose first name starts with "M"

SELECT * 
FROM customers 
WHERE first_name  LIKE "M%";


-- 14. Find all customers whose first name ends with "N"

SELECT * 
FROM customers 
WHERE first_name LIKE "%n";

-- 15. Find all customers whose first name contains "R"

SELECT * 
FROM customers 
WHERE first_name LIKE "%r%";

-- 16 . Find all customers whose first name has "r" in the third position 


SELECT *
FROM customers 
WHERE first_name  LIKE "__r%";








USE mydatabase;

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */

SELECT *
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id
WHERE O.customer_id IS NULL; 

-- RIGHT ANTI JOIN
/* Get all orders without matching customers */

SELECT *
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id
WHERE C.id IS NULL;

-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */

SELECT *
FROM orders AS O
LEFT JOIN customers AS C
ON C.id = O.customer_id
WHERE C.id IS NULL;


SELECT *
FROM orders AS o 
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL;

/* Get all customers along with their orders, 
   but only for customers who have placed an order */
   
   SELECT *
   FROM customers AS C
   LEFT JOIN orders AS O
   ON C.id = O.customer_id
   WHERE O.customer_id IS NOT NULL;


-- CROSS JOIN
/* Generate all possible combinations of customers and orders */
SELECT *
FROM customers
CROSS JOIN orders;


-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */


SELECT *
FROM customers AS C
LEFT JOIN orders AS O 
ON C.id = O.customer_id
WHERE O.customer_id IS NULL

union

SELECT *
FROM customers AS C
RIGHT JOIN orders AS O 
ON C.id = O.customer_id
WHERE C.id IS NULL;

/* Get all customers along with their orders, 
   but only for customers who have placed an order */
   
   
   
   SELECT *
   FROM customers AS C
   LEFT JOIN orders AS O
   ON C.id = O.customer_id
   WHERE O.customer_id IS NOT NULL;
   
   


   

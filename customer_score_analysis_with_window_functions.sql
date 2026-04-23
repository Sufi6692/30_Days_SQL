USE salesdb;
-- Find the total number of orders

SELECT *
FROM orders;

SELECT 
count(*) TotalOrders
FROM orders;


-- Find the total number of orders
-- Additionally provide details such order Id, Order date

SELECT 
	orderid,
	orderdate,
	COUNT(*)  over() TotalOrders
FROM orders;


-- Find the total number of orders
-- Find the total number of orders for each customers
-- Additionally provide details such order Id, Order date

SELECT 
	orderid,
    orderdate,
    customerid,
    COUNT(*)  over() TotalOrders,
    COUNT(*) OVER(partition by customerid) TotalOrdersByCustomerId
FROM orders;


-- Find the total number of customers
-- Additionally provide all customers  details

SELECT *,
    COUNT(*) OVER() totalCustomres
FROM customers;


SELECT 
* FROM orders;

-- Find the total number of score for the customers

SELECT 
*,
COUNT(score)OVER() TotalNumberOfScore
FROM customers;

-- Check whether the table 'orders' contains any duplicate rows

SELECT 
orderid,
count(*) over(partition by orderid) CheckPk
FROM orders;

SELECT *
FROM(
	SELECT
		orderid,
		count(*) over(partition by orderid) CheckPk
	FROM orders_archive
    )t WHERE CheckPk >1;


-- Find the total sales across all orders
-- And the total sales for each product 
-- Additionally provide details such order Id, Order date

SELECT 
	orderid,
	orderdate,
    sales,
    productid,
	SUM(sales) OVER() TotalSales,
    SUM(sales) OVER(partition by productid) TotalSalesByProduct
FROM orders;


-- Find the percentage contribuation of each product's sales to the total sales

SELECT 
		orderid,
		orderdate,
		sales,
		SUM(sales) OVER() TotalSales,
		ROUND(CAST(sales AS Float)/SUM(sales) OVER() * 100,2) PercentageOfTotal
FROM orders;


-- Find the AVG sales across all orders
-- And the AVG sales for each product 
-- Additionally provide details such order Id, Order date

SELECT 
	orderid,
    orderdate,
    sales,
	AVG(sales) OVER() TotalSales,
    AVG(sales) OVER(partition by productid) TotalSalesByProduct
FROM orders;

-- Find the AVG score of customers
-- Additionally provide details such Customer Id,last Name
SELECT 
    customerid,
    lastname,
    score,
    COALESCE(score, 0) AS CustomerScore,
    AVG(score) OVER() AS AvgScore,
    AVG(COALESCE(score, 0)) OVER() AS AvgScoreWithOutNull
FROM customers;

    
-- Find all orders where sales are higher than the average sales across all orders
SELECT *
FROM(SELECT 
	orderid,
	productid,
	sales,
	AVG(sales) OVER() AvgSales
FROM orders)t WHERE Sales > AvgSales;


-- Find the highest and lowest sales of all orders
-- Find the highest and lowest sales for each product 
-- Additionally provide details such orderId, order date

SELECT 
orderid,
orderdate,
productid,
sales,

MAX(sales) OVER() HighestSales,
MIN(sales) OVER() LowestSales,
MAX(sales) OVER(partition by productid) HighestSalesByProduct,
MIN(sales) OVER(partition by productid) LowestSalesByProduct
FROM orders;





















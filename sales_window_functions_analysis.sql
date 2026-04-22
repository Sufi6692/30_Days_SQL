USE salesdb;

-- Find the total sales Across all orders
	SELECT 
    SUM(sales) TotalSales
    FROM orders;
    
    
    -- Find the total sales for each product 
SELECT 
    productid,
    SUM(sales) total_sales
FROM orders
GROUP BY productid;
    
    
/* Find the total sales for each product
Additionally provide details such order id & order date */

SELECT 
	orderid,
	orderdate,
	productid,
	SUM(sales) over( partition by productid) TotalSalesByProducts
FROM orders;

-- Find the total sales acorss all orders 
-- additional provide details such order Id, order date


SELECT 
	orderid,
    orderdate,
	SUM(sales)Over() TotalSales
FROM orders;

-- Find the total sales for the each product
-- Additionally provide details such order Id, order date

SELECT 
	orderid,
	orderdate,
	SUM(Sales) OVER(partition by productid) TotalSalesByProducts
FROM orders;



-- Find the total sales across all orders
-- Find the total sales for each product 
-- Additionally provide details such order Id, order date

SELECT 
	orderid,
	orderdate,
	productid,
	sales,
	SUM(sales) OVER() TotalSales,
    SUM(sales) OVER(partition by productid) TotalSalesByProducts
FROM orders;
    
    
SELECT 
	orderid,
    orderdate,
    productid,
    sales,
    orderstatus,
    SUM(sales)OVER() TotalSales,
    SUM(sales) OVER(partition by productid) TotalSalesByProducts,
    SUM(sales) OVER(partition by productid,orderstatus) SalesByProductsAndStatus
FROM orders;
    
    
-- Rank each orders based on their sales from highest to lowest
-- Additionally provide details such order Id, Order date


SELECT 
	orderid,
    orderdate,
    sales,
    RANK()OVER(order by sales ASC) RankSalesf
FROM orders;

-- Frame 

SELECT 
	orderid,
    orderdate,
    orderstatus,
    sales,
	SUM(sales) OVER (partition by orderstatus order by orderdate 
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) TotalSales
FROM orders;



-- Rank Customers based on their total sales
SELECT 
	customerid,
    SUM(sales)TotalSales,
    RANK()OVER(order by SUM(sales) DESC) RankCustomers
FROM orders
GROUP BY customerid;
    




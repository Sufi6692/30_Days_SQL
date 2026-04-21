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
SUM(sales) over(order by order_id)

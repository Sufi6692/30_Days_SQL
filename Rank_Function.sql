USE salesdb;

-- Rank the order basede on their sales from highest to lowest 

SELECT
	orderid,
	orderdate,
	productid,
	sales,
	ROW_NUMBER() OVER(ORDER BY sales DESC) SalcesRank_Row,
    RANK() OVER(ORDER BY sales DESC) SalesRank_Rank,
	DENSE_RANK() OVER(ORDER BY sales DESC) SalesDense_Rank
FROM orders;


-- Find the highest sales for the each product 
SELECT * FROM (
			SELECT 
				orderid,
				orderdate,
				productid,
				sales,
				ROW_NUMBER() OVER(PARTITION BY productid ORDER BY sales DESC) RankByProduct
			FROM orders
			)t WHERE RankByProduct = 1;
            
-- Find the lowest 2 customers based on their total sales
SELECT * FROM(

	SELECT 
		customerid,
		SUM(sales) TotalSales,
		ROW_NUMBER() OVER(ORDER BY SUM(sales)) RankCustomers
	FROM orders
	GROUP BY 
	Customerid
    ) T WHERE RankCustomers <=2;
	
            
-- Assign unique IDs to the rows of the 'Order Archive' Table 

SELECT 
    ROW_NUMBER() OVER (PARTITION BY orderid, orderdate ORDER BY orderid) AS UniqueID,
    orders_archive.*
FROM orders_archive;

-- Identify duplicate rows in the table 'Orders Archive'
-- And return a clean result without any duplicate
SELECT * FROM (
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY orderid ORDER BY creationtime DESC) rn,
		orders_archive.*
	FROM orders_archive
) t WHERE rn <=1;


           -- NTILE 
           
SELECT 
orderid,
sales,
NTILE(1) OVER(ORDER BY sales DESC) OneBucket,
NTILE(2) OVER(ORDER BY sales DESC) TwoBucket,
NTILE(3) OVER(ORDER BY sales DESC) ThreeBucket,
NTILE(4) OVER(ORDER BY sales DESC) FourBucket,
NTILE(5) OVER(ORDER BY sales DESC) FiveBucket
FROM orders;
            
            
            
            
 -- Segment all orders into 3 categories : High, Medium and Low sales.
 
 SELECT *,
CASE WHEN Buckets = 1 THEN 'High'
 WHEN Buckets = 2 THEN 'Medium'
 WHEN Buckets = 3 THEN 'Low'
END SalesSegmentations
FROM  (
	SELECT 
		orderid,
        sales,
        NTILE(3) OVER (ORDER BY sales DESC) Buckets
	FROM orders
) T;


-- In order to export the data, Divide the orders into 2 groups

SELECT 
NTILE (4) OVER (ORDER BY orderid) Buckets,
orders.*
FROM orders;
 
 
 -- Find the products that fall within the highest 40 % of the price 
 
 SELECT 
 *,
 CONCAT(DistRank * 100, '%') DistRankPerc
 FROM (
		SELECT 
			 product,
             price,
             CUME_DIST() OVER (ORDER BY price DESC) DistRank
		FROM products
        )T 
	WHERE DistRank <= 0.4;
            
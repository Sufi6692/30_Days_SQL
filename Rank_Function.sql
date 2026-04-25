USE salesdb;

-- Rank the order basede on their sales from highest to lowest 

SELECT
	orderid,
	orderdate,
	productid,
	sales,
	ROW_NUMBER() OVER(ORDER BY sales DESC) SalesRank_Row,
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
            
            
            
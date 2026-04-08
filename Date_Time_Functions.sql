

USE salesdb;

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/

SELECT *
FROM orders;

SELECT
orderid,
creationtime,
"2025-03-31" AS Hard_Coded,
current_timestamp() AS TODAY
FROM orders;


/* TASK 2:
   Extract various parts of CreationTime using DATETRUNCt, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/

SELECT 
orderid,
creationtime,
    DATE(creationtime) AS Truncated_Day,
    day(creationtime) AS day,
    month(creationtime) As Month,
    year(creationtime) As Year,
    dayname(creationtime) AS DayName,
    monthname(creationtime) AS MonthName,
    hour(creationtime) AS Hour,
    quarter(creationtime) AS Quarter
    from orders;
    
    /* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/


    SELECT
    YEAR(creationtime) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_year
ORDER BY order_year;

    
    
    
    
    


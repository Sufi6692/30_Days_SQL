-- 1. Total Revenue
SELECT 
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM order_details
JOIN pizzas USING(pizza_id);


-- 2. Daily Revenue Trend
SELECT orders.order_date,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS sales
FROM orders
JOIN order_details USING(order_id)
JOIN pizzas USING(pizza_id)
GROUP BY orders.order_date
ORDER BY orders.order_date;


-- 3. Running Total Revenue
WITH daily_sales AS (
  SELECT orders.order_date,
         ROUND(SUM(order_details.quantity * pizzas.price), 2) AS sales
  FROM orders
  JOIN order_details USING(order_id)
  JOIN pizzas USING(pizza_id)
  GROUP BY orders.order_date
)
SELECT *,
SUM(sales) OVER(
  ORDER BY order_date
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM daily_sales;


-- 4. Monthly Revenue
SELECT 
DATE_FORMAT(order_date, '%Y-%m') AS month,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue
FROM orders
JOIN order_details USING(order_id)
JOIN pizzas USING(pizza_id)
GROUP BY month
ORDER BY month;


-- 5. Monthly Running Revenue
WITH A AS (
  SELECT orders.order_date,
         ROUND(SUM(order_details.quantity * pizzas.price), 2) AS sales
  FROM orders
  JOIN order_details USING(order_id)
  JOIN pizzas USING(pizza_id)
  GROUP BY orders.order_date
)
SELECT *,
SUM(sales) OVER(
  PARTITION BY DATE_FORMAT(order_date, '%Y-%m')
  ORDER BY order_date
) AS monthly_running_total
FROM A;


-- 6. Top 5 Most Expensive Pizzas
SELECT pizza_types.name,
       pizzas.size,
       pizzas.price
FROM pizzas
JOIN pizza_types USING(pizza_type_id)
ORDER BY pizzas.price DESC
LIMIT 5;


-- 7. Rank Pizzas by Price
SELECT pizza_types.name,
       pizzas.price,
       RANK() OVER(ORDER BY pizzas.price DESC) AS rank_no
FROM pizzas
JOIN pizza_types USING(pizza_type_id);


-- 8. Top 3 Pizzas Per Category
SELECT *
FROM (
  SELECT pizza_types.category,
         pizza_types.name,
         pizzas.price,
         ROW_NUMBER() OVER(
           PARTITION BY pizza_types.category
           ORDER BY pizzas.price DESC
         ) AS rn
  FROM pizzas
  JOIN pizza_types USING(pizza_type_id)
) A
WHERE rn <= 3;


-- 9. Lowest Selling Pizzas
SELECT pizza_types.name,
       SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas USING(pizza_id)
JOIN pizza_types USING(pizza_type_id)
GROUP BY pizza_types.name
ORDER BY total_sold ASC
LIMIT 5;


-- 10. Top Revenue Generating Pizza
SELECT pizza_types.name,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue
FROM order_details
JOIN pizzas USING(pizza_id)
JOIN pizza_types USING(pizza_type_id)
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 1;


-- 11. Peak Order Day
SELECT order_date,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;



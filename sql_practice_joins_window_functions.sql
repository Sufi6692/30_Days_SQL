
/* =====================================================
   Q1. Show all customers and their orders
   ===================================================== */
SELECT *
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id;


/* =====================================================
   Q2. Show all customers even if they have no orders
   ===================================================== */
SELECT *
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customer_id;


/* =====================================================
   Q3. Count total orders per customer
   ===================================================== */
SELECT 
    c.id,
    c.first_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.id, c.first_name;


/* =====================================================
   Q4. Count total orders (simple aggregate)
   ===================================================== */
SELECT COUNT(*) AS total_orders
FROM orders;


/* =====================================================
   Q5. Average score with NULL handling
   ===================================================== */
SELECT 
    customerid,
    COALESCE(score, 0) AS score,
    AVG(score) OVER() AS avg_score
FROM customers;


/* =====================================================
   Q6. Customers with more than 2 orders
   ===================================================== */
SELECT 
    c.id,
    c.first_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.id, c.first_name
HAVING COUNT(o.order_id) > 2;


/* =====================================================
   Q7. Customers with zero orders
   ===================================================== */
SELECT 
    c.id,
    c.first_name
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customer_id
WHERE o.customer_id IS NULL;


/* =====================================================
   Q8. Sort customers by total orders
   ===================================================== */
SELECT 
    c.id,
    c.first_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.id, c.first_name
ORDER BY total_orders DESC;


/* =====================================================
   Q9. Difference between COUNT(*) vs COUNT(column)
   ===================================================== */
-- COUNT(o.order_id) ignores NULL
-- COUNT(*) counts all rows


/* =====================================================
   Q10. Rank orders by sales
   ===================================================== */
SELECT 
    order_id,
    sales,
    RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM orders;


/* =====================================================
   Q11. Dense rank example
   ===================================================== */
SELECT 
    order_id,
    sales,
    DENSE_RANK() OVER (ORDER BY sales DESC) AS dense_rank
FROM orders;


/* =====================================================
   Q12. Row number example
   ===================================================== */
SELECT 
    order_id,
    sales,
    ROW_NUMBER() OVER (ORDER BY sales DESC) AS row_num
FROM orders;


/* =====================================================
   Q13. Rank customers based on total orders
   ===================================================== */
SELECT 
    id,
    first_name,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS rank
FROM (
    SELECT 
        c.id,
        c.first_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.id = o.customer_id
    GROUP BY c.id, c.first_name
) t;


/* =====================================================
   Q14. Top 3 customers
   ===================================================== */
SELECT *
FROM (
    SELECT 
        id,
        first_name,
        total_orders,
        RANK() OVER (ORDER BY total_orders DESC) AS rank
    FROM (
        SELECT 
            c.id,
            c.first_name,
            COUNT(o.order_id) AS total_orders
        FROM customers c
        LEFT JOIN orders o
            ON c.id = o.customer_id
        GROUP BY c.id, c.first_name
    ) t
) x
WHERE rank <= 3;


/* =====================================================
   Q15. Use LEAD to get next order date
   ===================================================== */
SELECT 
    customer_id,
    order_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order
FROM orders;


/* =====================================================
   Q16. Days between orders
   ===================================================== */
SELECT 
    customer_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) - order_date AS days_diff
FROM orders;


/* =====================================================
   Q17. Total sales per product
   ===================================================== */
SELECT 
    product_id,
    SUM(sales) AS total_sales
FROM orders
GROUP BY product_id;


/* =====================================================
   Q18. Running total (window function)
   ===================================================== */
SELECT 
    order_id,
    sales,
    SUM(sales) OVER (ORDER BY order_id) AS running_total
FROM orders;


/* =====================================================
   Q19. Top 2 orders per customer
   ===================================================== */
SELECT *
FROM (
    SELECT 
        order_id,
        customer_id,
        sales,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY sales DESC
        ) AS rn
    FROM orders
) t
WHERE rn <= 2;


/* =====================================================
   Q20. Top 1 order per customer
   ===================================================== */
SELECT *
FROM (
    SELECT 
        order_id,
        customer_id,
        sales,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY sales DESC
        ) AS rn
    FROM orders
) t
WHERE rn = 1;


/* =================================================
   Q21. Rank within each customer (partition)
   ===================================================== */
SELECT 
    customer_id,
    order_id,
    sales,
    RANK() OVER (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS rank_per_customer
FROM orders;




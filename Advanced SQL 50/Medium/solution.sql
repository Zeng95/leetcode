-- PostgreSQL - Solution 1
WITH cte AS (
    SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    WHERE c.customer_id NOT IN (
        SELECT customer_id
        FROM orders
        WHERE product_name = 'C'
    )
)
SELECT customer_id, customer_name
FROM cte
WHERE product_name IN ('A', 'B')
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_name) = 2;
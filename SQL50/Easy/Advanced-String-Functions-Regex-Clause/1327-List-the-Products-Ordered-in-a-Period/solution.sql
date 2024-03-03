-- PostgreSQL - Solution 1 - Window Functions
WITH cte AS (
    SELECT
        DISTINCT p.product_name,
        SUM(o.unit) OVER (PARTITION BY p.product_id) AS unit
    FROM products p
    JOIN orders o
    ON p.product_id = o.product_id
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
)
SELECT *
FROM cte
WHERE unit >= 100;
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

-- PostgreSQL - Solution 2
SELECT p.product_name, SUM(unit) AS unit
FROM orders o
JOIN products p
ON o.product_id = p.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 1
HAVING SUM(unit) >= 100
ORDER BY 1 ASC
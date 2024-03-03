-- PostgreSQL - Solution 1 - Common Table Expression (CTE) with Window Functions
WITH cte AS (
    SELECT
        DISTINCT p.product_name,
        SUM(o.unit) OVER (PARTITION BY p.product_id) AS unit_feb
    FROM products p
    JOIN orders o
    ON p.product_id = o.product_id
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
)
SELECT product_name, unit_feb AS unit
FROM cte
WHERE unit_feb >= 100;

-- PostgreSQL - Solution 2 - Common Table Expression (CTE)
WITH cte AS (
    SELECT product_id, SUM(unit) AS unit_feb
    FROM orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY 1
    HAVING SUM(unit) >= 100
)
SELECT p.product_name, c.unit_feb AS unit
FROM cte c
JOIN products p
ON c.product_id = p.product_id;

-- PostgreSQL - Solution 3 - Inner Join
SELECT p.product_name, SUM(unit) AS unit
FROM orders o
JOIN products p
ON o.product_id = p.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 1
HAVING SUM(unit) >= 100;
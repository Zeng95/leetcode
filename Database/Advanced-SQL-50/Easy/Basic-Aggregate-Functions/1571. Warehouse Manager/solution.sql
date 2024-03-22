-- Solution 1
WITH cte AS (
    SELECT
        w.*,
        width * length * height * units AS cubic_volume
    FROM products p
    JOIN warehouse w
    ON w.product_id = p.product_id
)
SELECT name AS warehouse_name, SUM(cubic_volume) AS volume
FROM cte
GROUP BY 1;

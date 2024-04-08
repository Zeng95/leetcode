-- Solution 1
WITH cte AS (
    SELECT seller_id, SUM(price) AS total_price
    FROM Sales
    GROUP BY seller_id
)
SELECT seller_id
FROM cte
WHERE total_price = (
    SELECT MAX(total_price) AS max_total_price
    FROM cte
);

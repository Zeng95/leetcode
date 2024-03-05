-- PostgreSQL - Solution 1
WITH cte AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) rnk
    FROM products
    WHERE change_date <= '2019-08-16'
    ORDER BY product_id
)
SELECT product_id, new_price AS price
FROM cte
WHERE rnk = 1
UNION
SELECT product_id, 10 AS price
FROM products
WHERE product_id NOT IN (SELECT product_id FROM cte);
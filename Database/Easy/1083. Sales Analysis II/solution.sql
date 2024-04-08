-- Solution 1
WITH cte AS (
    SELECT p.product_id, p.product_name, s.buyer_id, COUNT(*) OVER (PARTITION BY s.buyer_id) AS num_products
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
    WHERE p.product_name IN ('iPhone', 'S8')
    GROUP BY 1, 2, 3
)
SELECT buyer_id
FROM cte
WHERE product_name = 'S8' AND num_products = 1;

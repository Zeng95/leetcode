-- PostgreSQL - Solution 1
WITH t AS (
    SELECT customer_id, COUNT(DISTINCT product_key) AS per_customer_total_products
    FROM customer
    GROUP BY 1
    ORDER BY 1 ASC
)
SELECT t.customer_id
FROM t
JOIN (
    SELECT COUNT(*) AS total_products
    FROM product
) f
ON t.per_customer_total_products = f.total_products;

-- PostgreSQL - Solution 2
SELECT customer_id
FROM customer
GROUP BY 1
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
-- PostgreSQL - Solution 1 - Subquery with the EXTRACT() function
SELECT seller_name
FROM seller
WHERE seller_id NOT IN (
    SELECT DISTINCT seller_id
    FROM orders
    WHERE EXTRACT(YEAR FROM sale_date) = 2020
)
ORDER BY 1 ASC;

-- PostgreSQL - Solution 2 - Subquery with the BETWEEN Operator
SELECT seller_name
FROM seller
WHERE seller_id NOT IN (
    SELECT DISTINCT seller_id
    FROM orders
    WHERE sale_date between '2020-01-01' AND '2020-12-31'
)
ORDER BY 1 ASC;

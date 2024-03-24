-- Solution 1 - Using date_part()
WITH cte AS (
    SELECT
        o.customer_id,
        date_part('year', o.order_date) AS year,
        date_part('month', o.order_date) AS month
    FROM Orders o
    JOIN Product p
    ON o.product_id = p.product_id
    WHERE date_part('year', o.order_date) = '2020' AND date_part('month', o.order_date) IN ('6', '7')
    GROUP BY 1, 2, 3
    HAVING SUM(o.quantity * p.price) >= 100
)
SELECT c.customer_id, c.name
FROM cte
JOIN Customers c
ON cte.customer_id = c.customer_id
GROUP BY 1, 2
HAVING COUNT(month) = 2;

-- Solution 2 - Using EXTRACT()
WITH cte AS (
    SELECT
        o.customer_id,
        EXTRACT(year from o.order_date) AS year,
        EXTRACT(month from o.order_date) AS month
    FROM Orders o
    JOIN Product p
    ON o.product_id = p.product_id
    WHERE EXTRACT(year from o.order_date) = '2020' AND EXTRACT(month from o.order_date) IN ('6', '7')
    GROUP BY 1, 2, 3
    HAVING SUM(o.quantity * p.price) >= 100
)
SELECT c.customer_id, c.name
FROM cte
JOIN Customers c
ON cte.customer_id = c.customer_id
GROUP BY 1, 2
HAVING COUNT(month) = 2;

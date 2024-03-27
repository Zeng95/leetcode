-- Solution 1
SELECT
    c.name AS customer_name,
    c.customer_id,
    o.order_id,
    o.order_date
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
WHERE (o.customer_id, o.order_date) IN (
    SELECT customer_id, order_date
    FROM (
        SELECT
            customer_id,
            order_date,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC)
        FROM Orders
        GROUP BY 1, 2
    )
    WHERE row_number < 4
)
ORDER BY 1 ASC, 2 ASC, 4 DESC;

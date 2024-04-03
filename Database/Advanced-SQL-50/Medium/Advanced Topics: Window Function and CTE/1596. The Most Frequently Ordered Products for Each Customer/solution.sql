-- Solution 1
WITH cte AS (
    SELECT
        customer_id,
        product_id,
        COUNT(order_id) AS num_ordered_products,
        MAX(COUNT(order_id)) OVER (PARTITION BY customer_id) AS max_ordered_products
    FROM Orders
    GROUP BY 1, 2
)
SELECT cte.customer_id, p.product_id, p.product_name
FROM cte
JOIN Products p
ON cte.product_id = p.product_id
WHERE num_ordered_products = max_ordered_products;

-- Solution 2
WITH cte AS (
    SELECT
        customer_id,
        product_id,
        COUNT(order_id) AS num_orders,
        RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(order_id) DESC) AS r
    FROM Orders
    GROUP BY 1, 2
)
SELECT customer_id, p.product_id, p.product_name
FROM cte
JOIN Products p
ON cte.product_id = p.product_id
WHERE r = 1;

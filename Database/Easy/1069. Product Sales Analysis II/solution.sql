-- Solution 1
SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY 1;

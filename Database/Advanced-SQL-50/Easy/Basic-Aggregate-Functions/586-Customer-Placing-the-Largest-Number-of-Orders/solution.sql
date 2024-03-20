-- Solution 1
SELECT customer_number
FROM orders
GROUP BY 1
ORDER BY COUNT(customer_number) DESC
LIMIT 1;

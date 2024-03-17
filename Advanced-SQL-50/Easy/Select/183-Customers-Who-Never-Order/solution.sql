-- PostgreSQL - Solution 1 - Left Join
SELECT name AS Customers
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

-- PostgreSQL - Solution 2 - Filtering Data with Exclusion Criteria
SELECT name AS Customers
FROM customers c
WHERE c.id NOT IN (
    SELECT customerId
    FROM orders
);
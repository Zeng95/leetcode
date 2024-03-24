-- PostgreSQL - Solution 1 - Left Join
SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

-- PostgreSQL - Solution 2 - Filtering Data with Exclusion Criteria
SELECT name AS Customers
FROM Customers c
WHERE c.id NOT IN (
    SELECT customerId
    FROM Orders
);

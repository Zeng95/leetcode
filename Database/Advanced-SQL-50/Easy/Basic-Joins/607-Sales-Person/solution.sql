-- Solution 1 - Joining Tables and Using Exclusion with "NOT IN"
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM orders o, company c
    WHERE o.com_id = c.com_id AND c.name = 'RED'
);

-- Solution 2 - Joining Tables(Inner Join) and Using Exclusion with "NOT IN"
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM orders o
    JOIN company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

-- Solution 3 - Subquery and Using Exclusion with "NOT IN"
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM orders
    WHERE com_id = (
        SELECT com_id
        FROM company
        WHERE name = 'RED'
    )
);

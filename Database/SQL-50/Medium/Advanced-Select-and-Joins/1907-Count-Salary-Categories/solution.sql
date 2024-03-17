-- PostgreSQL - Solution 1 - Union
SELECT
    'Low Salary' as category,
    SUM(CASE
        WHEN income < 20000 THEN 1
        ELSE 0
    END) AS accounts_count
FROM accounts
UNION
SELECT
    'Average Salary' as category,
    SUM(CASE
        WHEN income BETWEEN 20000 AND 50000 THEN 1
        ELSE 0
    END) AS accounts_count
FROM accounts
UNION
SELECT
    'High Salary' as category,
    SUM(CASE
        WHEN income > 50000 THEN 1
        ELSE 0
    END) AS accounts_count
FROM accounts
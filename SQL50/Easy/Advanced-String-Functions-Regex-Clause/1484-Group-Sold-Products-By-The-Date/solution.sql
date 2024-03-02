-- PostgreSQL - Solution 1
SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    string_agg(DISTINCT product, ',') AS products
FROM activities
GROUP BY 1
ORDER BY 1 ASC;

-- MySQL - Solution 1
SELECT
    sell_date,
    COUNT(DISTINCT product) as num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM activities
GROUP BY 1
ORDER BY 1 ASC;
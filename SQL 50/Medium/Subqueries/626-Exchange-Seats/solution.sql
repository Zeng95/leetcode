-- PostgreSQL - Solution 1 - Subquery
SELECT
    CASE
        WHEN id % 2 = 1 AND next IS NULL THEN id
        WHEN id % 2 = 1 AND next IS NOT NULL THEN next
        WHEN id % 2 = 0 AND prev IS NOT NULL THEN prev
    END AS "id",
    student
FROM (
    SELECT
        *,
        LEAD(id) OVER (ORDER BY id) AS next,
        LAG(id) OVER (ORDER BY id) AS prev
    FROM seat
)
ORDER BY 1;

-- PostgreSQL - Solution 2 - Common Table Expression (CTE)
WITH cte AS (
    SELECT
        *,
        LEAD(id) OVER (ORDER BY id) AS next,
        LAG(id) OVER (ORDER BY id) AS prev
    FROM seat
)
SELECT
    CASE
        WHEN id % 2 = 1 AND next IS NULL THEN id
        WHEN id % 2 = 1 AND next IS NOT NULL THEN next
        WHEN id % 2 = 0 AND prev IS NOT NULL THEN prev
    END AS "id",
    student
FROM cte
ORDER BY 1;
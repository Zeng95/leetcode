-- PostgreSQL - Solution 1 - Window Functions with Common Table Expression (CTE)
WITH cte AS (
    SELECT *, SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM queue
)
SELECT person_name
FROM cte
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
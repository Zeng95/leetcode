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

-- PostgreSQL - Solution 2
SELECT a.person_name
FROM queue a
JOIN queue b
ON a.turn >= b.turn
GROUP BY 1
HAVING SUM(b.weight) <= 1000
ORDER BY SUM(b.weight) DESC
LIMIT 1;
-- PostgreSQL - Solution 1 - UNION ALL
WITH cte AS (
    SELECT requester_id AS id
    FROM requestAccepted
    UNION
    SELECT accepter_id AS id
    FROM requestAccepted
)
SELECT id, COUNT(*) AS num
FROM cte
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
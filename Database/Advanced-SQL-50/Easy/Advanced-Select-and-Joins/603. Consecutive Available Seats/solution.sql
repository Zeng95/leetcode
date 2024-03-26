-- Solution 1
WITH cte AS (
    SELECT
        seat_id,
        free,
        LAG(free) OVER(ORDER BY seat_id) AS free_prev,
        LEAD(free) OVER(ORDER BY seat_id) AS free_next
    FROM Cinema
)
SELECT seat_id
FROM cte
WHERE (free != 0 AND free = free_prev) OR (free != 0 AND free = free_next);

-- Solution 2
SELECT DISTINCT a.seat_id
FROM Cinema a
JOIN Cinema b
ON ABS(a.seat_id - b.seat_id) = 1
WHERE a.free = 1 AND b.free = 1
ORDER BY 1;

-- Solution 1
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1, Point p2
WHERE p1.x != p2.x;

-- Solution 2
WITH cte AS (
    SELECT
        x,
        LAG(x) OVER (ORDER BY x) AS previous_x
    FROM Point
)
SELECT MIN(ABS(x - previous_x)) AS shortest
FROM cte;

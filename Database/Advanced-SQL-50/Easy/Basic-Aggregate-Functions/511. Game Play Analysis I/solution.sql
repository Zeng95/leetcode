-- Solution 1
SELECT
    DISTINCT player_id,
    MIN(event_date) OVER(PARTITION BY player_id) AS first_login
FROM activity
ORDER BY 1 ASC;

-- Solution 2
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM activity
GROUP BY 1
ORDER BY 1;

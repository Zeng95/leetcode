-- PostgreSQL - Solution 1
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS "first_login"
    FROM activity
    GROUP BY 1
)
SELECT
    ROUND(
        (COUNT(CASE WHEN b.event_date - a.first_login = 1 THEN 1 END) * 0.1 / COUNT(*) * 10),
        2
    ) AS fraction
FROM first_logins a
LEFT JOIN activity b
ON b.event_date - a.first_login = 1 AND b.player_id = a.player_id;
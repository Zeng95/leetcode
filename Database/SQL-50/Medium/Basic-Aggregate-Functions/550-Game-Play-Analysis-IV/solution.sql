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

-- PostgreSQL - Solution 2
SELECT
    ROUND(
        COUNT(a.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM activity),
        2
    ) AS fraction
FROM  activity a
WHERE (a.player_id, a.event_date - interval '1 day') IN (
    SELECT player_id, MIN(event_date)
    FROM activity
    GROUP BY 1
);

-- PostgreSQL - Solution 3
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS "first_login"
    FROM activity
    GROUP BY 1
), consec_logins AS (
    SELECT COUNT(a.player_id) AS num_logins
    FROM first_logins f
    INNER JOIN activity a
    ON f.player_id = a.player_id AND f.first_login = a.event_date - INTERVAL '1 DAY'
)
SELECT
    ROUND(
        (SELECT c.num_logins FROM consec_logins c) * 1.0 / (SELECT COUNT(f.player_id) FROM first_logins f),
        2
    ) AS fraction;
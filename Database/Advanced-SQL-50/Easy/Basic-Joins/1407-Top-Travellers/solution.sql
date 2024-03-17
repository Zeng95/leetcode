WITH cte AS (
    SELECT u.id, u.name,
        CASE
            WHEN SUM(distance) IS NULL then 0
            ELSE SUM(distance)
        END AS travelled_distance
    FROM users u
    LEFT JOIN rides r
    ON u.id = r.user_id
    GROUP BY 1, 2
)
SELECT name, travelled_distance
FROM cte
ORDER BY 2 DESC, 1 ASC;

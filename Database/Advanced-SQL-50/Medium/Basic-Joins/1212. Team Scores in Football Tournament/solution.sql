-- Solution 1
WITH cte AS (
    SELECT
        host_team AS team_id,
        SUM(CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END) AS points
    FROM matches
    GROUP BY 1
    UNION ALL
    SELECT
        guest_team AS team_id,
        SUM(CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END) AS points
    FROM matches
    GROUP BY 1
)
SELECT a.team_id, a.team_name,
    SUM(CASE
        WHEN points IS NULL then 0
        ELSE points
    END) AS num_points
FROM teams a
LEFT JOIN cte b
ON a.team_id = b.team_id
GROUP BY 1, 2
ORDER BY 3 DESC, 1 ASC;

-- Solution 2
WITH cte AS (
    SELECT team_id, team_name,
        SUM(CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END) AS points
    FROM teams
    LEFT JOIN matches
    ON teams.team_id = matches.host_team
    GROUP BY 1, 2
    UNION ALL
    SELECT team_id, team_name,
        SUM(CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END) AS points
    FROM teams
    LEFT JOIN matches
    ON teams.team_id = matches.guest_team
    GROUP BY 1, 2
)
SELECT team_id, team_name, SUM(points) AS num_points
FROM cte
GROUP BY 1, 2
ORDER BY 3 DESC, 1 ASC;

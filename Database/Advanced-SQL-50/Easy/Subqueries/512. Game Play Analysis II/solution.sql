-- Solution 1
WITH cte AS (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY 1
)
SELECT Activity.player_id, Activity.device_id
FROM cte, Activity
WHERE cte.event_date = Activity.event_date AND cte.player_id = Activity.player_id;

-- Solution 2
SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY 1
);

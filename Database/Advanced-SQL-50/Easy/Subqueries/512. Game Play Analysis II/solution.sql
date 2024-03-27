-- Solution 1
WITH cte AS (
    SELECT player_id, MIN(event_date) AS first_logged_in_date
    FROM Activity
    GROUP BY 1
)
SELECT Activity.player_id, Activity.device_id
FROM cte, Activity
WHERE cte.first_logged_in_date = Activity.event_date AND cte.player_id = Activity.player_id;

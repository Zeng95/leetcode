-- Solution 1
SELECT a.player_id, a.event_date, SUM(b.games_played) AS games_played_so_far
FROM Activity a, Activity b
WHERE a.player_id = b.player_id AND a.event_date >= b.event_date
GROUP BY 1, 2
ORDER BY 1, 2;

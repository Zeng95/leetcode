-- Solution 1
SELECT
    p.player_id,
    p.player_name,
    (SUM(CASE WHEN p.player_id = c.Wimbledon THEN 1 ELSE 0 END) +
    SUM(CASE WHEN p.player_id = c.Fr_open THEN 1 ELSE 0 END) +
    SUM(CASE WHEN p.player_id = c.US_open THEN 1 ELSE 0 END) +
    SUM(CASE WHEN p.player_id = c.Au_open THEN 1 ELSE 0 END)) AS grand_slams_count
FROM Players p
JOIN Championships c
ON p.player_id IN (c.Wimbledon, c.Fr_open, c.US_open, c.Au_open)
GROUP BY 1, 2;

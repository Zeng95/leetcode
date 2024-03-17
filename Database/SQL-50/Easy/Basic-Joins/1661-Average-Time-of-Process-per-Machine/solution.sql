-- PostgreSQL - Solution 1
SELECT machine_id, ROUND(CAST((SUM(end_timestamp)-SUM(start_timestamp))/COUNT(process_id) AS numeric), 3) AS processing_time
FROM (
    SELECT machine_id, process_id,
    MAX(CASE
        WHEN activity_type = 'start' THEN timestamp
        ELSE 0
    END) AS start_timestamp,
    MAX(CASE
        WHEN activity_type = 'end' THEN timestamp
        ELSE 0
    END) AS end_timestamp
    FROM activity
    GROUP BY 1, 2
    ORDER BY 1, 2
)
GROUP BY 1
ORDER BY 2 ASC;
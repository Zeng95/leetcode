-- PostgreSQL - Solution 1
SELECT user_id,
    CASE
        WHEN num_confirmed = 0 THEN 0
        ELSE ROUND(num_confirmed * 1.0 / num_messages, 2)
    END AS confirmation_rate
FROM (
    SELECT s.user_id,
        COUNT(CASE
            WHEN c.action = 'confirmed' THEN c.action
        END) AS num_confirmed,
        COUNT(c.action) AS num_messages
    FROM signups s
    LEFT JOIN confirmations c ON s.user_id = c.user_id
    GROUP BY 1
);
-- PostgreSQL: Solution 1 - Left Join
SELECT contest_id, ROUND(COUNT(user_id)*100.0/num_users, 2) AS percentage
FROM (
    SELECT COUNT(DISTINCT u.user_id) AS num_users
    FROM users u
    LEFT JOIN register r
    ON u.user_id = r.user_id
)
CROSS JOIN register
GROUP BY 1, num_users
ORDER BY 2 DESC, 1 ASC;
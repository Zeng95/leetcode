-- PostgreSQL - Solution 1
WITH cte AS (
    SELECT
        *,
        SUBSTRING(mail, 0, POSITION('@leetcode.com' in mail)) AS prefix_name
    FROM users
    WHERE mail ~ '^[a-zA-Z]' AND mail LIKE '%@leetcode.com'
)
SELECT user_id, name, mail
FROM cte
WHERE prefix_name ~ '^[a-zA-Z0-9_.-]+$';
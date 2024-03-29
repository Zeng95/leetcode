-- Solution 1
WITH cte AS (
    SELECT
        CASE
            WHEN user1_id = 1 THEN user2_id
            WHEN user2_id = 1 THEN user1_id
        END AS friends
    FROM Friendship
)
SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE user_id IN (
    SELECT friends
    FROM cte
    WHERE friends IS NOT NULL
)
AND page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
)
ORDER BY 1 ASC;

-- Solution 2
WITH cte AS (
    SELECT user1_id, user2_id
    FROM Friendship F1
    WHERE user1_id = 1
    UNION ALL
    SELECT user2_id, user1_id
    FROM Friendship F2
    WHERE user2_id = 1
)
SELECT DISTINCT page_id AS recommended_page
FROM cte
JOIN Likes
ON cte.user2_id = Likes.user_id
WHERE page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
)
ORDER BY 1 ASC;

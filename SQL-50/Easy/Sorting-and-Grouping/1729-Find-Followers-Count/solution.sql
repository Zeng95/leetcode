-- PostgreSQL - Solution 1
SELECT user_id, COUNT(follower_id) AS followers_count
FROM followers
GROUP BY 1
ORDER BY 1 ASC;

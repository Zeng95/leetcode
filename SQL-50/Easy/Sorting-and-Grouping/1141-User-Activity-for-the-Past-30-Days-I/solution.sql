-- PostgreSQL - Solution 1
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date <= '2019-07-27' AND '2019-07-27' - activity_date < 30
GROUP BY 1;

-- MySQL - Solution 1
SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM activity
WHERE activity_date <= '2019-07-27' AND DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY 1;

-- MySQL - Solution 2
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE DATEDIFF('2019-07-27', activity_date) >= 0 AND DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY 1;

-- MySQL - Solution 3
SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM activity
WHERE DATEDIFF('2019-07-27', activity_date) BETWEEN 0 AND 29
GROUP BY 1;

-- MySQL - Solution 4
SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM activity
WHERE activity_date BETWEEN date_sub('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY 1;
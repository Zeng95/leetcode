-- Solution 1
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE time_stamp BETWEEN '2020-01-01 00:00:00' AND '2020-12-31 23:59:59'
GROUP BY 1;

-- Solution 2 (MySQL)
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE YEAR(time_stamp) = 2020
GROUP BY 1;

-- Solution 3
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE EXTRACT(YEAR FROM time_stamp) = 2020;
GROUP BY 1;

-- Solution 4
SELECT
    DISTINCT user_id,
    FIRST_VALUE(time_stamp) OVER (PARTITION BY user_id ORDER BY time_stamp DESC) AS last_stamp
FROM Logins
WHERE EXTRACT(YEAR FROM time_stamp) = 2020;

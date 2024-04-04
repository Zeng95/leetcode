-- Solution 1 - MySQL
WITH cte AS (
    SELECT
        user_id,
        visit_date,
        CASE
            WHEN LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) IS NULL THEN '2021-1-1'
            ELSE LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date)
        END AS next_visit_date
    FROM UserVisits
    GROUP BY 1, 2
)
SELECT user_id, MAX(DATEDIFF(next_visit_date, visit_date)) AS biggest_window
FROM cte
GROUP BY 1;

-- Solution 2 - MySQL
WITH cte AS (
    SELECT
        *,
        IFNULL(LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date), '2021-01-01') AS next_visit_date
    FROM UserVisits
)
SELECT user_id, MAX(DATEDIFF(next_visit_date, visit_date)) AS biggest_window
FROM cte
GROUP BY 1;

-- Solution 3 - PostgreSQL
WITH cte AS (
    SELECT
        user_id,
        visit_date,
        CASE
            WHEN LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) IS NULL THEN '2021-1-1'
            ELSE LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date)
        END AS next_visit_date
    FROM UserVisits
    GROUP BY 1, 2
)
SELECT user_id, MAX(next_visit_date - visit_date) AS biggest_window
FROM cte
GROUP BY 1;

-- Solution 1
WITH cte AS (
    SELECT
        success_date AS dates,
        'succeeded' AS status
    FROM succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
    UNION
    SELECT
        fail_date AS dates,
        'failed' AS status
    FROM failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
),
cte2 AS (
    SELECT dates, status,
    ROW_NUMBER() OVER (ORDER BY dates) AS a,
    DENSE_RANK() OVER (PARTITION BY status ORDER BY dates) AS b,
    ROW_NUMBER() OVER (ORDER BY dates) - DENSE_RANK() OVER (PARTITION BY status ORDER BY dates) AS grp
    FROM cte
)
SELECT
    status AS period_state,
    MIN(dates) AS start_date,
    MAX(dates) AS end_date
FROM cte2
GROUP BY grp, status
ORDER BY 2;

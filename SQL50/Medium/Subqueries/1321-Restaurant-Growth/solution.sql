-- PostgreSQL - Solution 1
WITH cte AS (
    SELECT visited_on, SUM(amount) AS daily_revenue
    FROM customer
    GROUP BY 1
),
ct2 AS (
    SELECT
        visited_on,
        SUM(daily_revenue) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(daily_revenue) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM cte
)
SELECT *
FROM ct2
WHERE visited_on >= (SELECT visited_on FROM customer ORDER BY visited_on LIMIT 1) + 6;
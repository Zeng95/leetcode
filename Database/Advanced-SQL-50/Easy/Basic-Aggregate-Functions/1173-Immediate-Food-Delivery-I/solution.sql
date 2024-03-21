-- Solution 1
WITH cte AS (
    SELECT
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
        END AS delivery_type,
        COUNT(*) OVER () AS total_deliveries
    FROM delivery
),
cte2 AS (
    SELECT
        *,
        COUNT(*) OVER (PARTITION BY delivery_type) AS num_deliveries
    FROM cte
)
SELECT
    CASE
        WHEN num_deliveries = total_deliveries AND delivery_type = 'scheduled' THEN 0
        WHEN num_deliveries = total_deliveries AND delivery_type = 'immediate' THEN 100
        ELSE ROUND(num_deliveries * 1.0 / total_deliveries * 100, 2)
    END AS immediate_percentage
FROM cte2
LIMIT 1;

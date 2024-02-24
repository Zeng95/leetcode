-- PostgreSQL - Solution 1
WITH first_orders AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM delivery
    GROUP BY 1
)
SELECT
    ROUND(
        (COUNT(CASE WHEN d.customer_pref_delivery_date = d.order_date THEN 1 END) * 1.0 / COUNT(*) * 100),
        2
    ) AS immediate_percentage
FROM first_orders fo
JOIN delivery d
    ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order_date;
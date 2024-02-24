WITH previous_results AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM delivery
    GROUP BY 1
)
SELECT
    ROUND((COUNT(CASE WHEN d.customer_pref_delivery_date = d.order_date THEN 'immediate' END) * 1.0 / COUNT(*) * 100), 2) AS immediate_percentage
FROM previous_results pr
JOIN delivery d
    ON d.customer_id = pr.customer_id AND d.order_date = pr.first_order_date;
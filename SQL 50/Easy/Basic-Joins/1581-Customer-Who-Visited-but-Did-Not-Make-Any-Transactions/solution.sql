-- Solution 1: Using LEFT JOIN
SELECT customer_id, COUNT(*) AS "count_no_trans"
FROM visits v
LEFT JOIN transactions t
ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY 1
ORDER BY 2 DESC;
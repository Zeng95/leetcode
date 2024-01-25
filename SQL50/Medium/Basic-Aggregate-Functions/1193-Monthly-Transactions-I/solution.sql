-- PostgreSQL - Solution 1: Using EXTRACT() function
SELECT
    CASE
        WHEN EXTRACT(Month FROM trans_date) < 10 THEN EXTRACT(YEAR FROM trans_date) || '-0' || EXTRACT(Month FROM trans_date)
        ELSE EXTRACT(YEAR FROM trans_date) || '-' || EXTRACT(Month FROM trans_date)
    END AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN state END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY 1, 2;
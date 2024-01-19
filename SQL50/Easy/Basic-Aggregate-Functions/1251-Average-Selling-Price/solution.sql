-- Solution 1 for PostgreSQL
SELECT a.product_id,
    CASE
        WHEN ROUND(SUM(a.price * b.units)/SUM(b.units)::numeric, 2) IS NULL THEN 0
        ELSE ROUND(SUM(a.price * b.units)/SUM(b.units)::numeric, 2)
    END AS "average_price"
FROM Prices a
LEFT JOIN UnitsSold b
ON a.product_id = b.product_id AND (b.purchase_date BETWEEN a.start_date AND a.end_date)
GROUP BY 1
ORDER BY 1 ASC;
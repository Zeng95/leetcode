-- PostgreSQL - Solution 1
SELECT product_id, first_year, quantity, price
FROM (
    SELECT *, MIN(year) OVER (PARTITION BY product_id) AS first_year
    FROM sales
)
WHERE year = first_year;
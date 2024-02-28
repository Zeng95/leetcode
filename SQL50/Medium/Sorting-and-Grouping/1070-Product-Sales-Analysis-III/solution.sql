-- PostgreSQL - Solution 1
SELECT product_id, first_year, quantity, price
FROM (
    SELECT *, MIN(year) OVER (PARTITION BY product_id) AS first_year
    FROM sales
)
WHERE year = first_year;

-- PostgreSQL - Solution 2
SELECT product_id, year AS first_year, quantity, price
FROM sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM sales
    GROUP BY 1
)
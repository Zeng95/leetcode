-- Solution 1
SELECT
    DISTINCT sale_date,
    FIRST_VALUE(sold_num) OVER (PARTITION BY sale_date) - LAST_VALUE(sold_num) OVER (PARTITION BY sale_date) AS diff
FROM sales
ORDER BY 1 ASC;

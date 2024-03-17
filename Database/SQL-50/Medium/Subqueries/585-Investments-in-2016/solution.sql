WITH cte AS (
    SELECT DISTINCT i1.*
    FROM insurance i1, insurance i2
    WHERE i1.tiv_2015 = i2.tiv_2015 AND i1.pid <> i2.pid AND CONCAT(i1.lat, ',', i1.lon) NOT IN (
        SELECT CONCAT(lat, ',', lon) AS location
        FROM insurance
        GROUP BY 1
        HAVING COUNT(*) > 1
    )
)
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM cte;
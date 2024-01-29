-- PostgreSQL - Solution 1
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM mynumbers
    GROUP BY 1
    HAVING COUNT(*) = 1
);
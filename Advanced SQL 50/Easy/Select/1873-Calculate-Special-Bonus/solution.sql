-- PostgreSQL - Solution 1 - Case along with LEFT()
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND LEFT(name, 1) != 'M' THEN salary
        ELSE 0
    END AS bonus
FROM employees
ORDER BY 1 ASC;
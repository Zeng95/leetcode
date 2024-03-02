-- PostgreSQL - Solution 1 - Inner Join
SELECT
    e1.employee_id,
    e1.name,
    COUNT(e2.employee_id) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM employees e1
JOIN employees e2
ON e1.employee_id = e2.reports_to
GROUP BY 1, 2
ORDER BY 1 ASC;
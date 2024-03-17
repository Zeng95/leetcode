-- PostgreSQL - Solution 1 - Inner Join
SELECT project_id, ROUND(SUM(experience_years)*1.0/COUNT(experience_years), 2) AS average_years
FROM project p
JOIN employee e
ON p.employee_id = e.employee_id
GROUP BY 1
ORDER BY 1, 2 ASC;
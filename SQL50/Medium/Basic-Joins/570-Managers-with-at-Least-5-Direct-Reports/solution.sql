-- PostgreSQL - solution 1
SELECT name
FROM employee
WHERE id IN
(SELECT managerID FROM employee GROUP BY 1 HAVING COUNT(*) >= 5);
-- PostgreSQL - Solution 1 - Ranking Window Functions
WITH cte AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) rnk
    FROM employee e
    JOIN department d
    ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM cte
WHERE rnk <= 3;
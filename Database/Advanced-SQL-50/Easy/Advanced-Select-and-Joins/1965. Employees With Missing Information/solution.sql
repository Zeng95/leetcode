-- Solution 1
WITH cte AS (
    SELECT e.employee_id
    FROM Employees e
    LEFT JOIN Salaries s
    ON e.employee_id = s.employee_id
    WHERE s.employee_id IS NULL
    UNION
    SELECT s.employee_id
    FROM Salaries s
    LEFT JOIN Employees e
    ON e.employee_id = s.employee_id
    WHERE e.employee_id IS NULL
)
SELECT *
FROM cte
ORDER BY employee_id ASC;

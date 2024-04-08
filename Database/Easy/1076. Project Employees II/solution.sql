-- Solution 1
WITH cte AS (
    SELECT project_id, COUNT(employee_id) AS num_employees
    FROM Project
    GROUP BY 1
)
SELECT project_id
FROM cte
WHERE num_employees = (
    SELECT MAX(num_employees)
    FROM cte
);

-- Solution 1
WITH cte AS (
    SELECT
        p.project_id,
        p.employee_id,
        e.name,
        e.experience_years,
        MAX(experience_years) OVER (PARTITION BY project_id) AS max_years
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
)
SELECT project_id, employee_id
FROM cte
WHERE experience_years = max_years;

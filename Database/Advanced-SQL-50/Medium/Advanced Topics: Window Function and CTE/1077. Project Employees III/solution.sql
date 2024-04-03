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

-- Solution 2
WITH project_and_employee AS (
    SELECT p.project_id, e.employee_id, e.experience_years
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
)
SELECT a.project_id, a.employee_id
FROM project_and_employee a
JOIN (
    SELECT project_id, MAX(experience_years) AS max_years
    FROM project_and_employee
    GROUP BY 1
) b
ON a.experience_years = b.max_years
AND a.project_id = b.project_id

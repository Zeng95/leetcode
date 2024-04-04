WITH RECURSIVE EmployeeHierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        1 AS level
    FROM Employees
    WHERE manager_id = 1 AND employee_id != 1
    UNION ALL
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        eh.level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.employee_id
)
SELECT employee_id
FROM EmployeeHierarchy;

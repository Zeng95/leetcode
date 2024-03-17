-- PostgreSQL - Solution 1
SELECT employee_id
FROM employees
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM employees)
ORDER BY 1;

-- PostgreSQL - Solution 2
WITH etc AS (
    SELECT employee_id, manager_id
    FROM employees
    WHERE salary < 30000
)
SELECT employee_id
FROM etc
WHERE manager_id NOT IN (SELECT employee_id FROM employees)
ORDER BY 1;
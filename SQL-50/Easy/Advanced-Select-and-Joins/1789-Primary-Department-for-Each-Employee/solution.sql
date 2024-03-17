-- PostgreSQL - Solution 1 - Window Functions
SELECT employee_id, department_id
FROM (
    SELECT *, COUNT(*) OVER (PARTITION BY employee_id) AS total_employees
    FROM employee
)
WHERE total_employees = 1 OR primary_flag = 'Y';

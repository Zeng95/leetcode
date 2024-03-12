-- PostgreSQL - Solution 1 - Case with LEFT()
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND LEFT(name, 1) != 'M' THEN salary
        ELSE 0
    END AS bonus
FROM employees
ORDER BY 1 ASC;

-- PostgreSQL - Solution 2 - Case with NOT LIKE
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM employees
ORDER BY 1 ASC;

-- MySQL - Solution 1 - If Statement with NOT LIKE
SELECT
    employee_id,
    IF(employee_id % 2 = 1 AND name NOT LIKE 'M%', salary, 0) AS bonus
FROM employees
ORDER BY 1 ASC;

-- MySQL - Solution 2 - If Statement with REGEXP
SELECT
    employee_id,
    IF(employee_id % 2 = 1 AND name NOT REGEXP '^M', salary, 0) AS bonus
FROM employees
ORDER BY 1 ASC;

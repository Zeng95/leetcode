-- Solution 1
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentid, MAX(salary)
    FROM Employee
    GROUP BY 1
);

-- Solution 2
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e, Department d
WHERE e.departmentId = d.id AND (e.departmentId, e.salary) IN (
    SELECT departmentid, MAX(salary)
    FROM Employee
    GROUP BY 1
);

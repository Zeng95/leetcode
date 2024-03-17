-- PostgreSQL - Solution 1
SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary NOT IN (SELECT MAX(salary) AS HighestSalary FROM employee)
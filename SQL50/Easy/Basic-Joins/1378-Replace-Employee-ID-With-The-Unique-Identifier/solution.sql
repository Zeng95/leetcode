-- Left Join
SELECT unique_id, name
FROM employees
LEFT JOIN employeeUNI
ON employees.id = EmployeeUNI.id;

-- Right Join
SELECT unique_id, name
FROM EmployeeUNI
RIGHT JOIN Employees
ON EmployeeUNI.id = Employees.id;
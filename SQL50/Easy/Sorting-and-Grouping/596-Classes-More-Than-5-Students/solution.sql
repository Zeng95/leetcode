-- PostgreSQL - Solution 1
SELECT class
FROM courses
GROUP BY 1
HAVING COUNT(student) >= 5;
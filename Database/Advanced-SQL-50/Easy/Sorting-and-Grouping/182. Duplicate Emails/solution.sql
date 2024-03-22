-- Solution 1
SELECT email
FROM person
GROUP BY 1
HAVING COUNT(email) > 1;

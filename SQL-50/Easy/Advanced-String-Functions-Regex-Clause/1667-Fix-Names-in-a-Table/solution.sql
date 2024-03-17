-- PostgreSQL - Solution 1
Select user_id, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM users
ORDER BY 1;
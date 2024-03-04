-- PostgreSQL - Solution 1
DELETE FROM person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM person
    GROUP BY email
);

-- MySQL - Solution 1
DELETE p1
FROM person p1, person p2
WHERE p1.email = p2.email AND p1.id > p2.id;

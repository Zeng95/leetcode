-- PostgreSQL - Solution 1
SELECT firstname, lastname, city, state
FROM person p
LEFT JOIN address a
ON p.personId = a.personId;

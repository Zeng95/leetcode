-- PostgreSQL - Solution 1
SELECT *
FROM patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';
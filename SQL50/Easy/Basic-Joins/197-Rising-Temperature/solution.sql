-- PostgreSQL
SELECT today.id
FROM weather AS "yesterday", weather AS "today"
WHERE today.recordDate - yesterday.recordDate = 1 AND today.temperature > yesterday.temperature;
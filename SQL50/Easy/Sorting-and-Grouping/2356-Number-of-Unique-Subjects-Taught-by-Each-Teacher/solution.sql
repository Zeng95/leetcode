-- PostgreSQL: Solution - Count and Distinct
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY 1
ORDER BY 1 ASC;
-- PostgreSQL
SELECT s.student_id, s.student_name, u.subject_name, COUNT(e.subject_name) AS attended_exams
FROM students s
CROSS JOIN subjects u
LEFT JOIN examinations e
ON e.student_id = s.student_id AND e.subject_name = u.subject_name
GROUP BY 1, 2, 3
ORDER BY 1, 3 ASC;
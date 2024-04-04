-- Solution 1
SELECT DISTINCT Student.student_id, Student.student_name
FROM Exam
JOIN Student
ON Exam.student_id = Student.student_id
WHERE Exam.student_id NOT IN (
    SELECT student_id
    FROM Exam
    WHERE (exam_id, score) IN (
        SELECT exam_id, MIN(score) AS score
        FROM Exam
        GROUP BY 1
        UNION
        SELECT exam_id, MAX(score) AS score
        FROM Exam
        GROUP BY 1
        ORDER BY 1
    )
    GROUP BY 1
)
ORDER BY 1;

-- Solution 2
SELECT Student.student_id, Student.student_name
FROM Exam
JOIN Student
ON Exam.student_id = Student.student_id
GROUP BY 1, 2
HAVING SUM(
    CASE
        WHEN (exam_id, score) IN (
            SELECT exam_id, MIN(score) AS score
            FROM Exam
            GROUP BY 1
            UNION
            SELECT exam_id, MAX(score) AS score
            FROM Exam
            GROUP BY 1
            ORDER BY 1
        ) THEN 1
        ELSE 0
    END
) = 0
ORDER BY 1;

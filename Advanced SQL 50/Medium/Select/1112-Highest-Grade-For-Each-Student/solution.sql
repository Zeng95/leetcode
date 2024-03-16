-- PostgreSQL - Solution 1 - Window Functions
WITH cte AS (
    SELECT
        *,
        MAX(grade) OVER (PARTITION BY student_id) AS highest_grade
    FROM enrollments
),
cte2 AS (
    SELECT
        *,
        MIN(course_id) OVER (PARTITION BY student_id) AS smallest_course_id
    FROM cte
    WHERE grade = highest_grade
)
SELECT student_id, course_id, grade
FROM cte2
WHERE course_id = smallest_course_id;

-- Solution 1
WITH RECURSIVE cte AS (
    SELECT
        task_id,
        subtasks_count,
        1 AS subtask_id
    FROM Tasks
    UNION ALL
    SELECT
        task_id,
        subtasks_count,
        subtask_id + 1
    FROM cte
    WHERE subtask_id < subtasks_count
)
SELECT task_id, subtask_id
FROM cte
WHERE (task_id, subtask_id) NOT IN (
    SELECT *
    FROM Executed
);

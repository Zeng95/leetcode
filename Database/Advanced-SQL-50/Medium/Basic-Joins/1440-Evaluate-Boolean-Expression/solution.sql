-- Solution 1 -  Joining Tables and Using Case
SELECT
    left_operand,
    operator,
    right_operand,
    CASE
        WHEN operator = '>' AND v2.value > v1.value THEN 'true'
        WHEN operator = '<' AND v1.value < v2.value THEN 'true'
        WHEN operator = '=' AND v1.value = v2.value THEN 'true'
        ELSE 'false'
    END AS value
FROM expressions e
JOIN variables v1
ON e.left_operand = v1.name
JOIN variables v2
ON e.right_operand = v2.name;

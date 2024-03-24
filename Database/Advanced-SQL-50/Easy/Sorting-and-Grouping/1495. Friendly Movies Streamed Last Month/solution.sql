-- Solution 1
SELECT DISTINCT Content.title
FROM TVProgram
JOIN Content
ON TVProgram.content_id = Content.content_id
WHERE
    (Content.Kids_content = 'Y') AND
    (Content.content_type = 'Movies') AND
    (TVProgram.program_date BETWEEN '2020-06-01 00:00' AND '2020-06-30 23:59');

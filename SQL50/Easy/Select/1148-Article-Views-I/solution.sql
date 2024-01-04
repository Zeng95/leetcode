/** Solution 1 **/
SELECT DISTINCT author_id AS "id"
FROM views
WHERE author_id = viewer_id;

/** Solution 2 - Faster **/
SELECT author_id AS "id"
FROM views
WHERE author_id = viewer_id
GROUP BY 1
ORDER BY 1 ASC;
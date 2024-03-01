-- PostgreSQL - Solution 1 - UNION ALL (allows duplicate values)
(
    SELECT name AS results
    FROM movieRating mr
    JOIN users u
    ON mr.user_id = u.user_id
    GROUP BY 1
    ORDER BY COUNT(*) DESC, name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT title AS results
    FROM movieRating mr
    JOIN movies m
    ON mr.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY 1
    ORDER BY AVG(rating) DESC, title ASC
    LIMIT 1
)

-- PostgreSQL - Solution 2 - UNION ALL (allows duplicate values) With Common Table Expression (CTE)
WITH cte AS (
    SELECT
        u.name AS user_name,
        m.title AS movie_title,
        mr.*
    FROM movieRating mr
    JOIN users u
    ON mr.user_id = u.user_id
    JOIN movies m
    ON mr.movie_id = m.movie_id
)
(
    SELECT user_name AS results
    FROM cte
    ORDER BY (COUNT(*) OVER (PARTITION BY user_id)) DESC, user_name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT movie_title AS result
    FROM cte
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    ORDER BY (AVG(rating) OVER (PARTITION BY movie_title)) DESC, movie_title ASC
    LIMIT 1
)
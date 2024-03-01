-- PostgreSQL - Solution 1 - UNION ALL (allows duplicate values)
(
    SELECT user_name AS results
    FROM (
        SELECT
            name AS user_name,
            COUNT(*) OVER (PARTITION BY mr.user_id) AS user_total_rates
        FROM movieRating mr
        JOIN users u
        ON mr.user_id = u.user_id
    )
    ORDER BY user_total_rates DESC, user_name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT movie_title AS results
    FROM (
        SELECT
            title AS movie_title,
            AVG(rating) AS avg_rating
        FROM movieRating mr
        JOIN movies m
        ON mr.movie_id = m.movie_id
        WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
        GROUP BY 1
    )
    ORDER BY avg_rating DESC, movie_title ASC
    LIMIT 1
)

-- PostgreSQL - Solution 2 - UNION ALL (allows duplicate values) With Common Table Expression (CTE)
WITH cte AS (
    SELECT
        COUNT(*) OVER (PARTITION BY mr.user_id) AS user_total_rates,
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
    ORDER BY user_total_rates DESC, user_name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT movie_title AS result
    FROM cte
    WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
    ORDER BY (AVG(rating) OVER (PARTITION BY movie_title)) DESC, movie_title ASC
    LIMIT 1
)
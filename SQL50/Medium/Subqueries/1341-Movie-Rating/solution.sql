-- PostgreSQL - Solution 1 - UNION
(
    SELECT name AS results
    FROM (
        SELECT
            DISTINCT u.name,
            mr.user_id,
            COUNT(*) OVER (PARTITION BY mr.user_id) AS total_rates
        FROM movieRating mr
        JOIN users u
        ON mr.user_id = u.user_id
    )
    ORDER BY total_rates DESC, name
    LIMIT 1
)
UNION
(
    SELECT title AS results
    FROM (
        SELECT
            mr.movie_id,
            title,
            AVG(rating) AS avg_rating
        FROM movieRating mr
        JOIN movies m
        ON mr.movie_id = m.movie_id
        WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
        GROUP BY 1, 2
    ) AS movie_avg_ratings
    ORDER BY avg_rating DESC, 1
    LIMIT 1
)
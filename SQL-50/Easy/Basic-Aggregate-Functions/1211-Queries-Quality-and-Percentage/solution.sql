-- PostgreSQL - Solution 1: Grouping and Aggregation
SELECT query_name,
    ROUND(AVG(rating*1.0/position), 2) AS quality,
    ROUND(COUNT(CASE WHEN rating < 3 THEN rating END)*1.0/COUNT(*)*100, 2) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY 1
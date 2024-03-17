-- PostgreSQL - Solution 1 - Value Window Functions
SELECT DISTINCT consecutive_nums AS ConsecutiveNums
FROM (
    SELECT
        *,
        CASE
            WHEN num = next AND num = prev THEN num
        END AS "consecutive_nums"
    FROM (
        SELECT
            *,
            LEAD(num) OVER (ORDER BY id) AS next,
            LAG(num) OVER (ORDER BY id) AS prev
        FROM logs
    )
)
WHERE consecutive_nums IS NOT NULL;

-- PostgreSQL - Solution 2 - Self Join
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1,logs l2,logs l3
WHERE l1.id = l2.id + 1 AND l2.id = l3.id + 1 AND l1.num = l2.num AND l2.num = l3.num;

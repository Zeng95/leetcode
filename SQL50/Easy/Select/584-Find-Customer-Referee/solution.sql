-- Solution 1
SELECT name
FROM customer
WHERE referee_id != 2 OR referee_id IS NULL;

-- Solution 2
SELECT name
FROM customer
WHERE referee_id <> 2 OR referee_id = NULL;

-- Solution 3
SELECT name
FROM customer
WHERE COALESCE(referee_id, 0) <> 2;
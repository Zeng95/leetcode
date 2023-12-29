SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;
SELECT name FROM customer WHERE COALESCE(referee_id, 0) <> 2;
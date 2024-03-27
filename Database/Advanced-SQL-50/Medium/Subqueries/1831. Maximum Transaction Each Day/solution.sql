-- Solution 1
SELECT transaction_id
FROM (
    SELECT *, MAX(amount) OVER (PARTITION BY day) AS max_amount
    FROM Transactions
) AS table1
WHERE amount = max_amount
ORDER BY 1 ASC;

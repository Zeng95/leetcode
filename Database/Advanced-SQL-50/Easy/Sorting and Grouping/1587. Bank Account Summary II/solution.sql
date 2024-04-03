-- Solution 1
SELECT u.name, SUM(t.amount) AS balance
FROM transactions t
JOIN users u
ON t.account = u.account
GROUP BY 1
HAVING SUM(amount) > 10000;

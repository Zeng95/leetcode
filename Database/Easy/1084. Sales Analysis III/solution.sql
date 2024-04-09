-- Solution 1
SELECT p.product_id, p.product_name
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
GROUP BY 1, 2
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31';

-- Solution 2
SELECT DISTINCT p.product_id, p.product_name
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
WHERE (s.sale_date BETWEEN '2019-01-01' AND '2019-03-31') AND p.product_id NOT IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
);

SELECT product_name, year, price
FROM sales a
JOIN product b
ON a.product_id = b.product_id
ORDER BY year DESC;
# database

## Get Aggregated Sum by Using GROUP BY and SUM()

### Algorithm

To get the total quantity sold for every product id, we need the two columns `quantity` and `product_id`. Since both are stored in the table `Sales`, we only need to use this one table and calculate the aggregated sum of `quantity` for each `product_id`. To get the final output, we also need to rename the column name to `total_quantity`.

#### Implementation

```sql
SELECT product_id,
       SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;
```

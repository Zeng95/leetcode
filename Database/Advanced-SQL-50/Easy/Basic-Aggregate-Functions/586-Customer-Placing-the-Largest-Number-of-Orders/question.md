Table: `Orders`

| Column Name     | Type |
| :-------------- | :--- |
| order_number    | int  |
| customer_number | int  |

<pre>
order_number is the primary key (column with unique values) for this table.
This table contains information about the order ID and the customer ID.
</pre>

Write a solution to find the `customer_number` for the customer who has placed **the largest number of orders**.

The test cases are generated so that **exactly one customer** will have placed more orders than any other customer.

The result format is in the following example.

### Example 1:

**Input:**

Warehouse table:

| name     | product_id | units |
| :------- | :--------- | :---- |
| LCHouse1 | 1          | 1     |
| LCHouse1 | 2          | 10    |
| LCHouse1 | 3          | 5     |
| LCHouse2 | 1          | 2     |
| LCHouse2 | 2          | 2     |
| LCHouse3 | 4          | 1     |

Products table:

| product_id | product_name | Width | Length | Height |
| :--------- | :----------- | :---- | :----- | :----- |
| 1          | LC-TV        | 5     | 50     | 40     |
| 2          | LC-KeyChain  | 5     | 5      | 5      |
| 3          | LC-Phone     | 2     | 10     | 10     |
| 4          | LC-T-Shirt   | 4     | 10     | 20     |

**Output:**

| warehouse_name | volume |
| :------------- | :----- |
| LCHouse1       | 12250  |
| LCHouse2       | 20250  |
| LCHouse3       | 800    |

**Explanation:**

<pre>
Volume of product_id = 1 (LC-TV), 5x50x40 = 10000
Volume of product_id = 2 (LC-KeyChain), 5x5x5 = 125
Volume of product_id = 3 (LC-Phone), 2x10x10 = 200
Volume of product_id = 4 (LC-T-Shirt), 4x10x20 = 800
LCHouse1: 1 unit of LC-TV + 10 units of LC-KeyChain + 5 units of LC-Phone.
          Total volume: 1*10000 + 10*125  + 5*200 = 12250 cubic feet
LCHouse2: 2 units of LC-TV + 2 units of LC-KeyChain.
          Total volume: 2*10000 + 2*125 = 20250 cubic feet
LCHouse3: 1 unit of LC-T-Shirt.
          Total volume: 1*800 = 800 cubic feet.
</pre>

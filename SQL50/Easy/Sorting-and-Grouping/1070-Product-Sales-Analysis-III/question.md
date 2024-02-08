Table: `Sales`

| Column Name | Type |
| :---------- | :--- |
| sale_id     | int  |
| product_id  | int  |
| year        | int  |

<pre>
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
</pre>

Table: `Product`

| Column Name  | Type    |
| :----------- | :------ |
| product_id   | int     |
| product_name | varchar |

<pre>
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
</pre>

Write a solution to select the **product id**, **year**, **quantity**, and **price** for the **first year** of every product sold.

Return the resulting table in **any order**.

The result format is in the following example.

### Example 1:

**Input:**

Sales table:

| sale_id | product_id | year | quantity | price |
| :------ | :--------- | :--- | :------- | :---- |
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

Product table:

| product_id | product_name |
| :--------- | :----------- |
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

**Output:**

| product_id | first_year | quantity | price |
| :--------- | :--------- | :------- | :---- |
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
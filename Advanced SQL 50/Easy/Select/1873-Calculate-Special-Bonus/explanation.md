## Approach: CASE vs. IF Statement

### PostgreSQL - Solution 1 - Case with LEFT()

#### Algorithm

-   Utilizes the `CASE` statement to evaluate conditions and return different values accordingly.
-   Checks if the `employee_id` is odd (`employee_id % 2 = 1`) and if the first letter of the `name` is not 'M' (`LEFT(name, 1) != 'M'`).
-   Sets the bonus as `salary` if conditions are met; otherwise, sets it to 0.
-   Results are ordered by `employee_id` in ascending order.

#### Implementation

```sql
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND LEFT(name, 1) != 'M' THEN salary
        ELSE 0
    END AS bonus
FROM employees
ORDER BY 1 ASC;
```

### PostgreSQL - Solution 2 - Case with NOT LIKE

#### Algorithm

-   Similar to Solution 1 but uses the `NOT LIKE` operator for string comparison instead of `LEFT()` function.
-   Checks if `employee_id` is odd and if the `name` does not start with 'M' (`name NOT LIKE 'M%'`).
-   Assigns the bonus as `salary` if conditions hold true; otherwise, assigns 0.
-   Results are sorted based on `employee_id` in ascending order.

#### Implementation

```sql
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM employees
ORDER BY 1 ASC;
```

### MySQL - Solution 1 - If Statement with NOT LIKE

#### Algorithm

-   Uses the `IF` statement for conditional checks.
-   Checks if `employee_id` is odd and if `name` does not start with 'M' (`name NOT LIKE 'M%'`).
-   Sets the bonus as `salary` if conditions are met; otherwise, sets it to 0.
-   Orders the results by `employee_id` in ascending order.

#### Implementation

```sql
SELECT
    employee_id,
    IF(employee_id % 2 = 1 AND name NOT LIKE 'M%', salary, 0) AS bonus
FROM employees
ORDER BY 1 ASC;
```

### MySQL - Solution 2 - If Statement with REGEXP

#### Algorithm

In SQL, we use the conditional function IF to perform conditional checks and return different values based on the condition's result. The syntax of the IF function is as follows:

```sql
IF(condition, value_if_true, value_if_false)
```

The `condition` consists of two parts separated by the keyword AND:

-   `employee_id % 2 = 1`: this condition checks whether `employee_id` is an odd number.
-   `name NOT REGEXP '^M'`: we use the keyword REGEXP for regular expression pattern matching, which checks whether the name **does not** start with the letter "M" (`^M` represents a regular expression pattern that matches any name **not** starting with "M").

Therefore, the IF function in our case is as follows:

```sql
IF(employee_id % 2 = 1 AND name NOT REGEXP '^M', salary, 0)
```

The AS clause is used to give an alias `bonus` to the calculated column above. If both conditions are met, the `bonus` will be set to the employee's salary. Otherwise, it will be set to 0. Then the result set is sorted based on the `employee_id` column in ascending order. The complete code is as follows:

#### Implementation

```sql
SELECT
    employee_id,
    IF(employee_id % 2 = 1 AND name NOT REGEXP '^M', salary, 0) AS bonus
FROM employees
ORDER BY 1 ASC;
```

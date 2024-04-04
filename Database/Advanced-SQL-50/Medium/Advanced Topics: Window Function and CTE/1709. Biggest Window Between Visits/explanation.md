# Approach 1: Find Next Using LEAD() + Append Value Using IFNULL()

## Algorithm

- `LEAD(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date)` This `LEAD` function is used to retrieve the next value of a specified column. Here, it fetches the next date in the sorted order of the `visit_date` column since we use `ORDER BY visited_date`, partitioned by `user_id` so that we will handle each user separately. This means that for each user, it finds the next visit date.
- `IFNULL(..., '2021-01-01')` This `IFNULL` function will check whether the first expression is NULL and return the value of the second expression if it is. Here, it checks the result of the previous `LEAD` function. If the result is NULL, meaning there is no next visit date, it will return the default value '2021-01-01'. This step ensures that we always have a default date value for further calculations.
- `DATEDIFF(..., visit_date)` This `DATEDIFF` function calculates the difference in days between two dates from the result of the previous step. Here, it computes the number of days between two dates, where the first date is the result of the preceding `IFNULL` step (either the next visit date or our default date '2021-01-01'), and the second date is the current visit_date. This will determine the number of days between the current visit date and the next visit date.

```sql
SELECT user_id, visit_date,
       DATEDIFF(IFNULL(LEAD(visit_date, 1)OVER(PARTITION BY user_id ORDER BY visit_date), '2021-01-01'), visit_date) AS w
FROM UserVisits
```

We now have the window of days between each visit and the one right after it for each `user_id`.

| user_id | visit_date | w    |
| :------ | :--------- | :--- |
| 1       | 2020-11-28 | 39   |
| 1       | 2020-10-20 | 5    |
| 1       | 2020-12-3  | 29   |
| 2       | 2020-10-5  | 65   |
| 2       | 2020-12-9  | 23   |
| 3       | 2020-11-11 | 51   |

To get the final output, we only need to identify the maximum window for each `user_id` and rename the column in the main query, the above step can be placed in either a subquery or CTE.

## Implementation

```sql
SELECT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM employees
GROUP BY 1, 2
ORDER BY 2 ASC;
```

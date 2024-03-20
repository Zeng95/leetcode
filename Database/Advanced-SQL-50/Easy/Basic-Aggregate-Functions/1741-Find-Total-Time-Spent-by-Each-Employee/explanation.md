## Approach: Calculate Time and Group By

#### Intuition

In SQL, the query to calculate the total time spent by each employee on each day at the office involves calculating the difference between `out_time` and `in_time`, and then grouping by the `emp_id` and `event_day`, and finally summing up the time differences for each group.

#### Algorithm

This task requires calculating the total time spent by each employee on each day at the office. This implies that we have to first calculate the time difference for each entry (`out_time - in_time`), then group by the `emp_id` and `event_day`, and finally `sum` up the time differences for each group.

Here is an example to help solidify the intuition behind the algorithm:

The original table `Employees`:

| emp_id | event_day  | in_time | out_time |
| :----- | :--------- | :------ | :------- |
| 1      | 2020-11-28 | 4       | 32       |
| 1      | 2020-11-28 | 55      | 200      |
| 1      | 2020-12-03 | 1       | 42       |
| 2      | 2020-11-28 | 3       | 33       |
| 2      | 2020-12-09 | 47      | 74       |

The table after calculating the time difference, grouping by `emp_id` and `event_day`, and summing up the time differences:

| day        | emp_id | total_time |
| :--------- | :----- | :--------- |
| 2020-11-28 | 1      | 173        |
| 2020-11-28 | 2      | 30         |
| 2020-12-03 | 1      | 41         |
| 2020-12-09 | 2      | 27         |

#### Implementation

```sql
SELECT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM employees
GROUP BY 1, 2
ORDER BY 2 ASC;
```

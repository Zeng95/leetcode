# Approach

## Overview

The key to solving this problem is to carefully read the question, break it into single conditions, and make sure all of the conditions are included in the query.

Per the question and the data, the conditions needed are:

1. Distinct titles - 'DISTINCT' is needed when selecting from column title
2. Kid-friendly - 'Y' in column Kids_content
3. The content needs to be a movie - 'Movies' in column content_type
4. The stream date was in June 2020 - filter column program_date to return records from this month

There are several ways to extract year and month from a date column:

- The most straightforward way is to use functions MONTH() and YEAR()

```sql
WHERE MONTH(program_date) = 6 AND YEAR(program_date)=2020
```

- Extract the year and month using DATE_FORMAT() and filter by the year and month combination:

```sql
WHERE DATE_FORMAT(program_date,'%Y-%m') = '2020-06'
```

- Treat the column as a string and return only the matched ones using LEFT():

```sql
WHERE LEFT(program_date, 7) = '2020-06'
```

### Algorithm

1. Select the columns needed for the final output: DISTINCT title
2. JOIN the two tables as both tables are needed for creating the conditions
3. Add all the conditions

### Implementation

```sql
SELECT DISTINCT Content.title
FROM TVProgram
JOIN Content
ON TVProgram.content_id = Content.content_id
WHERE
    (Content.Kids_content = 'Y') AND
    (Content.content_type = 'Movies') AND
    (TVProgram.program_date BETWEEN '2020-06-01 00:00' AND '2020-06-30 23:59');
```

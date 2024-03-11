## Approach: Using `outer join`

#### Intuition

Since the _PersonId_ in table **Address** is the foreign key of table **Person**, we can join these two tables to get the address information of a person.

Considering there might be no address information for every person, we should use `outer join` instead of the default `inner join`.

#### Implementation

```sql
SELECT firstName, lastName, city, state
FROM person p
LEFT JOIN address a
ON p.personId = a.personId;
```

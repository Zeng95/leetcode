## Approach: Using `outer join`

#### Intuition

Since the _PersonId_ in table **Address** is the foreign key of table **Person**, we can join these two tables to get the address information of a person.

Considering there might be no address information for every person, we should use `outer join` instead of the default `inner join`.

#### Implementation

<pre>
Note: For MySQL, an outer join is performed either using left join or right join.
</pre>

```sql
SELECT firstName, lastName, city, state
FROM person p
LEFT JOIN address a
ON p.personId = a.personId;
```

<pre>
Note: Using the where clause to filter the records will fail if there is no address information for a person because it will not display the name information.
</pre>

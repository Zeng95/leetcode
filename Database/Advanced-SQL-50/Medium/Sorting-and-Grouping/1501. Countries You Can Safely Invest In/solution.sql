-- Solution 1
SELECT Country.name AS country
FROM Person
JOIN Calls
ON Person.id = Calls.caller_id OR Person.id = Calls.callee_id
JOIN Country
ON Country.country_code = LEFT(Person.phone_number, 3)
GROUP BY 1
HAVING AVG(duration) > (
    SELECT AVG(duration)
    FROM Calls
)

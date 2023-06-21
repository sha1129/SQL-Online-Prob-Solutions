-- Write an SQL query to report all the duplicate emails.
-- Return the result table in any order.

-- Method 1
WITH newRanks AS(

    SELECT count(email) counts, email, id
    FROM Person
    GROUP BY email
)

SELECT p.email as Email 
FROM Person p JOIN newRanks n ON p.id = n.id
WHERE n.counts > 1

-- Method 2 (lover)

SELECT email as Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1

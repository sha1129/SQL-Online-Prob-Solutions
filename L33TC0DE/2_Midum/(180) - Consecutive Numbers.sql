-- Write an SQL query to find all numbers that appear at least three times consecutively.

WITH secCon AS(
    SELECT ID, LEAD(num) OVER ( ORDER BY ID ) AS numbs
    FROM Logs
),
thirdCon AS(
    
    SELECT ID, LEAD(num,2) OVER ( ORDER BY ID ) AS numbs
    FROM Logs

)

SELECT DISTINCT L.num AS ConsecutiveNums 
FROM Logs L JOIN secCon S
ON L.ID = S.ID AND L.num = S.numbs
JOIN thirdCon T
ON T.ID = S.ID AND S.numbs = T.numbs

-- LEAD will give you row below

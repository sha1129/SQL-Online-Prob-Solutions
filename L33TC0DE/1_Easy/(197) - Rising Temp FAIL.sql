-- Write an SQL query to find all dates Id with higher temperatures compared to its previous dates (yesterday).
-- Return the result table in any order

-- What I tried
WITH nextRow AS (
    SELECT id, LEAD(temperature) OVER() AS nextTemp
    FROM Weather

)

SELECT W.id as Id
FROM nextRow R JOIN Weather W
    ON R.id = W.id
Where W.temperature > R.nextTemp


-- FAIL
-- Online solutuon
-- Again need to create two tables 
-- some use dataDIFF to compare two dates

SELECT w1.id
FROM Weather AS w1 , Weather AS w2
WHERE w1.Temperature > w2.Temperature AND DATEDIFF(w1.recordDate , w2.recordDate) = 1

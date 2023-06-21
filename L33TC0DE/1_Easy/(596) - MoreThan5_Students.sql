--Write an SQL query to report all the classes that have at least five students.
--Return the result table in any order.


WITH studentCount AS (

    SELECT DISTINCT class, count(class) as 'numStud'
    FROM Courses 
    GROUP BY class
)

SELECT class
FROM studentCount
WHERE numStud > 4

-- Hints
-- Read the question do not hurry as usual 
-- working with one column attribute and grouping them
-- with statements help 


-- what others have 

SELECT class 
FROM courses 
GROUP BY class 
HAVING count(student)>=5
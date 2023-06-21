SELECT E.employee_id
FROM  
  (SELECT * FROM Employees LEFT JOIN Salaries USING(employee_id)
   UNION 
   SELECT * FROM Employees RIGHT JOIN Salaries USING(employee_id))
AS E
WHERE E.salary IS NULL OR E.name IS NULL
ORDER BY employee_id;



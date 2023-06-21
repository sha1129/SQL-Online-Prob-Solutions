


SELECT DISTINCT S.name
FROM SalesPerson S LEFT JOIN Orders O ON S.sales_id = O.sales_id 
WHERE S.sales_id NOT IN (
    SELECT sales_id
    FROM Orders O JOIN Company C ON O.com_id = C.com_id 
    WHERE C.name like 'RED'
)
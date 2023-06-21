-- Write an SQL query that reports the products that were *only* sold in the first quarter of 2019. 
-- That is, between 2019-01-01 and 2019-03-31 inclusive.

SELECT DISTINCT S.product_id, P.product_name 
FROM Sales S JOIN Product P ON 
    S.product_id = P.product_id
WHERE S.product_id NOT IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'

)

-- Look for products that are sold outside of the given date range filter them out to get ONLY 

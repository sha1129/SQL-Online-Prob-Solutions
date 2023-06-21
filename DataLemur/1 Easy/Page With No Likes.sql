-- Assume you are given the tables below about Facebook pages and page likes. 
-- Write a query to return the page IDs of all the Facebook pages that don't have any likes. 
-- The output should be in ascending order.

--Facebook SQL Interview Question

SELECT P.page_id
FROM pages P LEFT JOIN page_likes PL 
  ON P.page_id = PL.page_id
WHERE liked_date IS NULL 
ORDER BY P.page_id ASC;
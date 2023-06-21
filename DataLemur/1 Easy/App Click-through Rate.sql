-- Facebook SQL Interview Question

-- Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. 
-- Output the results in percentages rounded to 2 decimal places.

-- Notes:

   -- Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
   -- To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

WITH IMP AS (
  SELECT COUNT(event_type) AS impCount, app_id
  FROM events
  where event_type LIKE 'impression' AND timestamp BETWEEN '2022-01-01 00:00:00' AND '2023-01-01 00:00:00'
  GROUP BY app_id
  
), 

CLC AS(
  SELECT COUNT(event_type) AS clcCount, app_id
  FROM events
  where event_type LIKE 'click' AND timestamp BETWEEN '2022-01-01 00:00:00' AND '2023-01-01 00:00:00'
  GROUP BY app_id

)

SELECT c.app_id, ROUND((100.0*C.clcCount)/I.impCount,2)
FROM CLC C JOIN IMP I 
  ON I.app_id = C.app_id


-- Notes can use case statements 

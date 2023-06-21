-- Part 1
-- UnitedHealth

-- Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.


WITH callMoreThanThree AS (

  SELECT policy_holder_id, COUNT(policy_holder_id) AS callCounts
  FROM callers 
  GROUP BY policy_holder_id
  HAVING COUNT(policy_holder_id) >= 3
)

SELECT COUNT(policy_holder_id) AS member_count
FROM callMoreThanThree;

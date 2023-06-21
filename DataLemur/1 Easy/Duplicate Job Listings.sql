-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
-- Write a query to get the number of companies that have posted duplicate job listings.

-- Clarification:

   -- Duplicate job listings refer to two jobs at the same company with the same title and description.


WITH newCOMP AS (
  SELECT company_id, title, description, COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT count(job_count) AS co_w_duplicate_jobs
FROM newCOMP
WHERE job_count > 1


-- Did not get it had to copy 
-- had the right idea
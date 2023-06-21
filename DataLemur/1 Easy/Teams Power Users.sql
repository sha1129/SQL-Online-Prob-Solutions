-- Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
-- Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

-- Assumption:
   -- No two users has sent the same number of messages in August 2022.



WITH topTwo AS ( 
  SELECT RANK() OVER(ORDER BY COUNT(content) DESC), count(content) as message_count, sender_id
  FROM messages
  WHERE sent_date BETWEEN '08/01/2022 00:00:00' AND '08/31/2022 00:00:00'
  GROUP BY sender_id
  LIMIT 2
)

SELECT sender_id, message_count
FROM topTwo
ORDER BY message_count DESC;

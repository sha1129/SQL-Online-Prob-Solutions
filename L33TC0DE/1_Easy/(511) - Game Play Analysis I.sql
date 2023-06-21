-- Write an SQL query to report the first login date for each player.

SELECT DISTINCT player_id , MIN(event_date) AS first_login 
FROM Activity
GROUP BY player_id


-- WAS bit trickey as I forgot all the tricks 


-- NEW knowledge
-- first_value

SELECT DISTINCT player_id,
FIRST_VALUE (event_date) 
    OVER( PARTITION BY player_id ORDER BY event_date ASC) AS first_login
FROM Activity
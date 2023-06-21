-- New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. 
 --   Assume you are given the below tables about emails and texts.

--Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

--Assumption:

    --action_date is the date when the user activated their account and confirmed their sign-up through the text.

SELECT user_id
FROM emails e JOIN texts t
  ON e.email_id = t.email_id
WHERE t.action_date = e.signup_date + INTERVAL '1 day'
  AND signup_action = 'Confirmed';


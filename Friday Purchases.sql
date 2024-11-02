Table: user_purchases
  
Question 1
------------
IBM is working on a new feature to analyze user purchasing behavior for all Fridays in the first quarter of the year. For each Friday separately, calculate the average amount users have spent per order. The output should contain the week number of that Friday and average amount spent.

Approach:
-----------

In my recent SQL practice, I worked on calculating the average amount spent on Fridays each week for the first quarter of 2023. Here's the breakdown of the approach:

Extract Week Number: EXTRACT(WEEK FROM date) AS week_number - This helps us group data by each week of the quarter.
  
solution
--------
SELECT   EXTRACT(WEEK FROM date) as week_number, 
         COALESCE(AVG(CASE WHEN day_name='Friday' THEN amount_spent END), 0) as mean_amount
FROM     user_purchases
WHERE    EXTRACT(QUARTER FROM date) = 1 
         and EXTRACT(ISOYEAR from date) = 2023
GROUP BY 1


-- NOTE: ISO year may differ from the calendar year because the first week of the ISO year is defined as the week containing the first Thursday of the calendar year.  

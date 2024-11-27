Problem Statement
---------------------
Market penetration is an important metric for understanding Spotify's performance and growth potential in different regions.
You are part of the analytics team at Spotify and are tasked with calculating the active user penetration rate in specific countries.

For this task, 'active_users' are defined based on the following criterias:

last_active_date: The user must have interacted with Spotify within the last 30 days.
• sessions: The user must have engaged with Spotify for at least 5 sessions.
• listening_hours: The user must have spent at least 10 hours listening on Spotify.

Based on the condition above, calculate the active 'user_penetration_rate' by using the following formula.

• Active User Penetration Rate = (Number of Active Spotify Users in the Country / Total users in the Country)

Total Population of the country is based on both active and non-active users.
​
The output should contain 'country' and 'active_user_penetration_rate' rounded to 2 decimals.

Let's assume the current_day is 2024-01-31.


The task involves:
-------------------
Identifying active users based on the criteria:
The last active date is within the previous 30 days.
At least 5 sessions.
At least 10 hours of listening.
Calculating the active user penetration rate for each country.
Rounding the active user penetration rate to two decimal places.


BreakDown 
-------------
 I use a Common Table Expression (CTE) to filter users based on the activity criteria. calculate the active user penetration rate by dividing the number of 
  active users by the total number of users in each country. The result is rounded to two decimal places. I group the results by country.

  solution
  --------

  with cte as 
    (select country,
        case
            when last_active_date >= cast('2024-01-31' as date) -
                interval '30 days'
                and sessions >= 5
                and listening_hours >= 10 then 1
            else 0
        end as is_active
    from penetration_analysis)
select country,
        round(1.0*sum(is_active)/ count(is_active), 2)
from cte
group by 1;

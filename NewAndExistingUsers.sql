Problem
---------
Calculate the share of new and existing users for each month in the table. Output the month, share of new users, and share of existing users as a ratio.
New users are defined as users who started using services in the current month (there is no usage history in previous months). Existing users are users who used services in current month, but they also used services in any previous month.Assume that the dates are all from the year 2020.

Here's a query that calculates the proportion of new users and existing users each month:

 Steps:

All Users Per Month:
Extract the month from the time_id column.
Count all unique users (user_id) interacting in each month.

New Users Per Month:
Find the first interaction date (start_date) for each user.
Identify which month each user's first activity occurred.
Count users whose first activity is in each month.

Combine and Calculate:
Combine the total users and new users data.
Derive existing users by subtracting new users from all users.
Calculate the share of new users and existing users for each month.

Final Output:
For each month:
share_new_users: Percentage of users who are new.
share_existing_users: Percentage of users who are returning.


WITH all_users AS
    (SELECT
        EXTRACT(MONTH FROM time_id) AS months,
        COUNT(DISTINCT user_id) AS all_users
    FROM fact_events
    GROUP BY months),

new_users AS
    (SELECT
        EXTRACT(MONTH FROM start_date) AS month,
        COUNT(DISTINCT user_id) AS new_users
    FROM
        (SELECT user_id,
            MIN(time_id) AS start_date
        FROM fact_events
        GROUP BY user_id) AS tab
    GROUP BY month)
    
SELECT months,
    new_users * 1.0 / all_users as share_new_users,
    old_users * 1.0 / all_users as share_existing_users
FROM    
    (SELECT months,
        all_users - new_users AS old_users,
        new_users,
        all_users
    FROM all_users AS u
    LEFT JOIN new_users AS n
        ON u.months = n.month) AS tab;

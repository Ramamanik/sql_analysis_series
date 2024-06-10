WITH joining_date AS (
SELECT
    user_id,
    MIN(time_id) as joining_date
FROM fact_events
GROUP BY 1
),
new_users_per_month AS (
SELECT
    EXTRACT('month' FROM joining_date) as month,
    COUNT(DISTINCT user_id) AS new_users_per_month
FROM joining_date
GROUP BY 1),
all_users AS (
SELECT
    EXTRACT('month' FROM time_id) as month,
    COUNT(DISTINCT user_id) as all_users
FROM fact_events
GROUP BY 1)
SELECT * FROM all_users

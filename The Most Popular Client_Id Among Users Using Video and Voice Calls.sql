WITH All_counts AS (
SELECT 
    client_id,
    COUNT(DISTINCT user_id) AS tot_num
FROM 
    fact_events
GROUP BY
    client_id
)
, cli_counts AS (
SELECT
    client_id,
    COUNT(DISTINCT user_id) AS num
FROM
    fact_events
WHERE
    event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent')
GROUP BY
    client_id
)


SELECT client_id
FROM (SELECT c.client_id, (num/tot_num::float) AS ratio
FROM cli_counts c
JOIN All_counts a
    ON c.client_id = a.client_id) temp
WHERE ratio > 0.5

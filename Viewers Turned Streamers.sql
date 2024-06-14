SELECT user_id, count(*) n_sessions
FROM twitch_sessions
WHERE session_type = 'streamer'
  AND user_id in
    (SELECT user_id
     FROM
       (SELECT user_id,
               session_type,
               rank() OVER (PARTITION BY user_id
                            ORDER BY session_start) streams_order
        FROM twitch_sessions) s1
     WHERE streams_order =1
       AND session_type = 'viewer')
GROUP BY user_id
ORDER BY n_sessions DESC,
         user_id ASC

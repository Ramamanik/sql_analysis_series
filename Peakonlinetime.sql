You are given a dataset from Amazon that tracks and aggregates user activity on their platform in certain time periods. For each device type, find the time period with the highest number of active users.


The output should contain 'user_count', 'time_period', and 'device_type', where 'time_period' is a concatenation of 'start_timestamp' and 'end_timestamp', like ; "start_timestamp to end_timestamp".

solution
--------
  with cte as 
          (select start_timestamp,
                  end_timestamp,
                  user_count,
                  device_type,
                  start_timestamp || ' to ' || end_timestamp as time_period 
                  from user_activity)
          
      select 
      user_count,
      time_period,
      device_type 
      from
         (select *,
                 rank() over(partition by device_type order by user_count desc) as rnk
                 from  cte)X
                 where x.rnk=1;
         
          

with cte as 
       (select state,
            count(business_id) as n_businesses
             from yelp_business 
             where stars =5 
             group by state)
             
SELECT state,
       n_businesses
FROM
  (SELECT *,
          rank() OVER (
                       ORDER BY n_businesses DESC) AS rnk
   FROM cte) a
WHERE rnk <= 5 order by n_businesses desc,state;

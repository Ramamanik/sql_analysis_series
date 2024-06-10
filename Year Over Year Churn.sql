with cte as (select *,extract(year from end_date)  as final_end_date
      from lyft_drivers where end_date is not null)

, cte1 as 
(select final_end_date as year_driver_churned,count(*) as n_churned
    from cte group by final_end_date) 
,cte2 as    
    
   ( select *,Lag(n_churned) OVER (ORDER BY year_driver_churned) as n_churned_prev from cte1)

,cte3 as
     (select year_driver_churned,n_churned,
    -- case when n_churned_prev is null then 0  else n_churned_prev 
     --end as n_churned_prev 
     coalesce( n_churned_prev,0)  as n_churned_prev 
     from cte2)

select *,case when n_churned_prev<n_churned  then 'increase'
            when n_churned_prev = n_churned  then 'no change'
            when n_churned_prev> n_churned  then 'decrease'
            end as case
            from cte3;














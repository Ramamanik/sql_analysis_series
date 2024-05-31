with CTE as (select *,
             case when clicked = 0 then 1
             when clicked = 1 and search_results_position>3 then 2
             when clicked = 1 and search_results_position<=3 then 3
             end as search_ratings
             from  fb_search_events) 
             select search_id,max(search_ratings) as max_rating from cte group by search_id;
             

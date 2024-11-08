Day 6

problem
---------

Identify the top 3 areas with the highest customer density. Customer density = (total number of unique customers in the area / area size).
Your output should include the area name and its calculated customer density.

Approach
-----------
1.I calculates customer density for each area by dividing the unique customer count by the area's size.
2.I ranks each area based on this density, with the highest density receiving the top rank.
3.Finally, I retrieves the top 3 areas with the highest customer density, showing only the area names and their density values.

with ranked_data as (
    select 
        s.area_name,
        count(distinct t.customer_id) / s.area_size::float as customer_density,
        rank() over (
            order by count(distinct t.customer_id) / s.area_size::float desc
        ) as dn_rank
    from 
        transaction_records t
    join 
        stores s on t.store_id = s.store_id 
    group by 
        s.area_name, s.area_size
)
select 
    area_name, customer_density 
from 
    ranked_data 
where 
    dn_rank <= 3;

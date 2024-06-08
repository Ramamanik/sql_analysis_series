with cte as (select user1, user2 from facebook_friends 
union 
select user2, user1 from facebook_friends
)

-- select * from cte 
,cte2 as 
(select user1, count(distinct user2) as total_friends
from cte
group by user1 
-- order by user1 
)
,cte3 as
(select *, (
select count(distinct user1) from cte 
) as total_users
from cte2)

select user1, (total_friends / total_users) * 100 as popularity_percent 
from cte3
order by user1

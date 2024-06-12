with cte as
(select host_id,sum(n_beds) as number_of_beds  from airbnb_apartments group by host_id order by sum(n_beds) desc)

 select *,dense_rank()over(order by number_of_beds desc) as rank from cte;

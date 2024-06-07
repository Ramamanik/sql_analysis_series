select 
    nationality,
    count(distinct unit_id) as cnt 
from airbnb_hosts a
     join  airbnb_units b
on a.host_id = b.host_id 
     where a.age <30  
and b.unit_type = 'Apartment'
     group by a.nationality order by cnt desc;

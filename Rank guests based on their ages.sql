select 
     guest_id,
     rank() over(order by age desc) as rnk
from airbnb_guests;

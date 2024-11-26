Problem
--------
Find the median price for each wine variety across both datasets. Output distinct varieties along with the corresponding median price.

I uses a combination of subqueries, grouping, and the percentile_cont function to calculate the median price for each wine variety across both datasets. 
By understanding the data, the problem statement, and the code itself, finally find the median price for each wine variety.

Approach
-----------
I uses a combination of subqueries, grouping, and the percentile_cont function to calculate the median price for each wine variety across both datasets. 
By understanding the data, the problem statement, and the code itself, finally find the median price for each wine variety.  
  
solution
--------
select distinct variety as variety, percentile_cont(0.5) within group(order by price) as median_price

from (
select  variety, price
from winemag_p1
union all 
select  variety, price
from winemag_p2 ) c

group by variety
order by variety;

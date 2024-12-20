You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.
The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or multiple purchases on the first day do not count, nor do we count users that over time purchase only the products they purchased on the first day.

Query breakdown
-------------------
marketing_campaign table contains user interactions and
Assigns a sequential number (date_rank) to each interaction per user, ordered by interaction date.Assigns a sequential number (prod_rank) to each interaction per user for each specific product, ordered by interaction date.
Identifies the first interaction for each product by the user.date_rank represents Overall order of user interactions.prod_rank represents order of interactions for a specific product.

select count(distinct user_id) cnt
from (select user_id, created_at, product_id, rank() over(partition by user_id order by created_at) date_rank, rank() over(partition by user_id, product_id order by created_at) prod_rank
from marketing_campaign) a
where a.date_rank > 1 and a.prod_rank < 2;

American Express is reviewing their customers' transactions, and you have been tasked with locating the customer who has the third highest total transaction amount.The output should include the customer's id, as well as their first name and last name. For ranking the customers, use type of ranking with no gaps between subsequent ranks.

In this query, I ranked customers based on their total order costs using SQL's DENSE_RANK() function. 

Here's the step-by-step breakdown:

1.Aggregate Data: Calculated the total order cost for each customer using SUM(total_order_cost).

2. Rank Customers: Used DENSE_RANK() to assign ranks, ordering by total order cost (highest to lowest).

3.Filter Results: Retrieved details of customers with a rank of 3 (third highest total order cost).

solution
--------
with cust_order_cost_rank as
  
(select  cust_id,sum(total_order_cost),dense_rank()over(order by sum(total_order_cost) desc) as rnk  from card_orders group by cust_id)
  
select id,first_name,last_name from cust_order_cost_rank join customers on cust_id =id 
  
where rnk=3;

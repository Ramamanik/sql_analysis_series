Write a query that returns a list of the bottom 2% revenue generating restaurants. Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.
You can calculate the total revenue by summing the order_total column. And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets.

SQL Query to Find Top-Performing Restaurants by Revenue!

In this SQL query, I'm identifying the top 2% of restaurants with the highest total order revenue for May 2020 in a DoorDash delivery dataset. Here's how it works:

Calculate Revenue: First, I group orders by restaurant to get each restaurant's total revenue.
Rank Restaurants: Then, I use ntile to split the restaurants into 50 groups based on revenue, with higher revenue restaurants ranking higher.
Filter Top Performers: Finally, I filter for the top 2% (the highest-ranking group) and sort them by revenue.
This gives a quick view of the highest-earning restaurants for targeted insights!

SELECT restaurant_id, total_order
FROM
  (SELECT restaurant_id,
          sum(order_total) as total_order,
          ntile(50) OVER (
                          ORDER BY sum(order_total))
   FROM doordash_delivery
   WHERE customer_placed_order_datetime BETWEEN '2020-05-01' and '2020-05-31'
   GROUP BY restaurant_id) sq
WHERE ntile=1
ORDER BY 2 DESC;

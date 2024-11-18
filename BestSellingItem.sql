Find the best selling item for each month (no need to separate months by year) where the biggest total invoice was paid. The best selling item is calculated using the formula (unitprice * quantity). Output the month, the description of the item along with the amount paid.



 Query breakdown

---------------------

 Find the top product(s) for each month based on total revenue, ensuring clear insights for business decision-making.



Key Steps in the Query:



1)Calculate Monthly Revenue:

For each product (stockcode), I calculated the total revenue:

SUM(quantity * unitprice)



2)Rank Products by Revenue:

Using DENSE_RANK(), I ranked products within each month, ensuring no gaps in ranks for ties.



3)Filter the Best-Sellers:

Selected only the top product(s) for each month (WHERE ranks = 1).



The query outputs:

The month,

The description of the top-selling product(s),

The total revenue,

sorted by month.



This approach is perfect for uncovering insights into seasonal trends, identifying star products, and enabling data-driven marketing strategies.
  

Solution
--------
WITH ranked AS (
    SELECT EXTRACT(month FROM invoicedate) AS month,
       stockcode,
       SUM(quantity*unitprice) AS total_paid,
       description,
       DENSE_RANK() OVER (PARTITION BY EXTRACT(month FROM invoicedate) 
            ORDER BY SUM(quantity*unitprice) DESC) AS ranks
        FROM online_retail
     GROUP BY EXTRACT(month FROM invoicedate), stockcode, description
)

SELECT month,
       description,
       total_paid
    FROM ranked
 WHERE ranks = 1
 ORDER BY month

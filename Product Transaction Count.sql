--Find the number of transactions that occurred for each product
--Output the product name along with the corresponding number of transactions and order records by the product id in ascending order.
--You can ignore products without transactions.
with cte as (select 
    product_name,
    count(transaction_id) as cnt 
    from excel_sql_transaction_data A
    inner join 
    excel_sql_inventory_data B on A.product_id = B.product_id
    group by B.product_name,A.product_id order by A.product_id asc)
    
    select * from cte where cnt !=0

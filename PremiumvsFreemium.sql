Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads. Hint: In Oracle you should use "date" when referring to date column (reserved keyword).

Here's what I did:
Dataset: Worked with three tables— ms_user_dimension, ms_acc_dimension, ms_download_facts.
Goal: Compare downloads between paying and non-paying customers.
CTE: Grouped the data by date to calculate:
        Total downloads by non-paying customers
        Total downloads by paying customers
Insight: Identified dates where non-paying downloads exceeded paying downloads.
  
  
  with cte as ( 

    select 
    
    a.date,
    sum(case when c.paying_customer = 'no' then a.downloads end) as non_paying,
    sum(case when c.paying_customer = 'yes' then a.downloads end) as paying
    
    from ms_download_facts a 
    join ms_user_dimension b  on a.user_id = b.user_id
    join ms_acc_dimension c  on b.acc_id = c.acc_id
    
    group by a.date
    order by a.date
)

select date, non_paying, paying from cte where non_paying > paying;

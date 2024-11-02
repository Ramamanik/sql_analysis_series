Day 2 :Workers With The Highest Salaries

You have been asked to find the job titles of the highest-paid employees.

Your output should include the highest-paid title or multiple titles with the same salary.

Tables: worker, title

In this query, I used multiple CTEs to find the best-paid title in each department:

cte: Combines data from the worker and title tables based on the worker ID.

cte1: Uses DENSE_RANK() to rank titles by salary within each department in descending order, so the highest-paid title gets rank 1.

cte2: Filters cte1 to keep only the titles with rank 1 (highest-paid ones).

Final Select: Extracts worker_title from cte2, where the job title isn't null, giving us the best-paid titles across departments.

  
solution
--------

with cte as
(select * from worker as w join title as t on w.worker_id = t.worker_ref_id),

cte1 as (select worker_title,
       department,
       salary,
       dense_rank() 
       over(order by salary desc)x from cte),
       
cte2 as
(select * from cte1 where cte1.x=1)

select worker_title as best_paid_title from cte2 where worker_title is not null ; 


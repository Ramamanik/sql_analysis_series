WHY RANK FUNCTION?
---------------------------
1)The RANK() function assigns the same rank to rows with identical values in the ranking column. This is particularly useful when handling datasets where duplicates are meaningful, ensuring accuracy in rankings.

2)using the RANK() function within a window (or partition), allowing to rank subsets of data independently within a dataset.

3)customize the ranking order using the ORDER BY clause, allowing for ascending or descending rankings based on one or more columns.

4)The RANK() function is compatible with other SQL operations, such as filtering (e.g., using WITH and WHERE) or aggregating results in analytic reports.

Problem_solution
--------------------
Find contract starting dates of the top 5 most paid Lyft drivers. Consider only drivers who are still working with Lyft.
  
with start_date as
(
select 
  start_date,
  yearly_salary,
  rank() over(order by yearly_salary desc,start_date asc)rn
from lyft_drivers  where end_date is null 
)

select start_date from start_date where rn<=5;

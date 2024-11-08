problem
---------
Identify the second-highest salary in each department.Your output should include the department, the second highest salary, and the employee ID. Do not remove duplicate salaries when ordering salaries, and apply the rankings without a gap in the rank. For example, if multiple employees share the same highest salary, the second-highest salary will be the next salary that is lower than the highest salaries.

How It Works:
---------------
DENSE_RANK: This function ranks salaries in descending order within each department.
PARTITION BY: Divides the data by department, so ranking restarts within each department.
Filter for rnk = 2: After ranking, select only rows where the rank is 2 — giving the second-highest salary.
Using DENSE_RANK ensures ties (equal salaries) have the same rank, which keeps the results clean.

solution
----------
select department,employee_id,salary as second_highest_salary from(select *,dense_rank()over(partition by department order by salary desc) as rnk 
     from employee_data)e where e.rnk =2 ;

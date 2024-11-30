The Challenge
----------------
Calculate each employee's total compensation by summing the salary, bonus, and commission.Handle NULL values for bonus and commission using the COALESCE() function.Ensure that the total compensation does not return NULL even if some values are missing.

Breakdown
-------------
I use COALESCE() to replace any NULL values in the bonus and commission columns with 0. This ensures that if either of these values is missing, the query still performs the calculations correctly.


The total compensation for each employee is calculated by summing the salary, bonus, and commission values. If any of these values are NULL, the COALESCE() function ensures they are treated as 0.

I check whether an employee has a salary above $50,000 using a WHERE clause.

The final result is ordered by total_compensation in descending order, so the highest compensated employees are at the top.

SELECT
    e.id AS employee_id,
    e.first_name,
    e.last_name,
    e.salary,
   
    COALESCE(e.bonus, 0) AS bonus,
   
    COALESCE(e.commission, 0) AS commission,
    
    e.salary + COALESCE(e.bonus, 0) + COALESCE(e.commission, 0) AS total_compensation,
   
    COALESCE(e.salary, 0) + COALESCE(e.bonus, 0) + COALESCE(e.commission, 0) AS adjusted_compensation
FROM employees e
WHERE e.salary > 50000  
ORDER BY total_compensation DESC;

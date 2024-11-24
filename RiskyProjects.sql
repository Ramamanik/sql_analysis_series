Identify projects that are overbudget. A project is overbudget if the prorated cost of all employees assigned to it exceeds the project’s budget.
To determine this, prorate each employee's annual salary to match the project's duration. For example, if a project with a six-month duration has a budget of $10,000.The total prorated annual employee salary should not exceed $10,000.Output a list of overbudget projects with the following details: project name, project budget, and prorated total employee expenses (rounded up to the nearest dollar).Assume all years have 365 days and disregard leap years.

Prorated Employee Expense Calculation:
--------------------------------------------
DATEDIFF(end_date, start_date) calculates the project duration in days.
SUM(salary)/365 prorates the yearly salary for the project duration.
CEILING() ensures the result rounds up to the nearest whole number.
Joins:Combines linkedin_projects, linkedin_emp_projects, and linkedin_employees tables to link projects with their respective employees and salaries.
Group By:Groups data by project attributes: title, budget, start_date, and end_date.
Filtering:Uses HAVING to show only projects where prorated_employee_expense > budget.
Sorting:Outputs the projects alphabetically by their title.

solution
--------
SELECT title,
       budget,
       CEILING((DATEDIFF(end_date, start_date) * SUM(salary)/365)) AS prorated_employee_expense
FROM linkedin_projects a
INNER JOIN linkedin_emp_projects b ON a.id = b.project_id
INNER JOIN linkedin_employees c ON b.emp_id=c.id
GROUP BY title, budget, end_date, start_date
HAVING prorated_employee_expense > budget
ORDER BY title ASC;

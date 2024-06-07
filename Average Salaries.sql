 SELECT 
          department, 
          first_name, 
          salary,
          avg(salary)over(partition by department)
FROM employee;

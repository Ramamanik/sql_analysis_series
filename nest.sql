Nested Queries
-----------------
SQL is more than just querying databases. it's about solving puzzles to unlock meaningful insights.A nested query, or subquery, is a query within another query. 

It allows to
1.Filter results dynamically
2. Compare data across tables
3. Simplify complex problems

Advantages:
Makes complex queries modular and easier to understand.
Useful for problems requiring multiple levels of filtering or aggregation.

Limitations:
Can be less efficient for large datasets.
Readability decreases with deeply nested queries.


Imagine you’re analyzing employee performance, and you need to find the department with the highest-paid employee and their details. Let’s break it down:

SELECT MAX(salary) AS max_salary
FROM employees;


SELECT department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


SELECT employee_id, name, salary, department_id
FROM employees
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees
);

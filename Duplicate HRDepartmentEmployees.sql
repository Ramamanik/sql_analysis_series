problem
----------
You have been asked to find employees in the HR department, and then output the result with one duplicate.The employee's first name and department should be included in your output.Note: This dataset does not contain any duplicates.

Breakdown:
-------------

 CTE named cte_1 is defined and extracts first_name and department of employees only from the HR department in the worker table.Retrieves all rows from cte_1.Combines these rows with another identical set using UNION ALL, effectively duplicating the data.

UNION ALL vs. UNION:UNION ALL includes duplicate rows, whereas UNION removes duplicates. This query intentionally keeps duplicates.
  

solution
---------
  WITH cte_1 as (
    SELECT
        first_name,
        department
    FROM
        worker
    WHERE department = 'HR'
)

SELECT * FROM cte_1 UNION ALL (SELECT * FROM cte_1);

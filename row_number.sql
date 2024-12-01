Interesting facts about row number
----------------------------------------
The Row_number() function in SQL is used to assign a unique sequential integer to rows within a partition of a result set, starting from 1 for the first row in each partition. 

1.Row_number() assigns a unique sequential integer to each row, based on the Order by clause.

2.Use partition by to restart the row numbering for each partition (group of rows).

3.Useful for ranking, pagination, selecting top N rows, and removing duplicates.

4.Row_number() assigns a distinct number to each row, even if some rows have identical values for the order by column.

5.Can be used in windowed aggregations to calculate other functions (like sums or averages) alongside row numbering.

Find Top N Employees in Each Department

SELECT
    department,
    first_name,
    last_name,
    salary
FROM (
    SELECT
        department,
        first_name,
        last_name,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
    FROM employees
) AS ranked_employees
WHERE dept_rank <= 3;

This query retrieves the top 3 highest-paid employees in each department.

Identify the number of employees within each department that share the same birth month. Your output should list the department, birth month, and the number of employees from that department who were born in that month. If a month has no employees born in it within a specific department, report this month as having 0 employees. The "profession" column stores the department names of each employee.

Explanation
-------------
For each month (1 through 12), this condition checks if the birthday falls in that month.If true, it adds 1 to the sum for that month; otherwise, it adds 0.
This approach is compact and avoids COUNT with NULL checks.This solution will yield one row per department, with columns Month_1 to Month_12, showing the count of employees with birthdays in each month.
solution
--------
SELECT 
    profession AS department,
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 1 THEN 1 END) AS "Month_1",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 2 THEN 1 END) AS "Month_2",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 3 THEN 1 END) AS "Month_3",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 4 THEN 1 END) AS "Month_4",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 5 THEN 1 END) AS "Month_5",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 6 THEN 1 END) AS "Month_6",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 7 THEN 1 END) AS "Month_7",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 8 THEN 1 END) AS "Month_8",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 9 THEN 1 END) AS "Month_9",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 10 THEN 1 END) AS "Month_10",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 11 THEN 1 END) AS "Month_11",
    COUNT(CASE WHEN EXTRACT(MONTH FROM birthday) = 12 THEN 1 END) AS "Month_12"
FROM 
    employee_list
GROUP BY 
    profession
ORDER BY 
    profession;

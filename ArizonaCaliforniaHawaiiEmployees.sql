problem
---------
Find employees from Arizona, California, and Hawaii while making sure to output all employees from each state. Output column headers should be Arizona, California, and Hawaii. Data for all states must be ordered on the first name.
Assume unequal number of employees per state.

In this query, I used Common Table Expressions (CTEs) and a FULL OUTER JOIN to consolidate employee names based on their cities—Arizona, California, and Hawaii.

Explanation:

I create three CTEs (arizona, california, hawaii) to select employees from these specific cities.

Each CTE creates a list with first_name as well as a ROW_NUMBER (a unique sequential number for each name) based on alphabetical order (ORDER BY first_name).

Combining Data with FULL OUTER JOIN:
The FULL OUTER JOIN combines all employees across the three cities so no data is lost.

The COALESCE function aligns rows by prioritizing matches between ROW_NUMBERs from hawaii and california; if those don’t match, it joins with arizona.

Final Output:
The query's result shows columns for employees from Arizona, California, and Hawaii, displaying names side by side even if some names only exist in one location (due to the FULL OUTER JOIN).

This technique is helpful for scenarios where you need a combined view from multiple sources while keeping unmatched data intact.

solution
---------
WITH arizona AS
  (SELECT first_name AS aname,
          ROW_NUMBER() OVER (
                             ORDER BY first_name) AS arn
   FROM employee
   WHERE city='Arizona' ),
     california AS
  (SELECT first_name AS cname,
          ROW_NUMBER() OVER (
                             ORDER BY first_name) AS crn
   FROM employee
   WHERE city='California' ),
     hawaii AS
  (SELECT first_name AS hname,
          ROW_NUMBER() OVER (
                             ORDER BY first_name) AS hrn
   FROM employee
   WHERE city='Hawaii' )
SELECT aname AS arizona,
       cname AS california,
       hname AS hawaii
FROM hawaii
FULL OUTER JOIN california ON hrn=crn
FULL OUTER JOIN arizona ON COALESCE(hrn, crn) =arn;

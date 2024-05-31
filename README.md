# sql_analysis_series
----------------------
Algorithm Performance
------------------------

Meta/Facebook is developing a search algorithm that will allow users to search through their post history. You have been assigned to evaluate the performance of this algorithm.


We have a table with the user's search term, search result positions, and whether or not the user clicked on the search result.


Write a query that assigns ratings to the searches in the following way:
•	If the search was not clicked for any term, assign the search with rating=1
•	If the search was clicked but the top position of clicked terms was outside the top 3 positions, assign the search a rating=2
•	If the search was clicked and the top position of a clicked term was in the top 3 positions, assign the search a rating=3


As a search ID can contain more than one search term, select the highest rating for that search ID. Output the search ID and its highest rating.


Example: The search_id 1 was clicked (clicked = 1) and its position is outside of the top 3 positions (search_results_position = 5), therefore its rating is 2.

Average Salaries
----------------
Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

Best Selling Item
------------------
Find the best selling item for each month (no need to separate months by year) where the biggest total invoice was paid. The best selling item is calculated using the formula (unitprice * quantity). Output the month, the description of the item along with the amount paid.

Class Performance
-----------------
You are given a table containing assignment scores of students in a class. Write a query that identifies the largest difference in total score  of all assignments.
Output just the difference in total score (sum of all 3 assignments) between a student with the highest score and a student with the lowest score.

Comments Distribution
---------------------

Write a query to calculate the distribution of comments by the count of users that joined Meta/Facebook between 2018 and 2020, for the month of January 2020.


The output should contain a count of comments and the corresponding number of users that made that number of comments in Jan-2020. For example, you'll be counting how many users made 1 comment, 2 comments, 3 comments, 4 comments, etc in Jan-2020. Your left column in the output will be the number of comments while your right column in the output will be the number of users. Sort the output from the least number of comments to highest.



To add some complexity, there might be a bug where an user post is dated before the user join date. You'll want to remove these posts from the result.

Cookbook Recipes
----------------
You are given the table with titles of recipes from a cookbook and their page numbers. You are asked to represent how the recipes will be distributed in the book.
Produce a table consisting of three columns: left_page_number, left_title and right_title. The k-th row (counting from 0), should contain the number and the title of the page with the number 
2
×
𝑘
2×k in the first and second columns respectively, and the title of the page with the number 
2
×
𝑘
+
1
2×k+1 in the third column.
Each page contains at most 1 recipe. If the page does not contain a recipe, the appropriate cell should remain empty (NULL value). Page 0 (the internal side of the front cover) is guaranteed to be empty.


Department Manager and Employee Salary Comparison
-------------------------------------------------
Oracle is comparing the monthly wages of their employees in each department to those of their managers and co-workers.
You have been tasked with creating a table that compares an employee's salary to that of their manager and to the average salary of their department.
It is expected that the department manager's salary and the average salary of employee's from that department are in their own separate column.
Order the employee's salary from highest to lowest based on their department.
Your output should contain the department, employee id, salary of that employee, salary of that employee's manager and the average salary from employee's within that department rounded to the nearest whole number.


Note: Oracle have requested that you not include the department manager's salary in the average salary for that department in order to avoid skewing the results. Managers of each department do not report to anyone higher up; they are their own manager.

Differences In Movie Ratings
----------------------------
Calculate the average lifetime rating and rating from the movie with second biggest id across all actors and all films they had acted in. Remove null ratings from the calculation.
Role type is "Normal Acting". Output a list of actors, their average lifetime rating, rating from the film with the second biggest id (use id column), and the absolute difference between the two ratings.

Distinct Salaries
------------------
Find the top three distinct salaries for each department. Output the department name and the top 3 distinct salaries by each department. Order your results alphabetically by department and then by highest salary to lowest.

File Contents Shuffle
---------------------
Sort the words alphabetically in 'final.txt' and make a new file named 'wacky.txt'. Output the file contents in one column and the filename 'wacky.txt' in another column. Lowercase all the words. To simplify the question, there is no need to remove the punctuation marks.

Find Favourite Wine Variety
---------------------------
Find each taster's favorite wine variety.
Consider that favorite variety means the variety that has been tasted by most of the time.
Output the taster's name along with the wine variety.

Find The Most Profitable Location
---------------------------------
Find the most profitable location. Write a query that calculates the average signup duration and average transaction amount for each location, and then compare these two measures together by taking the ratio of the average transaction amount and average duration for each location.


Your output should include the location, average duration, average transaction amount, and ratio. Sort your results from highest ratio to lowest.

Find the genre of the person with the most number of oscar winnings
-------------------------------------------------------------------
Find the genre of the person with the most number of oscar winnings.
If there are more than one person with the same number of oscar wins, return the first one in alphabetic order based on their name. Use the names as keys when joining the tables.

Find all businesses whose lowest and highest inspection scores are different
----------------------------------------------------------------------------
Find all businesses whose lowest and highest inspection scores are different.
Output the corresponding business name and the lowest and highest scores of each business. HINT: you can assume there are no different businesses that share the same business name
Order the result based on the business name in ascending order.

Find the number of employees who received the bonus and who didn't
------------------------------------------------------------------
Find the number of employees who received the bonus and who didn't. Bonus values in employee table are corrupted so you should use  values from the bonus table. Be aware of the fact that employee can receive more than one bonus.
Output value inside has_bonus column (1 if they had bonus, 0 if not) along with the corresponding number of employees for each.

Year Over Year Churn
--------------------
Find how the number of drivers that have churned changed in each year compared to the previous one. Output the year (specifically, you can use the year the driver left Lyft) along with the corresponding number of churns in that year, the number of churns in the previous year, and an indication on whether the number has been increased (output the value 'increase'), decreased (output the value 'decrease') or stayed the same (output the value 'no change').

Find the top 5 least paid employees for each job title
------------------------------------------------------
Find the top 5 least paid employees for each job title.
Output the employee name, job title and total pay with benefits for the first 5 least paid employees. Avoid gaps in ranking.

Find the variance and the standard deviation of scores that have grade A
-------------------------------------------------------------------------
Find the variance of scores that have grade A using the formula AVG((X_i - mean_x) ^ 2).
Output the result along with the corresponding standard deviation.

Finding Updated Records
-----------------------
We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.


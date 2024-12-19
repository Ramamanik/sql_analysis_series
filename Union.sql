UNION AND UNION ALL
---------------------------

UNION
--------
1) Combines the results of two or more select statements into a single result set.
2) Removes duplicate rows from the final result, ensuring all rows are unique.
3) Requires additional processing to eliminate duplicates, which can impact performance.

UNION ALL
-------------
1) Combines the results of two or more select statements into a single result set.
2) Does not remove duplicate rows; all rows from the queries are included in the final result.
3) Faster than union because no duplicate-checking is performed.

SELECT Customer_ID, Customer_Name, SUM(Order_Total) AS Total_Spending
FROM (
    SELECT Customer_ID, Customer_Name, Order_Total
    FROM Orders_2021
    UNION ALL
    SELECT Customer_ID, Customer_Name, Order_Total
    FROM Orders_2022
    UNION ALL
    SELECT Customer_ID, Customer_Name, Order_Total
    FROM Orders_2023
) AS CombinedOrders
GROUP BY Customer_ID, Customer_Name;

Removing duplicates
-----------------------

Removing duplicates is not just a housekeeping task. it’s a critical step to ensure that the data is accurate, efficient, and actionable. It contributes to better decision-making, streamlined operations, and improved trust in data systems.

1. Ensures Data Accuracy
----------------------------
Problem: Duplicate records can lead to incorrect calculations or reporting.
Example: If sales data contains duplicates, total revenue will be overstated.
Impact: Decisions based on inaccurate data can harm business strategy.

2. Improves Query Performance
-----------------------------------
Problem: Duplicates increase the volume of data, slowing down queries.
Example: A report with duplicate entries requires additional processing time, reducing system efficiency.
Impact: Clean data ensures faster and more efficient data retrieval.

3. Prevents Redundant Storage
-----------------------------------
Problem: Duplicate rows consume unnecessary disk space.
Example: In a large database, storing redundant records inflates storage costs.
Impact: Eliminating duplicates optimizes storage and reduces costs.

4. Enhances Data Consistency
---------------------------------
Problem: Inconsistent data undermines trust.
Example: Multiple entries for the same customer might have varying contact details.
Impact: Clean, consistent data ensures reliable communication and customer experience.

5. Supports Reliable Analysis
-------------------------------
Problem: Duplicates distort analysis results.
Example: When analyzing user behavior, duplicate entries could misrepresent user activity.
Impact: Accurate analysis leads to better insights and business outcomes.

6. Avoids Business Process Errors
-------------------------------------
Problem: Duplicates may disrupt workflows or operations.
Example: In an order management system, duplicate orders could result in multiple shipments or billing errors.
Impact: Clean data minimizes operational risks and enhances process efficiency.

7. Ensures Regulatory Compliance
-------------------------------------
Problem: Some industries have strict regulations for data integrity.
Example: Healthcare and finance sectors require accurate records to comply with legal standards.
Impact: Removing duplicates helps meet compliance requirements and avoids penalties.

8. Improves Machine Learning Models
-------------------------------------------
Problem: Duplicates can skew the training data for machine learning.
Example: If duplicate entries are present, models may overfit or produce biased predictions.
Impact: Clean data ensures more reliable and generalizable machine learning outcomes.


Removing duplicates in SQL can be done using different approaches, depending on the complexity of the data and the requirements. 
Here's a complex problem using Common Table Expressions (CTEs) and the ROW_NUMBER() function to remove duplicates from a dataset.

WITH CTE_Deduped AS (
    SELECT 
        order_id,
        customer_id,
        order_date,
        order_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, order_date, order_amount 
            ORDER BY order_id
        ) AS row_num
    FROM orders
)
DELETE FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM CTE_Deduped
    WHERE row_num > 1
);

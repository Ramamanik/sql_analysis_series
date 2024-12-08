Why pandas?
Pandas is a powerful Python library used for data analysis and manipulation. It is widely adopted because it simplifies complex operations on structured data.

1. Easy Data Manipulation
2. Handles Diverse Data Sources
3. Powerful Data Cleaning
4. Fast and Efficient
5. Rich Analytical Functions
6. Integration with Other Libraries
7. Open-Source and Well-Supported

Problem_solution 
--------------------
Summarize the activity of each customer by calculating their total number of interactions and content items created.Your output should include the customer's ID, the total number of interactions, and the total number of content items.

Breakdown
-------------
1.Groups customer data to calculate the number of interactions and content items.
2.Combines these insights into a single summary table using an outer join, ensuring no customer is left out.
3.Fills missing values with 0 to account for customers who interacted only once.

import pandas as pd

interaction_counts = customer_interactions.groupby('customer_id')['interaction_id'].count().reset_index(name='interactions')
content_counts = user_content.groupby('customer_id')['content_id'].count().reset_index(name='content_items')

result = pd.merge(interaction_counts, content_counts, on='customer_id', how='outer')#.fillna(0)

result

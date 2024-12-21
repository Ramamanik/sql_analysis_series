Why performance tuning is so important?
----------------------------------------------
1) Indexes speed up data retrieval by reducing the number of rows scanned. Use them wisely to avoid performance degradation due to large index updates.

2) Fetch only the columns in need instead of using SELECT * to reduce data transfer and processing overhead.

3) Use execution plans to understand how a query is executed and identify bottlenecks.

4) Prefer appropriate join types and ensure proper indexing on join columns.

5) Use batch processing to avoid overwhelming the database with large operations.

6) Functions on indexed columns prevent the use of the index.

7) Write precise WHERE clauses to minimize scanned rows.

8) Replace nested queries with joins or common table expressions (CTEs) for better readability and performance.

9) Enable caching for repetitive queries to reduce database load.

10) Split large tables into smaller partitions for efficient querying.


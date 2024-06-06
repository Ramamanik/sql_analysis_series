WITH CTE AS (
SELECT 
    t2.name,
    SUM(CASE WHEN t1.score < 5 THEN 1 ELSE 0 END) AS negative_reviews,
    SUM(CASE WHEN t1.score > 4 THEN 1 ELSE 0 END) AS positive_reviews,
    COUNT(t1.score) as total_reviews
FROM instacart_reviews t1 JOIN instacart_stores t2
ON t1.store_id = t2.id
WHERE t2.opening_date >= '2021-07-01'
GROUP BY 1
),
CTE2 AS (
SELECT
    name,
    (negative_reviews/positive_reviews::float) AS review_ratio,
    100.0 * negative_reviews / total_reviews::float as review_pct
FROM CTE)
SELECT
    name,
    review_ratio
FROM CTE2 
WHERE review_pct > 20

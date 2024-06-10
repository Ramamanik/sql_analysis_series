SELECT 
    acquired_quarter,
    COUNT(acquirer_name) as total_acquisitions
FROM crunchbase_acquisitions
GROUP BY 1
ORDER BY 2 DESC

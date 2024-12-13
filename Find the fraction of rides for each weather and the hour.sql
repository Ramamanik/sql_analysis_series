Find the fraction (percentage divided by 100) of rides each weather-hour combination constitutes among all weather-hour combinations.
Output the weather, hour along with the corresponding fraction.

Query Breakdown:
1)Group rides by weather and hour to calculate ride counts (cnt).
2)Calculate total rides across all data.
3)Combine these results and compute the probability for each weather-hour 4)combination as probability = count in group / total count.
5)Order results

SELECT
 weather,
 hour,
 cnt / total_count AS probability
FROM
 (SELECT
 weather,
 hour,
 COUNT(*) AS cnt
 FROM
 lyft_rides
 GROUP BY
 weather,
 hour) counts
LEFT JOIN
 (SELECT
 COUNT(*) AS total_count
 FROM
 lyft_rides) tc
ON TRUE
ORDER BY
 weather ASC,
 hour ASC;

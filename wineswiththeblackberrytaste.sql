Problem
---------
Find the number of Bodegas (wineries with "bodega" pattern inside the name) outside of Spain that produce wines with the blackberry taste (description contains blackberry string). Group the count by country and region.Output the country, region along with the number of bodegas.
Order records by the number of bodegas in descending order.

Approach
-----------
I combined the relevant data using a UNION ALL to ensure wineries with distinct regional associations were considered accurately.


Extracted country, region, and winery details while ensuring both region fields are evaluated.

Applied filters for non-Spanish wineries with descriptions containing "blackberry."

Counted distinct "bodega" wineries per region and sorted the results to highlight the areas with the most entries.

 solution
----------

SELECT country,
       region,
       count(DISTINCT winery) AS n_bodegas
FROM
  (SELECT country,
          region_1 AS region,
          winery,
          description
   FROM winemag_p1
   UNION ALL SELECT country,
                    region_2 AS region,
                    winery,
                    description
   FROM winemag_p1
   WHERE region_1 != region_2 ) sub
WHERE winery ILIKE '%bodega%'
  AND country <> 'Spain'
  AND description ILIKE '%blackberry%'
GROUP BY country,
         region
ORDER BY n_bodegas DESC;

problem
----------
You are working on a data analysis project at Deloitte where you need to analyze a dataset containing informationabout various cities. Your task is to calculate the population density of these cities, rounded to the nearest integer, and identify the cities with the minimum and maximum densities.The population density should be calculated as (Population / Area).The output should contain 'city', 'country', 'density'.

Approach
-----------
Density Calculation: Added a new column to calculate density, rounding to the nearest integer.
 Insights Extraction: Identified cities with the highest and lowest population densities.
Output: The result included 'City,' 'Country,' and their calculated 'Density.'

WITH ranked_cities AS (
    SELECT 
        city,
        country,
        ROUND((population / area)) AS pop_density,
        DENSE_RANK() OVER (ORDER BY ROUND((population / area)) DESC) AS max_den,
        DENSE_RANK() OVER (ORDER BY ROUND((population / area))) AS min_den
    FROM 
        cities_population
    WHERE 
        area != 0
)
SELECT 
    city,
    country,
    pop_density
FROM 
    ranked_cities
WHERE 
    max_den = 1 OR min_den = 1;

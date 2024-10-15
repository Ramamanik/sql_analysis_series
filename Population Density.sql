Question:
--------
You are working on a data analysis project at Deloitte where you need to analyze a dataset containing information
about various cities. Your task is to calculate the population density of these cities, rounded to the nearest integer, and identify the cities with the minimum and maximum densities.
The population density should be calculated as (Population / Area).The output should contain 'city', 'country', 'density'.

solution
--------
select
city,
country,
pop_density 
from (
    select 
    city,
    country,
    round( (population/area ) ) as pop_density,
    dense_rank() over ( order by round( (population/area ) ) desc  ) as max_den,
    dense_rank() over ( order by  round( (population/area ) )   ) as min_den
    from cities_population
    where area != 0
) x
where max_den = 1 or min_den = 1;

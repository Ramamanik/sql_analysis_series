Problem
---------
A group of travelers embark on world tours starting with their home cities. Each traveler has an undecided itinerary that evolves over the course of the tour. Some travelers decide to abruptly end their journey mid-travel and live in their last destination.Given the dataset of dates on which they travelled between different pairs of cities, can you find out how many travellers ended back in their home city? For simplicity, you can assume that each traveler made at most one trip between two cities in a day.

The SQL query calculates the number of travelers who returned to their starting city. 

Explanation:
-------------
Identify Start and End Dates:For each traveler, find their earliest (start_date) and latest (end_date) travel records.

Match Start Cities:Find the city where each traveler started their journey based on the start_date.

Match End Cities:Find the city where each traveler ended their journey based on the end_date.

Count Return Travelers:Check if the start_city matches the end_city for each traveler.Count the number of such travelers.

 Result:
The output is the count of travelers (n_travelers_returned) who started and ended their journey in the same city.

solution
--------
WITH start_end_dates AS
  (SELECT traveler,
          min(date) AS start_date,
          max(date) AS end_date
   FROM travel_history
   GROUP BY traveler),
     start_cities AS
  (SELECT h.traveler,
          start_city
   FROM travel_history h
   JOIN start_end_dates d ON h.traveler=d.traveler
   AND date=start_date),
     end_cities AS
  (SELECT h.traveler,
          end_city
   FROM travel_history h
   JOIN start_end_dates d ON h.traveler=d.traveler
   AND h.date=end_date)
SELECT count(*) n_travelers_returned
FROM start_cities s
JOIN end_cities e ON s.traveler=e.traveler
WHERE start_city = end_city

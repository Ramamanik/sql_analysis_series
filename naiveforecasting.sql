Some forecasting methods are extremely simple and surprisingly effective. Naïve forecast is one of them; we simply set all forecasts to be the value of the last observation. Our goal is to develop a naïve forecast for a new metric called "distance per dollar" defined as the (distance_to_travel/monetary_cost) in our dataset and measure its accuracy. To develop this forecast, sum "distance to travel" and "monetary cost" values at a monthly level before calculating "distance per dollar". This value becomes your actual value for the current month. The next step is to populate the forecasted value for each month. This can be achieved simply by getting the previous month's value in a separate column. Now, we have actual and forecasted values. This is your naïve forecast. Let’s evaluate our model by calculating an error matrix called root mean squared error (RMSE). RMSE is defined assqrt(mean(square(actual - forecast)). Report out the RMSE rounded to the 2nd decimal spot.

Approach
----------
I calculated the distance per dollar for each month.

I used the previous month’s value as the forecast for the current month (a basic "naive" method).

Finally, I calculated the RMSE to measure how close the forecasts were to the actual values.
Activate to view larger image,

WITH distance_per_dollar AS (
    SELECT   EXTRACT(MONTH FROM request_date) AS month, 
             SUM(distance_to_travel) / SUM(monetary_cost) AS actual_values
    FROM     uber_request_logs
    GROUP BY 1
    ORDER BY 1
),
naive_forecast AS (
    SELECT *, LAG(actual_values) OVER(ORDER BY month) AS forecasted_values
    FROM   distance_per_dollar
)
SELECT ROUND(SQRT(AVG((actual_values - forecasted_values)^2)::NUMERIC), 2) AS rmse
FROM   naive_forecast;

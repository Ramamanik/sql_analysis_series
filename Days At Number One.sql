Question asked in spotify
-------------------------
        
Find the number of days a US track has stayed in the 1st position for both the US and worldwide rankings on the same day. 
Output the track name and the number of days in the 1st position. Order your output alphabetically by track name.

My approach:
-----------
        
Subquery: I start by creating a subquery that selects trackname from the US rankings dataset. I use a SUM function combined with a CASE statement to count the number of days a track has been in the 1st position. This count is calculated using the OVER(PARTITION BY us.trackname) clause, which allows us to perform this calculation for each individual track.

JOIN Operation: I join the US daily rankings with the worldwide daily rankings on the trackname and date fields to ensure only counting days when a track is ranked #1 in both datasets.

Filtering: The WHERE clause ensures that we only consider rows where the track is in the 1st position.

Final Aggregation: In the outer query, I group the results by trackname and use MAX() to find the maximum number of days in the 1st position for each track.

Sorting: Finally, we order the output alphabetically by trackname for clarity.


If the region 'US' appears in dataset, it should be included in the worldwide ranking.select trackname,
        max(n_days_on_n1_position) as n_days_on_n1_position
        from 
        (select us.trackname,
        sum(case when us.position= 1 then 1 
                 else 0
                 end) 
                 over(partition by us.trackname)  as n_days_on_n1_position 
           from spotify_daily_rankings_2017_us as us inner join spotify_worldwide_daily_song_ranking world on world.trackname = us.trackname
           and world.date= us.date where us.position = 1) tmp
           group by trackname
           order by trackname; 

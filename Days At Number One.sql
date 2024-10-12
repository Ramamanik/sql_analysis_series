select trackname,
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

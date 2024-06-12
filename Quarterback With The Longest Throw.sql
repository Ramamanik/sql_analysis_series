select 
     qb,
     substring(lg FROM '[0-9]+')::numeric lg_num 
     from qbstats_2015_2016 
     where year = 2016 
     order by lg_num desc limit 1;

--Select * from ms_user_dimension;
--Select * from ms_acc_dimension;
--Select * from ms_download_facts;

--Find the total number of downloads for paying and non-paying users by date
with cte as (
        select date,
        sum(case when paying_customer= 'no' then downloads end) as non_Paying,
        sum(case when paying_customer= 'yes' then downloads end) as Paying 
from ms_acc_dimension D 
        inner join ms_user_dimension U on D.acc_id = U.acc_id
        inner join ms_download_facts F on U.user_id = F.user_id
        group by date order by date)
         
        select date,non_Paying,paying from cte where (non_Paying > Paying) order by date;
              

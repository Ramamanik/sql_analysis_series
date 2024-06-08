select advertising_channel from
(select advertising_channel,money_spent, min(customers_acquired) from uber_advertising
group by 1
having min(customers_acquired) >= 1500
order by  3 desc, 2 asc) a
limit 1

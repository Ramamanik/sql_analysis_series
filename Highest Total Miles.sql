You’re given a table of Uber rides that contains the mileage and the purpose for the business expense.  You’re asked to find business purposes that generate the most miles driven for passengers that use Uber for their business transportation. Find the top 3 business purpose categories by total mileage.
solution
select purpose,sum(miles) from my_uber_drives 
where purpose is not null AND category ILIKE '%business%'
group by purpose 
order by sum(miles) desc limit 3;

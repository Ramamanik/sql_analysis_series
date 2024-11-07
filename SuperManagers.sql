Find managers with at least 7 direct reporting employees. In situations where user is reporting to himself/herself, count that also.
Output first names of managers.

solution
--------
select 
    m.first_name as manager_name 
    from employee m 
    left join employee e 
    on e.manager_id = m.id
    group by m.first_name 
    having count(*)>=7;

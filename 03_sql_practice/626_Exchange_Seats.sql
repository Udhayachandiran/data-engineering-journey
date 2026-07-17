-- Write your PostgreSQL query statement below
select 
case
when id = ( select max(id) from seat ) and id %2 =1 then id
when id %2 =1 then id + 1
when id %2 =0 then id - 1
end as id, 
student  from seat
order by id;

--or

select id,
case 
when id = max(id) over() and id %2 =1 then student
when id % 2 = 0 then lag(student) over(order by id)
when id % 2 = 1 then lead(student) over(order by id)
end as student
from seat
order by id;


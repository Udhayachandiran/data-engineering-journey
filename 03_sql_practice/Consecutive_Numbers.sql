-- select a.id, a.num from logs a join logs b on a.num = b.num;
with cte as(
    select *,
    lead(num, 1) over(order by id) as num2,
    lead(num, 2) over(order by id) as num3
    from logs
)
select distinct num as ConsecutiveNums from cte where num = num2 and num = num3;

-- or
select distinct a.num as ConsecutiveNums
from Logs a 
join Logs b on a.id = b.id + 1
join Logs c on b.id + 1 = c.id + 2
where a.num = b.num and b.num = c.num;
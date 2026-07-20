-- Write your PostgreSQL query statement below
with cte as(
    select visited_on, sum(amount) as n_amt from customer group by visited_on order by visited_on
)

select * from
(
select visited_on, 
sum(n_amt) over(order by visited_on rows between 6 preceding and current row) as amount,
round(avg(n_amt) over(order by visited_on rows between 6 preceding and current row), 2) as average_amount
from cte 
) full_visit
where visited_on> (select min(visited_on) + interval '5 days' from cte)
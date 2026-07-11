-- Write your PostgreSQL query statement below
with cte as(
    select account_id ,
    case
    when income >50000 then 'High Salary'
    when income <20000 then 'Low Salary'
    else 'Average Salary'
    end as category
    from accounts
)
select b.category,
count(account_id) as accounts_count 
from cte a right join
(select 'Low Salary' as category union all select 'Average Salary' union all select 'High Salary') b
on a.category = b.category
group by b.category

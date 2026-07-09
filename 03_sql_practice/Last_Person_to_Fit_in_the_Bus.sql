-- Write your PostgreSQL query statement below
with cte as(
    select person_name, weight, turn,
    sum(weight) over( order by turn) as Tot_weight 
    from Queue
)
select person_name from cte where Tot_weight <=1000 order by turn desc limit 1;
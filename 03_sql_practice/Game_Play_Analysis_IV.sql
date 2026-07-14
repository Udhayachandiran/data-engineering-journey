-- Write your PostgreSQL query statement below
with repeat_login as (
    select player_id
    ,(min(event_date) + interval '1 day')::date as second_day 
    from activity 
    group by player_id
)
select round(count(a.player_id)::numeric / count(r.player_id), 2)
as fraction
from repeat_login r 
left join activity a 
on r.player_id = a.player_id and r.second_day=a.event_date;

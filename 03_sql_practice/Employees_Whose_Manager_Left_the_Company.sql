-- Write your PostgreSQL query statement below
select employee_id 
from employees e 
where salary < 30000 and
manager_id is not null
  and not exists (
      select 1 
      from employees m 
      where e.manager_id = m.employee_id 
  ) 
order by employee_id;

--or
select e.employee_id from employees e 
left join employees m
on e.manager_id = m.employee_id
where e.salary <30000
and e.manager_id is not null
and m.employee_id is null
order by e.employee_id;

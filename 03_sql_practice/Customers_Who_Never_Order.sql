-- Write your PostgreSQL query statement below
select name as Customers from customers where id in (
    select id from customers where id not in(select distinct customerId from orders)
);

--or

select name as Customers
from customers c
left join orders o 
on c.id = o.customerid
where customerid is null;
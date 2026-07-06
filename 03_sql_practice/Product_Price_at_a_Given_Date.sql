-- Write your PostgreSQL query statement below

with main as (
    select a.product_id, a.new_price as price from products a
    join (select b.product_id, max(b.change_date) as change_date from products b where change_date <='2019-08-16' group by b.product_id) b 
    on a.product_id = b.product_id and a.change_date = b.change_date
)
select d.product_id, coalesce(m.price, 10) as price from (select distinct product_id from products) d
left join main m
on d.product_id = m.product_id;


--or


with cte as(
    select product_id, 
    new_price,
    row_number() over(partition by product_id order by change_date desc) as row_n
    from products where change_date <= '2019-08-16'
)
select distinct a.product_id, coalesce(b.new_price, 10) as price from products a
left join (select * from cte where row_n =1) b
on a.product_id = b.product_id;


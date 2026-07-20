-- -- Write your PostgreSQL query statement below

    with cte as(
        select a.name, c.title, b.rating, b.created_at from users a 
        join movierating b on a.user_id = b.user_id
        join movies c on b.movie_id = c.movie_id
    )
    (   
    select name as results from cte group by name
    order by count(name) desc, name asc limit 1
    )

    union all

    (
    select title as results from cte
    where extract(year from created_at) = 2020 and extract(month from created_at) = 02
    group by title
    order by avg(rating) desc, title asc limit 1
    )

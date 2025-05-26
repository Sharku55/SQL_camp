-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with cte as (
         select
             coalesce(u.name, 'not defined') as name,
             coalesce(u.lastname, 'not defined') as lastname,
             c.name as currency_name,
             b.money,
             coalesce(
                 (select rate_to_usd
                  from currency c
                  where b.currency_id = c.id and c.updated < b.updated
                  order by c.updated desc
                  limit 1),
                 (select rate_to_usd
                  from currency c
                  where b.currency_id = c.id and c.updated > b.updated
                  order by c.updated asc
                  limit 1)
             ) as usd_coef
         from balance b
         inner join (select c.id, c.name from currency c group by c.id, c.name) as c
            on c.id = b.currency_id
         left join "user" u
            on b.user_id = u.id
     ) 
select
    cte.name,
    cte.lastname,
    currency_name,
    money * usd_coef as currency_in_usd
from cte
order by name desc, lastname, currency_name;


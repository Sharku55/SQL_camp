with visitcounts as (
    select
        pv.pizzeria_id,
        count(case when p.gender = 'female' then 1 else null end) female_visits,
        count(case when p.gender = 'male' then 1 else null end) male_visits
    from person_visits pv
    inner join person p on pv.person_id = p.id
    group by pv.pizzeria_id
)
select p.name pizzeria_name
from pizzeria p
join visitcounts vc on p.id = vc.pizzeria_id
where vc.female_visits > vc.male_visits
union all
select p.name pizzeria_name
from pizzeria p
join visitcounts vc on p.id = vc.pizzeria_id
where vc.male_visits > vc.female_visits
order by pizzeria_name;

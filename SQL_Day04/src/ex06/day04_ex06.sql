CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
FROM pizzeria
JOIN person_visits  ON pizzeria.id = person_visits.pizzeria_id
JOIN menu  ON pizzeria.id = menu.pizzeria_id
JOIN person  ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' and person_visits.visit_date = '2022-01-08' and menu.price <800

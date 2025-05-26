SELECT menu.pizza_name, menu.price, pizzeria.name, person_visits.visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits  ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
where price between 800 and 1000 and person.name = 'Kate'
ORDER BY menu.pizza_name, menu.price , pizzeria.name
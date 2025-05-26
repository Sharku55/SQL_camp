SELECT person.name
FROM person
JOIN person_order  ON person.id = person_order.person_id
JOIN menu  ON person_order.menu_id = menu.id
WHERE person.gender = 'female' and menu.pizza_name = 'pepperoni pizza'
intersect
SELECT person.name
FROM person
JOIN person_order  ON person.id = person_order.person_id
JOIN menu  ON person_order.menu_id = menu.id
WHERE person.gender = 'female' and menu.pizza_name = 'cheese pizza'
ORDER BY 1

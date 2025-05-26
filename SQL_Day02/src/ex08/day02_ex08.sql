SELECT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu  ON menu.id = person_order.menu_id
where  person.gender = 'male' and (person.address = 'Moscow' or person.address = 'Samara') and (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name  = 'mushroom pizza')
ORDER BY name DESC

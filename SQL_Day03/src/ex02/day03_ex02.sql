SELECT menu.pizza_name, menu.price, pizzeria.name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE person_order.menu_id IS NULL
ORDER BY menu.pizza_name, menu.price

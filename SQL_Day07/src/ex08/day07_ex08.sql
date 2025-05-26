SELECT pr.address, pz.name, count(*) AS count_of_orders
FROM person_order po JOIN person pr ON pr.id = po.person_id
JOIN menu ON menu.id = po.menu_id
JOIN pizzeria pz ON pz.id = menu.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2;
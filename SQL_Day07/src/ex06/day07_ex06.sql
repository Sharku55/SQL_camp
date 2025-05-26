SELECT pz.name, count(*) AS count_of_orders,
    round(avg(menu.price), 2) AS average_price,
    round(max(menu.price), 2) AS max_price,
    round(min(menu.price), 2) AS min_price
FROM pizzeria pz JOIN menu ON menu.pizzeria_id = pz.id
JOIN person_order po ON po.menu_id = menu.id
GROUP BY 1
ORDER BY 1;
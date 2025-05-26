SELECT pr.name, menu.pizza_name, menu.price AS price,
    round(menu.price - (menu.price * discount) / 100, 2) AS discount_price,
    pz.name AS pizzeria_name
FROM person_order po JOIN menu ON menu.id = po.menu_id
JOIN person pr ON pr.id = po.person_id
JOIN pizzeria pz ON pz.id = menu.pizzeria_id
JOIN person_discounts pd ON pd.person_id = po.person_id AND pd.pizzeria_id = pz.id
ORDER BY 1, 2;

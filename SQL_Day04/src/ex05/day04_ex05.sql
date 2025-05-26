CREATE VIEW v_price_with_discount AS
    SELECT name, pizza_name, price, round(price - 0.1 * price) AS discount_price
    FROM person_order po
    JOIN person pr ON pr.id = po.person_id
    JOIN menu ON menu.id = po.menu_id
    ORDER BY 1, 2;

SELECT * FROM v_price_with_discount;    

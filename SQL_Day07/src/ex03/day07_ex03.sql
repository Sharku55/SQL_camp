WITH t1 AS (
    SELECT pz.name, count(*) AS count
    FROM pizzeria pz 
    JOIN person_visits pv ON pz.id = pv.pizzeria_id
    GROUP BY 1
), t2 AS (
    SELECT pz.name, count(*) AS count
    FROM pizzeria pz 
    JOIN menu ON pz.id = menu.pizzeria_id
    JOIN person_order po ON po.menu_id = menu.id 
    GROUP BY 1
)
SELECT t1.name,
CASE
    WHEN t1.count IS NULL THEN t2.count
    WHEN t2.count IS NULL THEN t1.count
    ELSE t1.count + t2.count
END AS total_count
FROM t1 FULL OUTER JOIN t2 ON t2.name = t1.name
ORDER BY 2 DESC, 1;
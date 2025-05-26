WITH people AS (
    SELECT p.gender, pi.name AS pizzeria_name
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
)
, female_only AS (
    SELECT DISTINCT pizzeria_name
    FROM people
    WHERE gender = 'female'
    EXCEPT
    SELECT DISTINCT pizzeria_name
    FROM people
    WHERE gender = 'male'
)
, male_only AS (
    SELECT DISTINCT pizzeria_name
    FROM people
    WHERE gender = 'male'
    EXCEPT
    SELECT DISTINCT pizzeria_name
    FROM people
    WHERE gender = 'female'
)
SELECT pizzeria_name FROM female_only
UNION
SELECT pizzeria_name FROM male_only
ORDER BY pizzeria_name;

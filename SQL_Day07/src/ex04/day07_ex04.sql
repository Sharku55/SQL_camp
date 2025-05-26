SELECT pr.name, count(*) AS count_of_visits
FROM person_visits pv JOIN person pr ON pv.person_id = pr.id
GROUP BY 1
HAVING count(*) > 3

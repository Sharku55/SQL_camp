WITH cte AS (
	SELECT cte::date 
	FROM generate_series('2022-01-01', '2022-01-10',interval '1 day') AS cte )
	
SELECT cte::date AS missing_date
FROM (SELECT * FROM person_visits WHERE (person_id = 1 OR person_id = 2) ) AS pv
RIGHT JOIN cte ON pv.visit_date =cte
WHERE pv.id is null
ORDER BY missing_date

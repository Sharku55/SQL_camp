SELECT  DATE(gs.visit_date) AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs(visit_date)
LEFT JOIN person_visits ON DATE(gs.visit_date) = person_visits.visit_date
                       AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.person_id IS NULL
ORDER BY missing_date;

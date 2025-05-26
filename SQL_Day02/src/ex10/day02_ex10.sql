SELECT DISTINCT p1.name AS person_name1, p2.name AS person_name2 ,  p1.address AS common_address
FROM person p1 CROSS JOIN person p2
WHERE p1.address = p2.address and p1.id > p2.id
ORDER BY 1, 2, 3

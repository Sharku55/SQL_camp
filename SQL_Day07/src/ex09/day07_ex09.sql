SELECT address,
    round((max(age) - (min(age) / max(age::NUMERIC))), 2) AS formula,
    round(avg(age), 2) AS average,
    round((max(age) - (min(age) / max(age::NUMERIC))), 2) > round(avg(age), 2) AS comparison
FROM person 
GROUP BY 1
ORDER BY 1;
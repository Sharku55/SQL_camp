WITH
	balance_summary AS
	(SELECT user_id, SUM(money) AS total_balance, type AS balance_type, currency_id
	FROM balance
	GROUP BY user_id, type, currency_id),

	latest_currency_rate AS
	(SELECT DISTINCT ON (id) id AS currency_id, name AS currency_name, rate_to_usd
	FROM currency
ORDER BY id, updated DESC)

SELECT 
    COALESCE(u.name, 'not defined') AS first_name,
    COALESCE(u.lastname, 'not defined') AS last_name,
    bs.balance_type,
    bs.total_balance,
    COALESCE(lcr.currency_name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS rate_to_usd,
    (bs.total_balance * COALESCE(lcr.rate_to_usd, 1)) AS total_balance_in_usd
FROM 
    "user" AS u
RIGHT JOIN 
    balance_summary AS bs ON u.id = bs.user_id
LEFT JOIN 
    latest_currency_rate AS lcr ON bs.currency_id = lcr.currency_id
ORDER BY 
    first_name DESC, last_name, bs.balance_type;


—select max value across 3 tables

SELECT date,consumption, 'asia' AS market
FROM interviews.asia_energy
WHERE consumption = (SELECT MAX(consumption) FROM interviews.asia_energy)
UNION
SELECT date,consumption,'na' AS market
FROM interviews.na_energy
WHERE consumption = (SELECT MAX(consumption) FROM interviews.na_energy)
UNION
SELECT date,consumption, 'eu' AS market
FROM interviews.eu_energy
WHERE consumption = (SELECT MAX(consumption) FROM interviews.eu_energy)

ORDER BY consumption DESC

—sum by date across multiple tables


SELECT date,SUM(consumption)
FROM
(SELECT date,consumption
FROM interviews.asia_energy

UNION
SELECT date,consumption
FROM interviews.na_energy

UNION
SELECT date,consumption
FROM interviews.eu_energy) as d

GROUP BY date
ORDER BY date

—Book solution for above, note ‘with’
with joined AS (
(SELECT * FROM interviews.eu_energy)
UNION ALL
(SELECT * FROM interviews.asia_energy)
UNION ALL
(SELECT * FROM interviews.na_energy)
)
, total_consumption AS (
SELECT date,sum(consumption) as total_consumption
FROM joined
GROUP BY 1
)

SELECT date, total_consumption
FROM total_consumption
WHERE total_consumption = (SELECT max(total_consumption) from total_consumption)

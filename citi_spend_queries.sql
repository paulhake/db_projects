SELECT EXTRACT(YEAR_MONTH FROM STR_TO_DATE(Date, '%m/%d/%y')) AS ym, Status,ROUND(SUM(Debit)) AS Spend
FROM lessons.citti_trans
-- WHERE Status = 'Dining'
GROUP BY 1,2
ORDER BY 2,1

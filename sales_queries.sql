--ratio of mens to womens sales by year 
SELECT sales_year, mens_sales / womens_sales AS ratio

FROM

(SELECT EXTRACT(YEAR FROM sales_month) AS sales_year,
SUM(CASE WHEN kind_of_business = 'Men''s clothing stores' THEN sales END) AS mens_sales,
SUM(CASE WHEN kind_of_business = 'Women''s clothing stores' THEN sales END) AS womens_sales
FROM lessons.us_retail_sales

WHERE kind_of_business in ('Men''s clothing stores'
     ,'Women''s clothing stores')

GROUP BY 1) a

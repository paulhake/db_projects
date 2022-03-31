Time Series: ratio of womens to mens sales:note ratio calc and subQ to make code look cleaner

#extract year from datetime column formated as text not date using STR_TO_DATE
SELECT EXTRACT(YEAR from STR_TO_DATE(sales_month, '%Y-%m-%d')) AS year,SUM(sales)

-- EXTRACT(YEAR_MONTH FROM STR_TO_DATE(Date, '%m/%d/%y'))

FROM lessons.us_retail_sales
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY 1;
-- SELECT * FROM lessons.us_retail_sales

#get column data types from table
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'citti_trans'


SELECT sales_year
,(womens_sales / mens_sales - 1) * 100 as womens_pct_of_mens
FROM
(
    SELECT date_part('year',sales_month) as sales_year
    ,sum(case when kind_of_business = 'Women''s clothing stores'
              then sales
              end) as womens_sales
    ,sum(case when kind_of_business = 'Men''s clothing stores'
              then sales
              end) as mens_sales
    FROM retail_sales
    WHERE kind_of_business in ('Men''s clothing stores'
     ,'Women''s clothing stores')
    and sales_month <= '2019-12-01'
    GROUP BY 1
) a
;


Dates - current timestamp by timezone: SELECT now() at time zone 'gmt'
Truncate dates to year: SELECT date_trunc('year',now())
Extract parts: SELECT date_part('year',now())
Extract as float: SELECT extract('day' from now())
Intervals - in years, months, days: SELECT age(now(),date('1998-11-01'))

Cast - convert $4 to numeric:
cast(replace('$19.99','$','')) as float

#one hot
Use Max to behave like one hot encoding with multiple	rows (max picks any )
SELECT customer_id
,max(case when fruit = 'apple' then 1
          else 0
          end) as bought_apples
,max(case when fruit = 'orange' then 1
          else 0
          end) as bought_oranges
FROM ...
GROUP BY 1
;

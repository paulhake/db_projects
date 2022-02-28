-- create the table	
	DROP table if exists retail_sales;
	CREATE table retail_sales
	(
	sales_month date
	,naics_code varchar
	,kind_of_business varchar
	,reason_for_null varchar
	,sales decimal
	)
	;

COPY retail_sales 
FROM '/users/paulhake/Desktop/us_retail_sales.csv' -- change to the location you saved the csv file
DELIMITER ','
CSV HEADER
;
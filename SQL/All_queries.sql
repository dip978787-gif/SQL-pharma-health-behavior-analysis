Query1
/*
CREATED BY: DIVYA PATIL
CREATE DATE: 18/6/2026
Description: Total supplement/Vitamin sales in countries in descending order of sales.
*/
SELECT
country,
SUM(units_sold) AS "Total Sales"
FROM
global_pharmacy_sales_2020_2025_daily_dataset AS dataset
WHERE
category LIKE '%Vitamin%'
GROUP BY country
ORDER BY
 units_sold DESC;


Query2
/*
CREATED BY: DIVYA PATIL
CREATE DATE: 18/6/2026
Description: Total supplement/Vitamin sales by country  age group in descending order of sales.
*/
SELECT
age_group,
SUM(units_sold) AS "Total Sales",
country
FROM
global_pharmacy_sales_2020_2025_daily_dataset AS dataset
WHERE
category LIKE '%vitamin%'
GROUP BY
country,
age_group 
ORDER BY
 country,
 units_sold DESC;


Query3
/*
CREATED BY :Divya
CREATE Date:10/6/2025
Description: Amlodipine use by country and age groups
*/
SELECT
country,
age_group,
SUM(units_sold) AS "Total Sales"
FROM 
global_pharmacy_sales_2020_2025_daily_dataset AS [Pharma Sales]
WHERE region= 'South Asia' AND medicine= 'Amlodipine'
GROUP BY
 country, age_group
ORDER BY
 SUM(units_sold) DESC


Query4
/*
CREATED BY :Divya
CREATE Date:10/6/2025
Description:Amlodipine use by country and age groups
*/
SELECT
country,
age_group,
SUM(units_sold) AS "Total Sales"
FROM 
global_pharmacy_sales_2020_2025_daily_dataset AS [Pharma Sales]
WHERE  medicine= 'Metformin'
GROUP BY
 country, age_group
ORDER BY
 SUM(units_sold),
 country DESC

Query5
/*
CREATED BY: Divya
Create Date: 20/06/2026
Description: Antibiotic sales trend over time(months/years)
*/
SELECT
strftime('%Y-%m',date) AS Duration,
SUM(units_sold) AS total_units,
covid_flag
FROM
global_pharmacy_sales_2020_2025_daily_dataset
WHERE
category= 'Antibiotic'
GROUP BY
month,
year
ORDER BY
year;


Query6
/*
CREATED BY: Divya
Create Date: 20/06/2026
Description: Agewise antibiotics consumption.
*/
SELECT
country,
age_group,
SUM(units_sold) AS "Total Units"
FROM
global_pharmacy_sales_2020_2025_daily_dataset
WHERE 
category= 'Antibiotic'
GROUP BY
"age_group",
year
ORDER BY
age_group,
country DESC;

Query7
/*
CREATED BY: Divya
Create Date: 20/06/2026
Description: Antibiotic overuse indicator.
*/
SELECT
country,
SUM(CASE WHEN category = 'Antibiotic' THEN units_sold ELSE 0 END) AS "Antibiotic units",
SUM(units_sold) AS [Total Units],
ROUND(SUM(CASE WHEN category = 'Antibiotic' THEN units_sold ELSE 0 END) * 100.0 /SUM(units_sold),2) AS  [Percent Antibiotic/Total units] 
FROM
global_pharmacy_sales_2020_2025_daily_dataset
GROUP BY
country
ORDER BY
[Percent Antibiotic/Total units] DESC;


Query8
/*
CREATED BY: Divya
Create Date: 20/06/2026
Description: Country wise Preventive(vitamin usage) to reactive(chronic medicine use) .
*/
SELECT
country,
SUM(CASE WHEN category = 'Vitamin' THEN units_sold ELSE 0 END) AS "Vitamin units",
SUM(CASE WHEN category= 'Chronic' THEN units_sold ELSE 0 END) AS "Chronic Units",
ROUND(SUM(CASE WHEN category = 'Vitamin' THEN units_sold ELSE 0 END) * 1.0 /
SUM(CASE WHEN category= 'Chronic' THEN units_sold ELSE 0 END),2) AS " Preventive to reactive ratio"
FROM
global_pharmacy_sales_2020_2025_daily_dataset
GROUP BY
country
ORDER BY
"Preventive to reactive ratio" DESC;

# SQL-pharma-health-behavior-analysis
SQL and Excel analysis of global pharmaceutical sales data- exploring antibiotic reliance, preventive vs reactive behavior, and regional consumption patterns.

#SUMMARY
```sql
Description: Total supplement/Vitamin sales in countries in descending order of sales
SELECT
country,
SUM(units_sold) AS "Total Sales"
FROM
global_pharmacy_sales_2020_2025_daily_dataset 
WHERE
category LIKE '%Vitamin%'
GROUP BY
 country
ORDER BY
units_sold DESC
```
```sql
Description: Amlodipine use by country and age groups
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
```

# Global Pharmaceutical Sales Analysis

## Overview
This project analyses a dataset simulating realistic global pharmaceutical sales patterns using SQL and Excel. As a B.Pharmacy graduate transitioning into data analytics, this project combines domain knowledge with technical analysis to explore consumption trends, health behavior patterns, and regional differences across 18+ countries.

## Key Questions Explored
- How does antibiotic consumption trend changed over time, and what might this suggest about overuse/AMR risk?
- Which countries show more "preventive" (vitamin-based) vs "reactive" (chronic disease medication) health spending?
- How does age group influence consumption of specific drugs like Amlodipine (hypertension) and Metformin (diabetes/PCOS)?

## Key Findings
- Antibiotic sales peaked in 2021, likely linked to COVID-era self-medication behavior.
- A custom-built "Preventive-to-Reactive Ratio" revealed that countries like Bangladesh and Germany showed higher preventive health spending relative to chronic disease treatment, while the USA and UK ranked lower — a counterintuitive finding given typical assumptions about Western supplement culture.
- Metformin usage in younger age groups may reflect PCOS treatment rather than early-onset diabetes alone — an important clinical nuance often overlooked in general sales data analysis.

## Tools Used
- SQL (SQLite) — conditional aggregation, GROUP BY, ratio calculations, trend analysis
- Excel — pivot tables, charts, data visualization

## Files in this Repository
- `pharma_queries.sql` — all SQL queries used in this analysis
- `pharma_analysis.xlsx` — Excel workbook with results and visualizations

## Note on Data
This dataset is designed to simulate realistic pharmaceutical sales patterns rather than reflect actual real-world company data. Findings should be interpreted as a demonstration of analytical methodology.

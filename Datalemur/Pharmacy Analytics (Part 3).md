### Pharmacy Analytics (Part 3)


CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.

Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.

Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".op.

### Solution Query

```sql
WITH drug_sales AS (
  SELECT 
    manufacturer, 
    SUM(total_sales) as sales 
  FROM pharmacy_sales 
  GROUP BY manufacturer
) 

SELECT 
  manufacturer, 
  ('$' || ROUND(sales / 1000000) || ' million') AS sales_mil 
FROM drug_sales 
ORDER BY sales DESC, manufacturer;```



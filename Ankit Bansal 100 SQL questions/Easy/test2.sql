### Problem Statement Namastesql(ANKIT BANSAL) 

Question-  2 Product Category

You are provided with a table named Products containing information about various products, including their names and prices. 

##Write a SQL query to count number of products in each category based on its price into three categories below. Display the output in descending order of no of products.##

 

1- "Low Price" for products with a price less than 100
2- "Medium Price" for products with a price between 100 and 500 (inclusive)
3- "High Price" for products with a price greater than 500.


### Solution Query

```sql
WITH cte AS (
  SELECT 
    product_id, product_name, price,
    CASE
      WHEN price < 100 THEN 'Low Price'
      WHEN price BETWEEN 100 AND 500 THEN 'Medium Price'
      ELSE 'High Price'
    END AS category
  FROM products
)
SELECT 
  category, 
  COUNT(*) AS no_products 
FROM cte
GROUP BY category
ORDER BY no_products DESC;
```
### 95 - Electronics Items Sale

You have a table called electronic_items. Write an SQL query to find the average price of electronic items in each category, considering only categories where the average price exceeds 500 and at least 20 total quantity of items is available. Additionally, only include items with a warranty period of 12 months or more. Return the category name along with the average price of items in that category. Order the result by average price (round to 2 decimal places) in descending order. 



### Solution

```sql
select 
	category, 
	round(avg(price),2) AS average_price 
from electronic_items
	where quantity >=20 and warranty_months>=12
group by category
	having round(avg(price),2)>500
order by average_price  desc;
```


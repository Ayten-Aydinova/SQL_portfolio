###  Pharmacy Analytics (Part 1)


CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

Definition:

cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
Total Profit = Total Sales - Cost of Goods Sold

### Solution Query

```sql
SELECT 
	DRUG,
		TOTAL_SALES-COGS AS COST
FROM pharmacy_sales
	ORDER BY COST DESC
		LIMIT 3;
```



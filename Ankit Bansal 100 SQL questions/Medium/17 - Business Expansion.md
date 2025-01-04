###  17 - Business Expansion

Amazon is expanding their pharmacy business to new cities every year. You are given a table of business operations where you have information about cities where Amazon is doing operations along with the business date information.

Write a SQL to find year wise number of new cities added to the business, display the output in increasing order of year.


### Solution Query

```sql
with cte as (
	select 
		city_id,
		min(YEAR(business_date)) as firstyear
 	from business_operations 
 	group by city_id
)

select 
	firstyear,
	count(*) as nonew_cities
from cte
	group by firstyear
	ORDER BY firstyear ASC;```


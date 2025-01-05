### 36 - Airbnb Business


You are planning to list a property on Airbnb. To maximize profits, you need to analyze the Airbnb data for the month of January 2023 to determine the best room type for each location. The best room type is based on the maximum average occupancy during the given month.

Write an SQL query to find the best room type for each location based on the average occupancy days. Order the results in descending order of average occupancy days, rounded to 2 decimal places.

```sql
with 
	cte1 as(
      select 
          listing_id,
          sum(checkout_date -checkin_date) book_days 
      from bookings
              group by listing_id),
	cte2 as(
		select l
      		isting_id,
      		location,room_type 
      from listings),
	cte3 as (
		select 							
      		cte2.location,
      		cte2.room_type,
      		round(avg(cte1.book_days),2)avg_book_days
	from cte1 
		join cte2  on cte1.listing_id=cte2.listing_id
			group by cte2.location,cte2.room_type)

select 
	location,
    room_type,
    avg_book_days from (
		select 
      		location,
      		room_type,
      		avg_book_days,
			row_number() Over(partition 
                         by location order by avg_book_days desc) as rn
from cte3) as cte4
	where rn=1
	order by avg_book_days desc
```


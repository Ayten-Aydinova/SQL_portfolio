###  40 – Uber Driver Ratings

Suppose you are a data analyst working for ride-sharing platform Uber. Uber is interested in analyzing the performance of drivers based on their ratings and wants to categorize them into different performance tiers. 

Write an SQL query to categorize drivers equally into three performance tiers (Top, Middle, and Bottom) based on their average ratings. Drivers with the highest average ratings should be placed in the top tier, drivers with ratings below the top tier but above the bottom tier should be placed in the middle tier, and drivers with the lowest average ratings should be placed in the bottom tier. Sort the output in decreasing order of average rating.


```sql
with 
cte as (
 select 
    driver_id,
    avg_rating,
    NTILE(3) OVER (ORDER BY avg_rating DESC) as rn
	from driver_ratings )
select 
    driver_id,
    avg_rating,
      case when rn=1 then   "Top"
      when rn=2 then   "Middle"
      when rn=3 then  "Bottom"
		end as performance_tier 
from cte;
```


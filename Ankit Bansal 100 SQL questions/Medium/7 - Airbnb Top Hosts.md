### 7 - Airbnb Top Hosts





Suppose you are a data analyst working for a travel company that offers vacation rentals similar to Airbnb. Your company wants to identify the top hosts with the highest average ratings for their listings. This information will be used to recognize exceptional hosts and potentially offer them incentives to continue providing outstanding service.

 

Your task is to write an SQL query to find the top 2 hosts with the highest average ratings for their listings. However, you should only consider hosts who have at least 2 listings, as hosts with fewer listings may not be representative.

Display output in descending order of average ratings and round the average ratings to 2 decimal places.
 
### Solution Query

```sql
with cte as
	(select 
     	host_id,
     	listing_id,
     	count(*) over(partition by host_id) as no_listings
 	from listings)
 
 select 
 	host_id,
    no_listings,
    round(avg(rating),2) avg_rating from 
 cte c 
 inner join reviews r on r.listing_id=c.listing_id
 	where no_listings>=2
 	group by host_id,no_listings
 		order by avg_rating desc
 		limit 2;
```


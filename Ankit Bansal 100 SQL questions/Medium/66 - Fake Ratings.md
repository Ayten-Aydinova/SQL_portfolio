###  66 - Fake Ratings


You are working for a marketing agency that manages multiple Instagram influencer accounts. Your task is to analyze the engagement performance of these influencers before and after they join your company.
Write an SQL query to calculate average engagement growth rate percent for each influencer after they joined your company compare to before. Round the growth rate to 2 decimal places and sort the output in decreasing order of growth rate.

Engagement = (# of likes + # of comments on each post)

### Solution Query

```sql
with 
cte as
(select 
 	product_id,
 	avg(rating) avg 
 from product_ratings
	group by product_id),

cte2 as(
	select 
  		rating_id,
  		p.product_id,
  		user_id,rating,
  		avg,
		ABS(rating-avg) as dif,
		row_number()over( partition by p.product_id order by ABS(rating-avg) desc) rn
	from product_ratings p
		join cte c on
		p.product_id=c.product_id)

select 
	rating_id,
    product_id,
    user_id,
    rating 
from cte2
	where rn=1
		order by rating_id ;
```


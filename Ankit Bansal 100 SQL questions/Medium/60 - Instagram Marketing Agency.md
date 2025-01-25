###  60 - Instagram Marketing Agency


You are working for a marketing agency that manages multiple Instagram influencer accounts. Your task is to analyze the engagement performance of these influencers before and after they join your company.
Write an SQL query to calculate average engagement growth rate percent for each influencer after they joined your company compare to before. Round the growth rate to 2 decimal places and sort the output in decreasing order of growth rate.

Engagement = (# of likes + # of comments on each post)

### Solution Query

```sql
with cte as(
	select 
  		username,
		avg(case when p.post_date<i.join_date then   comments+likes 		end)as
		before_engagement,
		avg(case when p.post_date>i.join_date then   comments+likes e			nd)as
		after_engagement
	from influencers i
		join posts p 
		on i.influencer_id=p.influencer_id
			group by username)

select 
	*,
    round((after_engagement-before_engagement)*100/before_engagement,2)  growth 
from cte ;
```


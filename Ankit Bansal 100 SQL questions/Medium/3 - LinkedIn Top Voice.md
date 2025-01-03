###  3 - LinkedIn Top Voice



LinkedIn is a professional social networking app. They want to give top voice badge to their best creators to encourage them to create more quality content. A creator qualifies for the badge if he/she satisfies following criteria.

 

1- Creator should have more than 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.

 

Write a SQL to get the list of top voice creators name along with no of posts and impressions by them in the month of Dec-2023.

 
### Solution Query

```sql
select 
	creator_name,
    count(post_id) post,
    sum(impressions) impressions
from creators c
left join posts p on   p.creator_id=c.creator_id
	where followers >50000 and 
	DATE_FORMAT(publish_date , '%Y-%m')='2023-12' 
group by creator_name
	having count(post_id)>=3  and sum(impressions)>100000 ;
```


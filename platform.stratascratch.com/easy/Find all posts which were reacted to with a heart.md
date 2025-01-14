### Find all posts which were reacted to with a heart



Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.


### Solution Query




```sql
SELECT  
    distinct post.post_id, 
    post.poster, 
    post.post_text, 
    post.post_keywords, 
    post.post_date 
FROM facebook_reactions react 
    JOIN facebook_posts post ON react.post_id = post.post_id 
        WHERE reaction = 'heart';;
```


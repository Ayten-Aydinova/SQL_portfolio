###  Page With No Likes
Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

### Solution Query

```
select 
  p.page_id
from pages p 
  left join page_likes  Pl 
    on p.page_id=pl.page_id
      where liked_date is null
        order by p.page_id asc
;
```



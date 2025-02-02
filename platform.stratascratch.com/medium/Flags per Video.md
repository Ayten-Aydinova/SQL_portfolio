###  Flags per Video







For each video, find how many unique users flagged it. A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.


### Solution Query

```sql
select 
    video_id,
    count(distinct concat(USER_FIRSTNAMe,USER_LASTNAME))
from user_flags
    where flag_id is not null
    group by video_id ;
```


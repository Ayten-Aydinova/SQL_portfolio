###  Share of Active Users




Output share of US users that are active. Active users are the ones with an "open" status in the table.

### Solution Query

```sql
select
    sum(case when status='open' then 1 end )/count(*) as  open 
from fb_active_users
    where country='USA' ;
```


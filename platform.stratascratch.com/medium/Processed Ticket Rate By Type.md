### Processed Ticket Rate By Type










Find the processed rate of tickets for each type. The processed rate is defined as the number of processed tickets divided by the total number of tickets for that type. Round this result to two decimal places.

### Solution Query

```sql
select 
type,
SUM(case when processed = 1 then 1 else 0 end) / count(*)
from facebook_complaints
group by type;
```


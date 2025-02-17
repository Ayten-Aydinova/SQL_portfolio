###App Click-through Rate (CTR)


This is the same question as problem #1 in the SQL Chapter of Ace the Data Science Interview!

Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:

Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.

### Solution Query

```sql
SELECT app_id,
ROUND((100.0*  SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END)/
SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) 
    ),2) AS ctr
FROM events
WHERE EXTRACT(YEAR from timestamp) = '2022'
GROUP BY app_id;
```



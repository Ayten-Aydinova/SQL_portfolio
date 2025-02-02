### Find students with a median writing score










Identify the IDs of students who scored exactly at the median for the SAT writing section.




### Solution Query

```sql
SELECT 
	student_id
FROM sat_scores
	WHERE sat_writing =
    		(SELECT percentile_cont(0.5) WITHIN GROUP (
                                               ORDER BY sat_writing)
     FROM sat_scores) ;
```


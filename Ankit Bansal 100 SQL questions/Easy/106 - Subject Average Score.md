### 106 - Subject Average Score


Write an SQL query to find the course names where the average score of students who scored less than 70 in at least one course is greater than 70. Sort the result by average score in descending order.

### Solution

```sql
select 
	course_name,
	avg(score) 
from students
	where student_id in 
		(select student_id 
			from students
			where score<70)
group by course_name
having avg(score)>70
order by avg(score) desc
;
```


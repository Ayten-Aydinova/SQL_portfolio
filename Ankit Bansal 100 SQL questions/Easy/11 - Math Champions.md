###  Math Champions 11

You are provided with two tables: Students and Grades. Write a SQL query to find students who have higher grade in Math than the average grades of all the students together in Math. Display student name and grade in Math order by grades.Tables: Books




### Solution Query

```sql


select 
	student_name,grade from 
	students s
 		join grades g on s.student_id=g.student_id
		where subject='Math' and grade >(select avg(grade) from grades where subject='Math')
order by grade;


```


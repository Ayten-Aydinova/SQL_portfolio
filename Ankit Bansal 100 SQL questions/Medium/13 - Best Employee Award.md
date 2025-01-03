###  13 - Best Employee Award


TCS wants to award employees based on number of projects completed by each individual each month.  Write an SQL to find best employee for each month along with number of projects completed by him/her in that month, display the output in descending order of number of completed projects.


### Solution Query

```sql
WITH CTE1 AS
	(select 
	employee_name,
	DATE_FORMAT(project_completion_date ,'%Y%m') AS yearmonth ,
	COUNT(PROJECT_ID) AS NO_PROJECT
	from projects
		WHERE DATE_FORMAT(project_completion_date ,'%Y%m')  IS NOT NULL
		GROUP BY employee_name,
		DATE_FORMAT(project_completion_date ,'%Y%m'))
					

SELECT 
		EMPLOYEE_NAME,
		NO_PROJECT,
		yearmonth
FROM
	(SELECT  EMPLOYEE_NAME,NO_PROJECT,yearmonth,ROW_NUMBER()
	OVER(PARTITION BY yearmonth ORDER BY NO_PROJECT DESC) AS RN FROM CTE1) T
		WHERE RN=1
		ORDER BY NO_PROJECT DESC;
```


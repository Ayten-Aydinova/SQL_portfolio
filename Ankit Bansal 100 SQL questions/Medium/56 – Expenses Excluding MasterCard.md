### 56 – Expenses Excluding MasterCard



You're working for a financial analytics company that specializes in analyzing credit card expenditures. You have a dataset containing information about users' credit card expenditures across different card companies.
Write an SQL query to find the total expenditure from other cards (excluding Mastercard) for users who hold Mastercard.  Display only the users(along with Mastercard expense and other expense) for which expense from other cards together is more than Mastercard expense.

### Solution Query




```sql
with cte1 as(
select 
  	user_name,
  	sum(expenditure) mastercard_expense 
from expenditures
	where card_company='Mastercard'
	group by user_name),
cte2 as(
select 
  	user_name,
  	sum(expenditure) other_expense 
from expenditures
	where  card_company!='Mastercard'
	group by user_name)

select 
	cte1.user_name,
    mastercard_expense,
    other_expense
from cte1
join cte2 on 
	cte1.user_name=cte2.user_name
		where other_expense>mastercard_expense;
```


### 52 - Loan Repayment


You're working for a large financial institution that provides various types of loans to customers. Your task is to analyze loan repayment data to assess credit risk and improve risk management strategies.

Write an SQL to create 2 flags for each loan as per below rules. Display loan id, loan amount , due date and the 2 flags.

 

1- fully_paid_flag: 1 if the loan was fully repaid irrespective of payment date else it should be 0.
2- on_time_flag : 1 if the loan was fully repaid on or before due date else 0.


### Solution Query




```sql
select 
	l.loan_id,
	l.loan_amount,
	l.due_date,
	case when sum(p.amount_paid)= l.loan_amount then 1 else 0 end as fully_paid_flag,
	case when sum(case when p.payment_date<=l.due_date then p.amount_paid end)=l.loan_amount then 1 else 0 end as on_time_flag
from loans l 
left join payments p on l.loan_id=p.loan_id
	group by l.loan_id,l.loan_amount,l.due_date
	ORDER BY l.loan_id; ;
```


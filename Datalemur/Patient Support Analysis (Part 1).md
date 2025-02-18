###Patient Support Analysis (Part 1)


UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) to call an advocate and receive support for their health care needs – whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.

Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.

### Solution Query

```sql
with cte AS(
SELECT policy_holder_id,count(case_id) call FROM callers
group by policy_holder_id
having count(case_id)>=3)

select count(policy_holder_id) from cte ;```



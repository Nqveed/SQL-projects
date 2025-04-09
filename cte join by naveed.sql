
with mct as ( select * from  employees) 
select emp_no from mct


with my_cte as 
 (select *, AVG (amount) OVER (order 
 BY p.customer_id) as 
"Average_price", count(address_id) OVER
(ORDER BY c.customer_id) as "count"
From payment as p
inner join customer as c 
on p.customer_id = c.customer_id

)
select frist_name,last_name,amount
from my_cte













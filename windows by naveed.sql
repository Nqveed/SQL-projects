select * from employees
select * from (select e.*,row_number()  over(partition by dept order by salary desc) rn
from employees e) r where r.rn<3
select e.*,row_number() over(partition by dept order by salary desc) rn,
rank() over(partition by dept order by salary desc) rnk ,
dense_rank() over(partition by dept order by salary desc ) dense_rnk
from employees e
select e.*,lag(salary) over(partition by dept order by emp_id)
prev_emp_salary, lead(salary)  over (partition by dept order by
emp_id) next_emp_salary
from employees e
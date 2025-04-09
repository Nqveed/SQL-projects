
-- select dept_name,max (salary) as max_salary from employees
-- group by dept_name;
-- select e.*, max (salary) over(partition by dept_name)as max_salary from employees e;
-- select * from employees
select e.*, row_number() over(partition by dept order by salary desc) rn 
from employees e
 select * from (select e.*,row_number()over(partition by dept order by emp_id)
 as rn from employees e) x
 where x.rn < 3;
-- select * from (select e.*, rank() over(partition by dept_name order by salary desc)as rnk from employees e) x 
-- where x.rnk < 4;
 select e.*, rank() over(partition by dept order by salary desc)as rnk,
dense_rank() over(partition by dept order by salary desc) as Dense_rnk from employees e;
select e.*,lag(salary) over(partition by dept order by emp_id) as prev_emp_salary, 
lead(salary) over(partition by dept order by emp_id) as next_emp_salary from employees e ;
-- select e.*,lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
-- case when e.salary > lag(salary) over (partition by dept_name order by emp_id) then 'Higher privious employees'
-- when e.salary < lag(salary) over (partition by dept_name order by emp_id) then 'lower than privious employees'
-- when e.salary = lag(salary) over (partition by dept_name order by emp_id) then 'same as than privious employees'
-- end sal_range from employees e ;
-- -- lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary from employees e ;

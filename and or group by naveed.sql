select * from employees where department='HR' or department='Marketing'
select emp_no,first_name,salary from employees where emp_no>1010 and salary>40000
select * from employees where gender ='F' and not department='IT'
select  emp_no,department,salary,joining_date from employees
where joining_date >'2020-04-01' or salary < 33000
select * from employees where gender='M' and (department='Business Development'
or department='Marketing' or department ='Finance')
select  emp_no,first_name,birth_date from employees where emp_no <1020
and birth_date<'1999-03-09'
select * from employees where first_name='David'or first_name='Mary'
and not last_name='Gill'
select gender ,sum(salary) from employees group by gender
select department,avg(salary) avg_salary from employees
group by department order by avg_salary desc
select department,min(salary) min_salary from employees where department
is not null group by department
select department,avg(salary) avg_salary,max(salary) max_salary from
employees group by department order by max_salary desc
select department,count(*) total_employees from employees
group by department order by total_employees desc

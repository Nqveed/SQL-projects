select * from employees where gender='M'and department='IT' and salary>=41365
select count(*) total_male from employees where gender='M'
and department='HR'and 
select * from employees where first_name like 'M%'
select * from employees where last_name like '%l'
select * from employees where first_name like '__l%'
select * from employees where first_name like '___l%'

select emp_no,salary Null_salary from employees where salary is null 
select  count(*)  total from employees  where salary 
is  null and department='IT' 
select  distinct salary,first_name,department from employees where salary
is not null order by salary desc limit 2
select department,max(salary ) max_salary from employees
where department is not null 
group by department order by max_salary desc 

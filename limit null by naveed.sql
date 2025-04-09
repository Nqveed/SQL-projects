select * from employees limit 10
select * from employees limit 10 offset 10
select emp_no,first_name,last_name,joining_date from employees
order by joining_date desc limit 6
select * from employees order by birth_date desc limit 4
select * from employees where gender ='M' order by birth_date  limit 4
select * from employees where salary is not null order by salary desc
limit 5
select * from employees where salary is not null and department='IT'
order by salary desc limit 6
select * from employees where first_name like 'J%' order by first_name limit 3
select * from employees where emp_no>1020 and salary is null
select * from employees where last_name is null
select emp_no,first_name ,salary,department from employees
where department  is not null
select emp_no,first_name,salary,coalesce( salary*12,0) 
as Annual_salary from employees;
select * from employees where gender='F' and department is null

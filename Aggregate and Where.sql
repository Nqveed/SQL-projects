select * from employees
select count (*) tatal_male from employees where gender='M'
select count(8) from employees where first_name like 'J%'
select sum(salary) from employees where emp_no between 1010 and 1020
select (salary*12) Annual_salary from employees where department='HR'
select avg (salary) avg_salary from employees
select avg(salary) IT_Avg_salary from employees where department='IT'
select min(joining_date) min_joining_date from employees 
select min(salary) min_salary from employees where department='Finance'
select max (birth_date) max_Dob from employees
select min (birth_date) max_Dob from employees
select max (emp_No) from employees
select * from employees where joining_date >'2022-03-20'
select emp_No,first_name,last_name from employees where department='Finance'
select emp_No ,salary from employees where salary < 35000
select * from employees where birth_date='1998-01-24'
select emp_No,first_name from employees where department !='IT'
select * from employees where emp_no=1010
select distinct first_name from employees where gender ='M'
select emp_No,first_name salary,salary+10000  as Fanal_salary from employees where salary<25000
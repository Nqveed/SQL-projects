select * from employees where mod(emp_no,2)=0
select * from employees where sqrt(emp_no)= floor(sqrt( emp_no))
select department ,ceil (avg(salary)) avg_salary from employees
group by department
select first_name,salary-5000 new_salary  from employees where
salary-5000=abs(salary-5000)
select power (55,3) as power
select least (200,23,0,987.5,32,-1) least_number
select greatest (200,23,0,987.5,32,-1) highest_number
select * from employees where length(first_name)>=8
select emp_no,first_name ,concat(first_name,' ',last_name,'@demo.com') 
email from employees where  emp_no <=1010
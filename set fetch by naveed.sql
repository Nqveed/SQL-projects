select * from product_jan
select * from product_feb
select * from product_jan where quantity > 5
union
select *  from product_feb where quantity >5

select * from product_jan
intersect
select * from product_feb 
select  prod_name,quantity,price,quantity*price total from product_jan
intersect
select  prod_name,quantity,price,quantity*price total from product_feb
select * from product_jan where price > 30
except
select * from product_feb
select 'january' as mouth, sum(price*quantity) total_sales from product_jan
union
select 'february' as mouth, sum(price*quantity) total_sales from product_feb
select *  from product_jan where price between 10 and 50
union
select *  from product_feb where price between 10 and 50
select * from employees fetch first 10 row only
select emp_no,first_name,last_name,joining_date from employees
order by joining_date desc fetch first 7 row only
select * from employees order by birth_date desc fetch  first 3 rows only
select * from employees where gender ='M' order by birth_date fetch first 12 rows only
select   emp_no,first_name,salary from employees where salary is not null
order by salary desc fetch first 4 rows only
select * from employees where salary is not null order by salary 
fetch first 5 rows only
select * from employees where first_name like 'J%' order by first_name 
fetch first 5 rows only 

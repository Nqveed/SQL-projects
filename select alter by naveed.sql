select * from employees1
select distinct salary from employees1
select name,dob from employees1
select id,name,salary*12 Annual_salary from employees1
select distinct salary ,department from employees1 
where salary is not null order by salary desc
select id,concat(name,'(',salary,')') emp_details from employees1
select * from products
alter table products add description varchar(255)
alter  table products rename prod_id to product_id
alter  table products alter prod_name varchar(30)
alter  table products modify  price decimal(8,1) deafult(20)
alter  table products rename  to product_details
select * from products1
update products1 set price=price*1.1
update products1 set price =5.99 where quantity<10
update products1 set price = price*2 where quantity between 15 and 50
update products1 set prod_name ='Barbie Doll' , price =6.99 where prod_id='RGAN01'
update products1 set price =price*1.05 where prod_name like '%toy%'
update products1 set prod_name=concat('Sale:', prod_name)
update products1 set quantity=quantity-1 where quantity >10
update products1 set quantity= Null where price > 9
delete  from products1 where quantity=7
delete from products1 where price < 6.92
delete from products1 where prod_name ='sale:King doll'
delete from products1 where price = 11.48
delete from products1 where quantity = null
truncate products1
drop  table products1
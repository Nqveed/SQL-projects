 select * from product_info
 select * from customer_data
 select * from order_details
 create or replace view   order_summary
 as
 select o.ord_id,o.date,p.prod_name,c.cust_name
 ,(p.price*o.quantity)-((p.price*o.quantity)* disc_percent :: 
 float/100) as cost from customer_data c
 join order_details o on o.custid = c.custid
 join product_info p on p.prodid = o.prodid;
select* from order_summary
 alter view order_summary rename column date to order_date
 create  or replace view expensive_products
 as select * from product_info where price > 1000
 select * from expensive_products
 alter table product_info add column prod_config varchar(100)
 insert into  product_info
 values('P10','test','test',1200,null)
 update expensive_products
 set prod_name='AirPods Pro',brand='Apple'
 where prodid='P10'
 update order_summary
 set cost =10
 where = 1

 create  or replace view expensive_products
 as select distinct* from product_info where price > 1000
 select * from expensive_products
 update expensive_products
 set prod_name='AirPods Pro 2',brand='Apple'
 where prodid='P10'

 create view order_count as
 select date,count(1) as no_of_order
 from order_details
 group by date
 select * from order_count
 update order_count
 set no_of_order=0
 where date ='2020-06-01'

 view can not have with cluse and window cluse
 create or replace view Apple_products as
 select * from product_info where brand = 'Apple'
 with check option;
 insert into Apple_products
 values('P22','Macbook air','Apple',2500,null)
 values('P20','Note 29','Samsung',2500,null)
 values('P20','Note 29','Samsung',2500,null)
 select * from Apple_products
 
 
 
 
 
 
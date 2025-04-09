create table cars
("model_id" int,
"model_name" varchar(100),
"color" varchar(100),
"brand" varchar (100)
)
select * from cars

insert into cars
values(1,'leaf','black','Nissan'),
(2,'leaf','black','Nissan'),
(3,'ModelS','black','Tesla'),
(4,'Model X','White','Tesla'),
(5,'Ioniq 5','black','Hyundai'),
(6,'Ioniq 5','black','Hyundai'),
(7,'Ioniq 6','White','Hyundai')
update cars
set model_name='Ioniq 6'
where model_id=7
delete from cars
where model_id not in ( select min(model_id)
from cars
group by model_name,brand)
drop table cars
delete from cars
where model_id in (select max(model_id) from cars 
 group by model_id ,brand having count(1)>1)
 delete from cars
where model_id in (select model_id
from( select * ,row_number() over (partition by model_name,
 brand order by model_id) rn from cars) x where x.rn>1)
 create table car_travels
 (
cars varchar(40),
days varchar(10),
distance_traveled int
 )
 alter table car_travels add column cumulative_distace int
insert into car_travels
values('car1','day1',50,50),
('car1','day2',100,50),
('car1','day3',200,100),
('car2','day1',0,0),
('car3','day1',0,0),
('car3','day2',50,50),
('car3','day3',50,0),
('car3','day4',100,50)
create table src_dest_distance
(
source varchar(20),
destination varchar(20),
distance  int 
)
insert into src_dest_distance
values('Banglore','Hyderbad',400),

('Hyderbad','Banglore',400),
('Mumbai','Delhi',400),
('Delhi','Mumbai',400),
('Chennai','Pune',400),
('Pune','Chennai',400)
with cte as (select *,row_number() over() rn from src_dest_distance )
select t1.source,t1.destination,t1.distance from  cte t1 join cte t2
on t1.rn < t2.rn and t1.source=t2.destination and t1.destination=t2.source
select * from src_dest_distance

create table travel_items(id int, item_name varchar, total_count int)
insert into  travel_items values(1,'water_bottle',2),(2,'tent',1),(3,'apple',4)
select * from travel_items
with recursive cte as (select id,item_name,total_count,1 as level 
from travel_items
union
select cte.id,cte.item_name,cte.total_count-1,level+1 as level from cte
join travel_items t on t.item_name=cte.item_name and t.id=cte.id
where cte.total_count >1)
select id,item_name,level from cte
select * from travel_items

create table teams (team_code varchar, team_name varchar)
insert into  teams values('RCB','Royal Challengers Bonglore'),
('MI','Mumbai Indians'),('CKR','Channai Super Kings'),
('DC','Delhi Capitals'),('RR','Rajasthan Royals'),
('SRH','Sunrisers Hyderbad'),('PBKS','Punjab Kings'),
('KKR','Kolkata Knights Riders'),('GT','Gujarat Titans'),
('LSG','Lucknow Super Giants')
select * from teams

with matches as (select row_number() over(order by team_name) 
as id,t.* from teams t)
select team.team_name as team , opponent.team_name as opponent from matches team 
join matches opponent on team.id < opponent.id order by team

select test_id,marks from 
(select *,lag(marks,1,0) over(order by test_id) as
prev_test_marks from student_tests) x
where x.marks > x.prev_test_marks
select test_id,marks from 
(select *,lag(marks,1,0) over(order by test_id) as
prev_test_marks from student_tests) x
where x.marks > x.prev_test_marks
,
(1,'Data Engineer','SQL'),(2,null,'Python'),(3,null,'AWS'),(4,null,'Snowflake'),
(5,null,'Apache Spark'),(6,'Web Developer','Java'),(7,null,'HTML'),
(8,null,'CSS'),(9,'Data Scientist','Python'),(10,null,'Machine Learning'),
(11,null,'Deep learning'),(12,null,'Tableau')

select * from job_skills

with cte as(select *, sum(case when job_roll is null then 0
else 1 end) over(order by id)as segement from job_skills)
select id,first_value(job_roll) over(partition by segement order by id) as
job_roll ,skills from cte

with recursive cte as (select id,job_roll,skills from job_skills
where id=1
union 
select js.id,coalesce(js.job_roll,cte.job_roll) as job_roll,js.skills
from cte join job_skills js on js.id=cte.id+1)
select * from cte

create table Q4_data(id int, name varchar, location varchar)
insert into Q4_data  values(1,null,null),(2,'David',null),(3,null,'Lodon'),
(4,null,null),(5,'David',null)
select * from Q4_data
select min(id) id,min(name) name,min(location)location from Q4_data

create table day_indicator(product_id varchar, day_indicator varchar,dates date)
insert into day_indicator  values('AP755',1010101,'2024-03-04'),
('AP755',1010101,'2024-03-05'),('AP755',1010101,'2024-03-06'),
('AP755',1010101,'2024-03-07'),('AP755',1010101,'2024-03-08'),
('AP755',1010101,'2024-03-10'),('XQ802',1000110,'2024-03-04'),
('XQ802',1000110,'2024-03-05'),('XQ802',1000110,'2024-03-06'),
('XQ802',1000110,'2024-03-07'),('XQ802',1000110,'2024-03-08'),
('XQ802',1000110,'2024-03-09'),('XQ802',1000110,'2024-03-10')
select * from  day_indicator

select *, extract ('isodow' from dates) as dow,
substring ( day_indicator,1,1)  from day_indicator
where product_id='AP755'

select product_id,day_indicator,dates from
(select *, extract ('isodow' from dates) as dow,
case when substring ( day_indicator,extract ('isodow' from dates):: int,1)='1'
then 'include' else 'Exclude' end as flag
from day_indicator
where product_id='AP755') x
where flag ='include'

select product_id,day_indicator,dates from
(select *, extract ('isodow' from dates) as dow,
case when substring ( day_indicator,extract ('isodow' from dates):: int,1)='1'
then 'include' else 'Exclude' end as flag
from day_indicator
) x
where flag ='include'


create table student_tests(Test_id int, Marks int)
insert into  student_tests  values(100,55),(101,55),(102,60),(103,58),(104,40),
(105,50)

select * from student_tests

select test_id,marks from 
(select *,lag(marks,1,0) over(order by test_id) as
prev_test_marks from student_tests) x
where x.marks > x.prev_test_marks

select test_id,marks from 
(select *,lag(marks,1,marks) over(order by test_id) as
prev_test_marks from student_tests) x
where x.marks > x.prev_test_marks

create table emp_transaction (id int, emp_name varchar,trns_type varchar, 
amount numeric)
insert into deduction  values(1,'Insurance',5),(2,'Health',6),(3,'House',4)
(1,'Rohan',5000)
select * from   salary 
select * from   income
select * from   deduction
select * from emp_transaction  
insert into emp_transaction
select id,emp_name,trns_type,
case when trns_type='Allowace' then round (base_salary*(percentage/100),2)
     when trns_type='Basic' then round(base_salary*(percentage/100),2) 
	 when trns_type='Others' then round(base_salary*(percentage/100),2)
	 when trns_type='House' then round(base_salary*(percentage/100),2)
     when trns_type='Health' then round(base_salary*(percentage/100),2)
	 when trns_type='Insurance' then round(base_salary*(percentage/100),2)
end amount
from  salary  cross join(select income 
as trns_type, cast(percentage as decimal) as percentage from income
union 
select deduction as trns_type, cast(percentage as decimal) as 
percentage from deduction) x
order by 2
create extension tablefunc
select employee,basic,allowance,others,(basic+allowance+others) as gross,
insurance,health,house,(insurance + health + house) as total_deductions,
(basic+allowance+others)-(insurance + health + house) as net_pay
from crosstab
('select emp_name,trns_type,amount from emp_transaction 
 order by emp_name,trns_type'
,'select distinct trns_type from emp_transaction order by trns_type') 
as result(employee varchar,
allowance numeric,basic numeric,health numeric,
house numeric,insurance numeric,others numeric)

select emp_name,trns_type,amount from emp_transaction 
select distinct trns_type from emp_transaction 

create table orders (customer_id int, dates date,product_id int 
)
insert into orders  values(1,'2024-02-18',101),(1,'2024-02-18',102),
(1,'2024-02-19',101),(1,'2024-02-19',103),(2,'2024-02-18',104),
(2,'2024-02-18',105),(2,'2024-02-19',101),(2,'2024-02-19',106)
select * from orders
select dates,cast(product_id as varchar) as products from orders 
-- where customer_id=1 and dates='2024-02-18'
union
select dates,string_agg(cast(product_id as varchar),',') as products
from orders
-- where customer_id=1 and dates='2024-02-18'
group by customer_id, dates
order by  dates,products


create table auto_repair (client varchar, auto varchar,repair_date int,indicator
varchar,value varchar)

insert into auto_repair  values('c1','a1',2022,'level','good'),
('c1','a1',2022,'velocity','90'),
('c1','a1',2023,'level','regular'),('c1','a1',2023,'velocity','80'),
('c1','a1',2024,'level','wrong'),('c1','a1',2024,'velocity','70'),
('c2','a1',2022,'level','good'),('c2','a1',2022,'velocity','90'),
('c2','a1',2023,'level','wrong'),('c2','a1',2023,'velocity','50'),
('c2','a2',2024,'level','good'),('c2','a2',2024,'velocity','80')

 drop table auto_repair
select * from auto_repair

select * from auto_repair where indicator ='level'

select * from auto_repair where indicator= 'velocity'

select v.value as velocity,l.value as level ,count(1) as value
from auto_repair l join  auto_repair v on l.client=v.client 
and l.auto=v.auto and l.repair_date=v.repair_date  
where l.indicator='level'and v.indicator= 'velocity'
group by v.value ,l.value
order by v.value ,l.value

select velecoty,coalesce(good,0) as good,coalesce(wrong,0) as wrong,
coalesce(regular,0) as regular
from crosstab('select v.value as velocity,l.value as level ,count(1) 
as value
from auto_repair l join  auto_repair v on l.client=v.client 
and l.auto=v.auto and l.repair_date=v.repair_date  
where l.indicator=''level''and v.indicator= ''velocity''
group by v.value ,l.value
order by v.value ,l.value','select distinct value from auto_repair
where indicator= ''level'' order by value')
as result(velecoty bigint, good bigint, regular bigint, wrong bigint)
select distinct value from auto_repair where indicator= 'level' order by value

create table brands (brand1 varchar, brand2 varchar,year int,customer1 int
 customer2 int, customer3 int,customer4 int)

insert into brands values('apple','samsung',2020,1,2,1,2),
('samsung','apple',2020,1,2,1,2),('apple','samsung',2021,1,2,5,3),
('samsung','apple',2021,5,3,1,2),('google',null,2020,5,9,null,null),
('oneplus','nothing',2020,5,9,6,3)
 select * from brands
  select *,concat(brand1,brand2,year) as pair_id,
  case when brand1 < brand2 then concat(brand1,brand2,year) 
  else concat(brand2,brand1,year) end as pair_id from brands

 with cte as  (select *,
  case when brand1 < brand2 then concat(brand1,brand2,year) 
  else concat(brand2,brand1,year) end as pair_id from brands),
  cte_rn as(select *, row_number() over(partition by pair_id order by pair_id)
  as rn from cte) select brand1,brand2,year,customer1,customer2,customer3,
  customer4 from cte_rn where rn=1 or
  (customer1<>customer3 and customer2<>customer4)

 

  select * from  mountain_huts
  select * from trails


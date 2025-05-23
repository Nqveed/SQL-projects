create table random_tab(id int,val decimal);
insert into random_tab
select 1,random() from generate_series(1,1000000);
insert into random_tab
select 2,random() from generate_series(1,1000000);
select count(1) from random_tab
select id,avg(val),count(*) from random_tab
group by id
create materialized view mv_random_tab
as select id,avg(val),count(*) from random_tab
group by id
select * from mv_random_tab
delete from random_tab where id = 1
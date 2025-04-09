with recursive numbers as
(select 1 as n
union
select n+1 from numbers where n <10)
select * from numbers

 select * from emp_details
 
 with recursive emp_hierarchy as
 ( select id,name,manager_id,designation,1 as lvl
 from emp_details where name='Asha'
 union
 select e.id,e.name,e.manager_id ,e.designation, h.lvl+1 as lvl
from emp_hierarchy h
  join  emp_details e on h.id=e.manager_id)
  -- select * from emp_hierarchy;
  
  select h2.id as emp_id ,h2.name as emp_name,
  e2.name as manager_name, h2.lvl as level
  from emp_hierarchy h2
  join emp_details e2 on e2.id=h2.manager_id;  


   with recursive emp_hierarchy as
 ( select id,name,manager_id,designation,1 as lvl
 from emp_details where name='David'
 union
 select e.id,e.name,e.manager_id ,e.designation, h.lvl+1 as lvl
from emp_hierarchy h
  join  emp_details e on h.manager_id=e.id)
  select h2.id as emp_id ,h2.name as emp_name,
  e2.name as manager_name, h2.lvl as level
  from emp_hierarchy h2
  join emp_details e2 on e2.id=h2.manager_id;  

  select * from employees3
  with recursive empcte as 
   ( select emp_id,emp_name,manager_id from employees3 e
  where emp_id=7
  union all
  select e.emp_id,e.emp_name,e.manager_id from employees3 e
  join empcte  em on e.emp_id=em.emp_id )
  select * from empcte
  create table demo_heir(id varchar,description varchar,parent_id varchar,level varchar)
  insert into demo_heir
  select 'cd1','Owner',null,'1'
  insert into demo_heir
  select 'cd4','test emp1','cd3','4'
  insert into demo_heir
  select 'id2','Co-Owner','id1','2'
  insert into demo_heir
  select 'cd4','test_emp1','cd3','4'
  select * from demo_heir where id like 'id%' order by level
  drop table demo_heir
  delete from demo_heir where id='id3'
create or replace function fn_demo_test_heir(id varchar,level varchar)
returns table (id varchar,description varchar,level vaecher)
as
$BOOD$
   with recursive rec_tab (id)
   as
   (select tree.id,tree.description,tree.parent_id,level from demo_heir tree
   where id='id3' 
   union
   select  tree.id,tree.description,tree.parent_id,tree.level  from rec_tab,
   demo_heir tree where tree.id=rec_tab.id --and tree.parent_id is not null
   )
   select id,description,level from rec_tab --where level =level;
   $BOOD$
   language 'sql';
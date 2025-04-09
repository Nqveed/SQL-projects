 select * from emp_details
 with recursive emp_heirachy1 as
 (select id,name,manager_id,designation,1 as lvl 
 from emp_details where name ='Asha'
 union
 select e.id,e.name,e.manager_id,e.designation,h.lvl+1 as lvl
 from emp_heirachy1 h join emp_details e  on h.id=e.manager_id
 )
 select h2.id as emp_id, h2.name as emp_name,e2.name as manager_name,h2.lvl as level
 from emp_heirachy1 h2 join emp_details e2 on e2.id=h2.manager_id


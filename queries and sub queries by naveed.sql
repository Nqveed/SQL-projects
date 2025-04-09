(1)Select * From emp1
(2)select max(salary) from emp1
(3)select e_name from emp1
where salary = (select max(salary) from emp1)
(4)select  (salary ), dept from emp1 
where salary <> (select max(salary) from emp1) order by salary  desc limit 4;
(5)Select e_name,salary From emp1 
Where salary In (Select Max(salary) 
From emp1
Where salary <> (Select Max (salary) From emp1));
(6)Select dept, Count(*) From emp1 Group by dept;
(7)Select e_name,dept,salary From emp1 
WHere dept In(Select dept From emp1
Group by dept having Count(*)<=2)
(8)Select e_name From emp1 
Where salary  in (Select Max (salary) 
From emp1 Group By dept)
(9) address  In ('Chd','Delhi','Pune');
(10)Select enSelect * From emp3 
Whereame From emp3 
Where eid  In (Select eid From emp4 ) 
(11)Select * From emp3 
Where  Exists (Select eid From emp4 
Where emp3.eid=emp4.eid);
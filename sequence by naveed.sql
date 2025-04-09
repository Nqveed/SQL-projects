create sequence sqe1
start with 1
increment by 1
minvalue 1
maxvalue 100
 no cycle; 
select nextval('sqe1')
drop sequence sqe1
create table emp_seque(emp_id integer default nextval('sqe1'),emp_name varchar,
salary numeric(10,2))
insert into emp_seque (emp_name,salary) values('Naveed',10000.67)
insert into emp_seque (emp_name,salary) values('Rahul',50000.67)
select * from emp_seque
create or replace procedure pro_emp_sque(in _emp_name varchar,in _salary numeric)
language 'plpgsql'
as
$BOOD$
declare
v_emp_seq_val integer;
begin
  select nextval('sqe1') into v_emp_seq_val ;
 insert into emp_seque (emp_id,emp_name,salary)
values(v_emp_seq_val ,_emp_name,_salary);
end;

$BOOD$
call pro_emp_sque('Sharma',75000.00)
select * from emp_seque
drop  procedure pro_emp_sque(emp_name varchar,salary numeric)
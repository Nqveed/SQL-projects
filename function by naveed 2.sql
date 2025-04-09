create or replace  function fun_math(num1 int, num2 int)
returns int
language sql
as
$BOOD$
select num1+num2;
$BOOD$

select fun_math(1,8)

create or replace  function fun_math1( int, int)
returns int
language sql
as
$BOOD$
select $1+$2;
$BOOD$
select fun_math1(1,8)

create or replace  function fun_math1()
returns int
language sql
as
$BOOD$
select 6+7;
$BOOD$
select fun_math1()
drop function fun_math1()
select * from emp_record
create  or replace function fn_emp_rec(emp_nm varchar)
returns emp_record
language sql
as
$BOOD$
select * from emp_record where emp_first_name=emp_nm;
$BOOD$
select* from fn_emp_rec('Shyam')
create  or replace function fn_emp_rec1(emp_nm varchar)
returns  setof emp_record
language sql
as
$BOOD$
select * from emp_record; --where emp_first_name=emp_nm;
$BOOD$
select* from fn_emp_rec1('we')

create  or replace function fn_emp_rec2(emp_nm varchar)
returns  table (employee_id varchar,emp_dept varchar,manager_id varchar)
language sql
as
$BOOD$
select emp_id,dept,manager_id from emp_record --where emp_first_name=emp_nm;
$BOOD$
select* from fn_emp_rec2('Shyam')
select fn_emp_rec2('Shyam')
create or replace function fn_if_con(num_1 int default 0,num_2 int default 0)
returns varchar
as 
$BODY$
declare 
-- num_3 int;
begin 
      if num_1 > num_2 then
	  return num_1 || ' is greater than ' || num_2;
		elsif num_1 < num_2 then
		return num_1 || ' is less than ' || num_2;
		elsif num_1 = num_2 then
		return num_1 || ' is equal to ' || num_2;
		else  
		return ' Never happened ';
  end if;
end;
$BODY$ language plpgsql

select fn_if_con(8,9)

create table demo_prod_test(prd_id serial primary key,prd_dtLs text array)
insert into demo_prod_test(prd_dtLs) values(array['prod_10','prod_11','prod_12']),
(array['prod_13','prod_14','prod_15']),
(array['prod_13','prod_7','prod_8','prod_9'])
select * from  demo_prod_test
select prd_id,prd_dtLs[2:]from  demo_prod_test where prd_id=2
select prd_id,prd_dtLs[:] from  demo_prod_test where 'prod_4'= any(prd_dtLs)
select prd_id , unnest (prd_dtLs) from  demo_prod_test 
update demo_prod_test set prd_dtLs='{prod_01,prod_02}' where prd_id=1
update demo_prod_test set prd_dtLs[8]='prod_08' where prd_id=3
update demo_prod_test set prd_dtLs= array_append(prd_dtls,prod_006) where prd_id=3

create or replace function fn_math_test(f_val integer, s_val integer)
returns integer
language 'plpgsql'
as 
$BOOD$
declare 
res_v  integer;
begin 
     res_v := f_val + s_val;

return res_v;
end;
$BOOD$;
select * from fn_math_test (4,4)

create or replace function fn_math_test1( in f_val integer, in s_val integer,
out res_val integer)

language 'plpgsql'
as 
$BOOD$
begin 
     res_val := f_val + s_val;
end;
$BOOD$;

select * from  fn_math_test (2,9)

create or replace function fn_math_test2( inout f_val integer, inout s_val integer
)

language 'plpgsql'
as 
$BOOD$
declare
 res_val integer;
begin 
     res_val := f_val ;
	 f_val := s_val;
	 s_val := res_val;
end;
$BOOD$;

select * from  fn_math_test2 (2,9)


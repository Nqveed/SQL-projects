-- create table public.test_array( my_values numeric );
create or replace function public.test_func(p_values numeric[])
returns text 
language 'plpgsql'
cost 100
volatile 
as $BOOD$
declare
v_array_length  numeric(10,0) := 0;
v_msg  character varying(100) := null;
begin
v_array_length := array_length(p_values,1);
if (v_array_length >0) then
for i in 1..v_array_length loop
insert into public.test_array(my_values) values(p_values[i]);
end loop;
v_msg := ' Array procesed Successfully with length'||v_array_length;
else
v_msg :='Array having no values';
 end if;
return v_msg;
end;
$BOOD$;
select * from emp_dy
create or replace function alter_table(column_name  varchar,data_type varchar
) returns VOID as
$$ 
begin
     execute format('Alter table emp_dy add column %I  %s',column_name,
	 data_type);
end;

$$ language plpgsql;
select alter_table ('email','varchar(255)');

create or replace function set_session_variable(var_name text,
var_value text) returns VOID  as $$
begin
    execute format('SET_SESSION %s TO %L',var_name, var_value);
end;
 $$ language plpgsql;
 select now()
 select set_session_variable ('timezone','UTC');

create or replace function set_session_role(role_name text
) returns VOID  as $$
begin
    execute format('SET_ROLE %s ',role_name);
end;
 $$ language plpgsql;
select * from emp_dy

create or replace function fliter_emp_dy(attr_name text,
attr_value text) returns setof emp_dy as
$$ 
begin
  return query execute format('select * from emp_dy where  %I = %L'
  ,attr_name,attr_value);
end;
 $$ language plpgsql;
 select * from fliter_emp_dy ('department','IT')

 create or replace function fliter_emp_dy2(attr_name text,
attr_value text) returns numeric as
$$ 
declare lv_salary  numeric(10,0);
begin
   execute format('select salary from emp_dy where  %I = %L'
  ,attr_name,attr_value) into lv_salary;
  return lv_salary; 
end;
 $$ language plpgsql;
 select * from fliter_emp_dy2 ('name','Jonh Doe')

 create or replace function fliter_emp_dy3(attr_name text,
attr_value text) returns char as
$$ 
declare 
lv_salary  numeric(10,0);
lv_name char(30);
begin
   execute 'select salary,name from emp_dy where  
   '|| $1||' = '||$2||''
  using attr_name,attr_value into lv_salary,lv_name;
  return lv_salary  || ' Having Salary : '||lv_name; 
end;
 $$ language plpgsql;
 select * from fliter_emp_dy3 ('id','1')


 create or replace function get_emp_details(output_refcursor
 refcursor) returns refcursor as
$$ 
declare 
dynamic_query text ;

begin
   dynamic_query := 'select* from emp_dy'; 
  open output_refcursor for execute dynamic_query;
  return output_refcursor;
   
end;
 $$ language plpgsql;
select get_emp_details('output_refcursor');
fetch all in output_refcursor;

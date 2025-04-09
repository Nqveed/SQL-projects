create table dept_chg_log(emp_id numeric,upd_time timestamp,no_of_r_upd numeric);
select * from dept_chg_log
select * from emp_record where emp_id=2
call update_emp_dept(1,'ACCT',123456789);
create or replace procedure update_emp_dept(in _emp_id numeric,
in _emp_n_dept varchar, in _emp_phone numeric)
language 'plpgsql'
as
$BODY$
declare
v_upd_tms timestamp;
v_row_updated numeric;
begin
     select timeofday() as load_tms into v_upd_tms;
     update emp_record set dept= _emp_n_dept where emp_id=_emp_id
	 and emp_phone=_emp_phone;
     get diagnostics v_row_updated=row_count;
	 insert into dept_chg_log(emp_id,upd_time,no_of_r_upd)
	 values(_emp_id,v_upd_tms,v_row_updated);
end;
$BODY$;
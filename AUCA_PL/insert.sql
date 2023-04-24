CREATE OR REPLACE PROCEDURE insert_new_emp(
    name employees.name%type, 
    salary employees.salary%type)
is
begin
  insert into employees(name, salary)
  values (name, salary);
end;
/

declare
cursor cur_emp is select * from employees;
begin
  for emp in cur_emp loop
    if emp.salary is NULL then
     emp.salary := 1500;
    end if;
    dbms_output.put_line('the new salary of '||emp.name||' is '||emp.salary)
;  end loop;
end;
/
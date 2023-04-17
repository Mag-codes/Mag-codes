declare
idi number := &value;
emp employees%ROWTYPE;
begin
SELECT * into emp FROM EMPLOYEES Where id=idi;
if sql%found then
dbms_output.put_line(emp.Name||'''s salary '||emp.salary||'$');
end if;
exception
  when no_data_found then
    dbms_output.put_line('Uwo mukozi ntawubaho mwana');
end;
/
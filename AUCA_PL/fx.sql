CREATE OR REPLACE FUNCTION totalEmployee
RETURN number 
IS
tot_emp number;
begin
  SELECT COUNT(*) INTO tot_emp FROM EMPLOYEES;
  RETURN tot_emp;
end;
/

declare
a number;
begin
a := totalEmployee;
dbms_output.put_line('the number of employee is: ' ||a);
end;
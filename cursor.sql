declare
-- cursor declaration 
cursor abakozi is select * from EMPLOYEES;

begin
  for umukozi in abakozi loop
    dbms_output.put_line(
        'Numero: '||umukozi.ID||
     ' izina ry'' umukozi '||umukozi.NAME||
     ' Umushahara we: ' ||umukozi.SALARY);
     dbms_output.put_line(abakozi%rowcount||'Rows affected');
  end loop;
  
end;
/
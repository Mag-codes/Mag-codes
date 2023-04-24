declare
cursor abakozi is select name from EMPLOYEES;
umukozi EMPLOYEES.NAME%type;
begin
  open abakozi;
  loop
    fetch abakozi into umukozi;
    if abakozi%notfound then
        EXIT;
    end if;
    case umukozi
      when umukozi := 'MUNEZERO' then 
      dbms_output.put_line("Good Boy")
      when umukozi := 'MBARUSHIMANA' then 
      dbms_output.put_line('Fuck')
      else
    end case;    
  end loop;
  close abakozi;
end;
/
declare
i number(2);
begin
  i := 1;
  while i <= 10 loop
    dbms_output.put_line('i = '||i);
    i := i + 1;
  end loop;
end;
/
declare
i number(2);
begin
  i := 1;
  loop
    dbms_output.put_line('Number: '||i);
    i := i + 1;
    exit when i > 10;
  end loop;
end;
/
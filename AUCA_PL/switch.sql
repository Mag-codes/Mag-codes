declare
month NUMBER;
begin
  case month 
    when 1 then dbms_output.put_line('January');
    when 2 then dbms_output.put_line('February');
    when 3 then dbms_output.put_line('March');
    when 4 then dbms_output.put_line('April');
    when 5 then dbms_output.put_line('May');
    when 6 then dbms_output.put_line('June');
    when 7 then dbms_output.put_line('July');
    else 
    dbms_output.put_line('Invalid input');
  end case;
end;
/
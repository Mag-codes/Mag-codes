declare
n number:=5;
begin
for i in 1..n
loop
for j in 1..i
loop
dbms_output.put('*');
end loop;
dbms_output.new_line;
end loop;
end;
/
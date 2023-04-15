-- Write a procedure to find the highest of two numbers
DECLARE
begin 
a number := 1;
b number := 2;

create or replace procedure bignum(n1 in number, n2 in number)          
begin    
IF n1 > n2 THEN
dbms_output.put_line('The largest number is: '||n1)
else
dbms_output.put_line('The largest number is: '||n2)
end if;
end;    
/  

begin
  bignum(a, b)
end;
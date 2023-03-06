DECLARE
reg STUDENT.ID %type := & id;
st_age STUDENT.age %type;
gender student.g%type;
own STUDENT.Name%type;
Teenagers NUMBER;
Girls NUMBER;
Boys NUMBER;

BEGIN

--Getting students under 18 years old
SELECT count(age) into Teenagers from STUDENT where AGE <= 18;
dbms_output.put_line('There are ' || Teenagers || ' Whose age is below 18');

--getting the number of girls under 18.
SELECT count(G) into Girls from STUDENT where G = 'F' and AGE < 18;
dbms_output.put_line(Girls || ' student out of the ' || Teenagers || ' are girls');

--getting the number of boys under 18 years of Age.
SELECT count(G) into Boys from STUDENT where AGE < 18 and G = 'M';
dbms_output.put_line(Boys || ' student out of the ' || Teenagers || ' are boys');

--Retrieving the student and deciding a gift option.
SELECT AGE into st_age from student where ID = reg;
SELECT g into  gender from student where ID = reg;
SELECT name into own from student where ID = reg;

IF gender = 'F' and (st_age >= 12 and st_age <= 16)  THEN
dbms_output.put_line(st_age||' years old '||own||' gets a laptop and  a skirt');
ELSIF  gender = 'M' and (st_age >= 12 and st_age <= 16)  THEN
dbms_output.put_line(st_age||' years old '||own||' gets a laptop and  a pant');
ELSIF gender = 'F' and (st_age > 16 and st_age <= 18) THEN
dbms_output.put_line(st_age||' years old '||own||' gets a laptop and  a dress');
ELSIF gender = 'M' and (st_age > 16 and st_age <= 18)  THEN
dbms_output.put_line(st_age||' years old '||own||' gets a laptop and  a suit');
ELSE
dbms_output.put_line(st_age||' years old '||own||' gets no gift');
END IF;
exception
  when no_data_found then
    dbms_output.put_line('Sorry there is no such student');
when OTHERS then 
    dbms_output.put_line('An error occured');
End;
/
declare
cursor cur_st is select * from students  
left join DEPARTMENT  on students.DEPARTMENT_ID = DEPARTMENT.id
join SPECIALIZATION on SPECIALIZATION.id = students.SPECIALIZATION_ID
where DEPARTMENT_NAME = 'Arts' and SPECIALIZATION.NAME='Cloud Computing';
begin
for student in cur_st 
loop
    dbms_output.put_line(student.STU_CODE||' '||student.STU_FNAME||' '||student.STU_LNAME);
  end loop;
  end;
/
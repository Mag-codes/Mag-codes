-- Interface
package specification
CREATE OR REPLACE PACKAGE STUD_DETAILS IS 
PROCEDURE set_record(st_rec in students%ROWTYPE);
FUNCTION get_record(stu_no in STUDENTS.STU_CODE%type) RETURN students%ROWTYPE;
END STUD_DETAILS;

-- Package body concerned with student
CREATE OR REPLACE PACKAGE BODY STUD_DETAILS AS 

--  a procudere to record a new student
PROCEDURE set_record(st_rec in students%ROWTYPE)
IS
ST NUMBER;
BEGIN
   INSERT INTO students VALUES (
    st_rec.STU_CODE,st_rec.STU_FNAME,
    st_rec.STU_LNAME, st_rec.STU_AGE,
    st_rec.STU_ADDRESS,
    st_rec.SPECIALIZATION_ID,
    st_rec.DEPARTMENT_ID, 
    st_rec.REGISTRATION_DATE);
END set_record;

-- A function to get student by id
FUNCTION get_record(stu_no IN STUDENTS.STU_CODE%type)
RETURN students%ROWTYPE
IS 
student_details students%ROWTYPE;

begin

  SELECT * into student_details FROM students  WHERE STU_CODE = stu_no;
  RETURN student_details;

end get_record;
End STUD_DETAILS;
/

-- Calling program
declare
NEW_STUDENT STUDENTS%ROWTYPE;
SEARCHED STUDENTS%ROWTYPE;
begin
NEW_STUDENT.STU_CODE := 'REGNO_19';
NEW_STUDENT.STU_FNAME := 'Munezero';
NEW_STUDENT.STU_LNAME := 'Ange';
NEW_STUDENT.STU_AGE := 23;
NEW_STUDENT.STU_ADDRESS := 'Kigalik';
NEW_STUDENT.SPECIALIZATION_ID := 1;
NEW_STUDENT.DEPARTMENT_ID := 1;
NEW_STUDENT.REGISTRATION_DATE:= TO_DATE('2023-04-17','YYYY-MM-DD');

STUD_DETAILS.set_record(NEW_STUDENT);
SEARCHED:= STUD_DETAILS.get_record('REGNO_11');

dbms_output.put_line('His Name is '||SEARCHED.STU_FNAME||' '||SEARCHED.STU_LNAME);
end;
/
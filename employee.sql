/*  QUESTION
1.Create the emp_table below and add the data as shown (/5 Marks)

2.Write a PLSQL package that inserts a new record in the emp_table table provided below. 
The package should print:
    -the number of records (employees) before the new record was added, 
    -the details of the new employee record added, 
    and the new number of employees after the record has been added.

3.Write the main PLSQL block to call the created package
*/
CREATE TABLE EMP_TABLE (EMP_CODE CHAR(4), 
                        EMP_FIRST_NAME VARCHAR(50),
                        EMP_LAST_NAME VARCHAR(50),
                        EMP_SALARY NUMBER,
                        EMP_ADDRESS VARCHAR(20),
                        PRIMARY KEY(EMP_CODE));

-- Inserting Data into Emp_table
INSERT INTO EMP_TABLE  VALUES('E002', 'John', 'Wick', 345000, 'Burundi');
INSERT INTO EMP_TABLE  VALUES('E003', 'Anna', 'Frank', 123400, 'Kenya');
INSERT INTO EMP_TABLE  VALUES('E001', 'Richard', 'Cipher', 245000, 'Rwanda');
INSERT INTO EMP_TABLE  VALUES('E004', 'Louise', 'Newton', 768900, 'Uganda');
INSERT INTO EMP_TABLE  VALUES('E005', 'Marie', 'Currie', 678900, 'Tanzanie');
INSERT INTO EMP_TABLE  VALUES('E006', 'Alfred', 'Butler', 345670, 'Chad');

-- Creating an Interaface
PACKAGE specification
CREATE OR REPLACE PACKAGE EMP_DETAILS IS
PROCEDURE set_record(p_emp_rec EMP_TABLE%ROWTYPE);
PROCEDURE emp_count;
FUNCTION get_record(p_emp_no EMP_TABLE.EMP_CODE%TYPE) RETURN EMP_TABLE%ROWTYPE;
END EMP_DETAILS;
/

-- Creating the package Body
CREATE OR REPLACE PACKAGE BODY EMP_DETAILS AS
-- A procedure that take in an employee record and insert it into a database
PROCEDURE set_record(p_emp_rec EMP_TABLE%ROWTYPE)
is
BEGIN 
    -- A statement to retrive the number of Employe in the table before insertion. 
    emp_count();
    -- A statement to Inset a new Employee
    INSERT INTO EMP_TABLE VALUES (p_emp_rec.EMP_CODE, 
                                p_emp_rec.EMP_FIRST_NAME,
                                p_emp_rec.EMP_LAST_NAME,
                                p_emp_rec.EMP_SALARY,
                                p_emp_rec.EMP_ADDRESS);
    -- Printing the detail of added Employee
    dbms_output.put_line('The Employee: '||p_emp_rec.EMP_FIRST_NAME||' '||p_emp_rec.EMP_LAST_NAME||' with '||p_emp_rec.EMP_CODE||' Code has been added');
    -- A statement to retrive the number of Employee in the table after Instertion.
    emp_count();
END set_record;

-- A function to Retrive an employe  using His/Her Id
FUNCTION get_record(p_emp_no EMP_TABLE.EMP_CODE%TYPE) 
RETURN EMP_TABLE%ROWTYPE
is
Emp_detail EMP_TABLE%ROWTYPE;
BEGIN
SELECT * INTO Emp_detail FROM EMP_TABLE WHERE EMP_CODE = p_emp_no;
RETURN Emp_detail;
END get_record;

-- A procedure to count Employee
PROCEDURE emp_count is 
Emp_num number;
begin
  SELECT count(*) into Emp_num from EMP_TABLE;
    dbms_output.put_line('The number of Employees was '||Emp_num);
end emp_count;

end;

-- Calling Program
DECLARE
Emp_detail EMP_TABLE%ROWTYPE;
NEW_EMP EMP_TABLE%ROWTYPE;
begin
-- Inserting data into the NEw_EMP a rowtype attr 
NEW_EMP.EMP_CODE := 'E008';
NEW_EMP.EMP_FIRST_NAME := 'Mbarushimana';
NEW_EMP.EMP_LAST_NAME := 'Etienne';
NEW_EMP.EMP_SALARY := 1000000;
NEW_EMP.EMP_ADDRESS := 'Canada';

-- passing the NEw_EMP into the set_record Procdure 
EMP_DETAILS.set_record(NEW_EMP);

-- Using the getrecord to get the employee Details
Emp_detail := EMP_DETAILS.get_record('E004');
dbms_output.put_line('Retrievd Employee''s name is '||Emp_detail.EMP_FIRST_NAME||' '||Emp_detail.EMP_LAST_NAME);
end;


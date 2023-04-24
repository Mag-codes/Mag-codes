 declare
  Emp employees%ROWTYPE;
  bonus_amount NUMBER;
BEGIN
SELECT * INTO Emp FROM EMPLOYEES WHERE 
   bonus_amount :=
      CASE
         WHEN salary >= 1000 AND salary <= 2000 THEN 1500
         WHEN salary > 2000 AND salary <= 4000 THEN 1000
         WHEN salary > 4000 THEN 500
         ELSE 0
      END ;
   DBMS_OUTPUT.PUT_LINE(bonus_amount);
   update EMPLOYEES
      set salary = salary + bonus_amount
    where id = id;
END;
/
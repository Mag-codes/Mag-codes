--Creating table of Employees
create table Employes(
code integer,
e_first_name varchar(20),
e_last_name varchar(20),
sal float);

--Inserting row into table
insert into Employes values(1, 'Louis', 'Vuiton', 4500.25);
insert into Employes (code,e_first_name, e_last_name, sal) values(2, 'Anne', 'Frank', 3750.75);
insert into Employes (code,e_first_name, e_last_name, sal) values(3, 'Bruce', 'Wayne', 6000.57);
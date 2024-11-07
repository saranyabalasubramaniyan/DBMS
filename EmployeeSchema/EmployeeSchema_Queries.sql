--1. Names of all male employees
SELECT Fname,Minit,Lname FROM EMPLOYEE WHERE Sex='M';

--2.Retrieve the names of employees who work on the ‘Newbenefits project
SELECT Fname,Minit,Lname FROM EMPLOYEE WHERE Ssn IN (SELECT Essn FROM WORKS_ON WHERE Pno IN (SELECT Pnumber FROM PROJECT WHERE Pname = 'Newbenefits'));

--3. Find the names of employees that works for ‘Administration’ department
SELECT Fname,Minit,Lname FROM EMPLOYEE, DEPARTMENT WHERE Dno=Dnumber AND Dname='Administration';

--4. Retrieve name and salary of all male employees who have dependents
SELECT Fname,Minit,Lname FROM EMPLOYEE WHERE Sex='M' AND Ssn IN (SELECT Essn FROM DEPENDENT);

--5. Retrieve name of all department managers
SELECT Fname,Minit,Lname FROM EMPLOYEE WHERE Ssn IN (SELECT Mgr_ssn FROM DEPARTMENT);

--6. Retrieve names of project controlled by ‘Research Department’
SELECT Pname FROM PROJECT WHERE Dnum IN (SELECT Dnumber FROM DEPARTMENT WHERE Dname='Research');

--7. Find the names and addresses of employees who work on a project located in Stafford.
SELECT Fname,Minit,Lname,Address FROM EMPLOYEE WHERE Ssn IN (SELECT Essn FROM WORKS_ON WHERE Pno IN (SELECT Pnumber FROM PROJECT WHERE Plocation = 'Stafford'));

--8. Insert a new project “ProductO”, with pnumber 4, located at Houston, controlled by department 4
INSERT INTO PROJECT VALUES('ProductO','4','Houston','4');

SELECT * FROM PROJECT;

--9. Update Project location as Sugerland for project 4
UPDATE PROJECT SET Plocation='Sugerland' WHERE Pnumber='4'

SELECT * FROM PROJECT;

--10. Delete Project 4
DELETE FROM PROJECT WHERE Pnumber='4';

SELECT * FROM PROJECT;





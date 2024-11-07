/**
*                   HomeWork 6 - DBMS - Dr. Cheng Hong
*                    Name :Saranya Balasubramaniyan
*                    ID: 999901316
*/

--Part 1:
--1.Retrieve the average salary of all employees who works on ‘ProductX’ project department
select avg(salary)
from employee,PROJECT
where DNO=DNUM and PNAME='ProductX';

--2.For each employee who has dependent, list employee name and the total number of dependents depends on the employee
select fname,lname,count(Dependent_name)
from employee,DEPENDENT
where Ssn=Essn
GROUP BY fname,lname;

--3.Retrieve the names of employees who work on every project controlled by department 4
select fname,LNAME
from employee
where not exists (select pnumber  from project where dnum=4
and pnumber not in (select pno from works_on where SSN=ESSN));

--4.Retrieve the names of department managers who do not work on any project.
Select fname, minit, lname
from Employee, Department
where ssn=mgr_ssn and NOT EXISTS (SELECT * FROM works_on WHERE ESSN=SSN);

--5.For each project, retrieve project name, and the total number of employee working on the projects
select Pname,count(Essn)
from project,works_on
where Pnumber=Pno
GROUP BY Pname;

--6.List the last names of female employees who are not department managers.
select fname,minit,lname
from employee
where Sex = 'F' and NOT EXISTS(SELECT * FROM DEPARTMENT WHERE Mgr_ssn=Ssn);

--Part 2.
--1. Retrieve the names of all courses taught by professor King in Fall 21.
SELECT Course_name
FROM COURSE, SECTION
WHERE COURSE.Course_Number=SECTION.Course_Number AND Instructor='King' AND (Year='21' and Semester='Fall');

--2.Retrieve the name and transcript of each senior student (Class=4) majoring in CS. Transcript includes 
-- course name, course number, credit hours, semester, year, and grade for each course completed by the student.
SELECT Name, Course_Name, C.Course_Number, Credit_Hours, Semester, Year, Grade
FROM STUDENT ST, COURSE C, SECTION S, GRADE_REPORT G
WHERE Class=4 AND Major='CS' AND ST.Student_number=G.Student_number AND
G.Section_identifier=S.Section_identifier AND S.Course_number=C.Course_number;

--3.Retrieve the names and major departments of all straight A students (students who have a grade of A in all their courses).
SELECT Name, Major
FROM STUDENT
WHERE NOT EXISTS ( SELECT * FROM GRADE_REPORT WHERE Student_number= STUDENT.Student_number AND NOT(Grade='A'));--4.Retrieve department names and the number of students with that department major --(sorted in decreasing order of the number of students)
SELECT c.Department,count(DISTINCT s.Student_Number) as Student_Count
FROM (course as c LEFT OUTER JOIN Student as s ON c.Department = s.Major)
GROUP BY c.Department
ORDER BY Student_Count desc;
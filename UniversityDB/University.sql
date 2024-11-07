
CREATE TABLE course (
  Course_name varchar(30) NOT NULL,
  Course_number varchar(10) NOT NULL,
  Credit_hours INT DEFAULT NULL,
  Department varchar(1045) DEFAULT NULL,
  PRIMARY KEY ("Course_number")
) ;

INSERT INTO course VALUES('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Database', 'CS3380', 3, 'CS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH');


CREATE TABLE student (
  Name varchar(20) NOT NULL,
  Student_number INT NOT NULL,
  Class INT DEFAULT NULL,
  Major varchar(20) DEFAULT NULL,
  PRIMARY KEY ("Student_number")
) ;

INSERT INTO student VALUES
('Brown', 8, 2, 'CS'),
('Smith', 17, 1, 'CS');

CREATE TABLE section (
  Section_identifier INT NOT NULL,
  Semester varchar(6) DEFAULT NULL,
  Year char(2) DEFAULT NULL,
  Instructor varchar(45) DEFAULT NULL,
  Course_number varchar(10) DEFAULT NULL,
  PRIMARY KEY (Section_identifier),
  FOREIGN KEY (Course_number) REFERENCES course(Course_number) ON DELETE CASCADE ON UPDATE CASCADE
) ;

INSERT INTO section VALUES
(85, 'Fall', '07', 'King', 'MATH2410'),
(92, 'Fall', '07', 'Anderson', 'CS1310'),
(102, 'Spring', '08', 'Knuth', 'CS3320'),
(112, 'Fall', '08', 'Chang', 'MATH2410'),
(119, 'Fall', '08', 'Anderson', 'CS1310'),
(135, 'Fall', '08', 'Stone', 'CS3380');

CREATE TABLE grade_report (
  Student_number INT NOT NULL,
  Section_identifier INT NOT NULL,
  Grade char(1) DEFAULT NULL,
  PRIMARY KEY (Student_number,Section_identifier),
  FOREIGN KEY (Student_number) REFERENCES student(Student_number) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Section_identifier) REFERENCES section(Section_identifier) ON DELETE CASCADE ON UPDATE CASCADE
) ;

INSERT INTO grade_report VALUES
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A'),
(17, 112, 'B'),
(17, 119, 'C');


CREATE TABLE prerequisite (
  Course_number varchar(10) NOT NULL,
  Prerequisite_number varchar(10) NOT NULL,
  PRIMARY KEY (Course_number,Prerequisite_number),
  FOREIGN KEY (Course_number) REFERENCES course(Course_number) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (Prerequisite_number) REFERENCES course(Course_number) ON DELETE NO ACTION ON UPDATE NO ACTION
);


INSERT INTO prerequisite VALUES
('CS3320', 'CS1310'),
('CS3380', 'CS3320'),
('CS3380', 'MATH2410');




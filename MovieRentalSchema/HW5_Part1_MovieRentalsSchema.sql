/**
*		DBMS Homework 5 - Part 1
*           Dr. Cheng Hong
*       Name : Saranya Balasubramaniyan
*       Section : 001
*       ID : 999901316
*/

#Creating the Customer Table
CREATE table CUSTOMER
(CNumber	int	not null,
CName	varchar(30) not null,
Address	varchar(50) default null,
CDate date not null,
Number_of_rentals int not null,
Bonus int default null,
PRIMARY KEY (CNumber)
);
CREATE TABLE DIRECTOR
(DName varchar(64) not null,
DNumber int not null,
Year_of_birth year not null,
Year_of_death year not null,
PRIMARY KEY(DNumber)
);
CREATE TABLE MOVIE
(MNumber	int	not null,
Title	varchar(64) not null,
MYear	year not null,
MType	varchar(64) default null,
Critic_rating	dec(3,1) not null,
Nominations	int default null,
Awards_won int not null,
D_Number int,
PRIMARY KEY (MNumber),
UNIQUE(Title),
FOREIGN KEY(D_Number) REFERENCES DIRECTOR(DNumber) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE TAPE
(TCode	int	not null,
Purchase_date date not null,
Times_rented	int not null,
C_Number	int,
M_Number	int,
PRIMARY KEY (TCode),
FOREIGN KEY (C_Number) REFERENCES CUSTOMER(CNumber) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (M_Number) REFERENCES MOVIE(MNumber) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE STAR
(SNumber	int	not null,
SName	varchar(64) not null,
BirthPlace	varchar(100) default null,
Year_of_Birth	year default null,
Year_of_death	year default null,
PRIMARY KEY (SNumber)
);
CREATE TABLE PLAYED_IN
(S_Number	int not null,
M_Number	int not null,
SRole	varchar(128) not null,
PRIMARY KEY (S_Number,M_Number),
FOREIGN KEY(S_Number) REFERENCES STAR(SNumber) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(M_Number) REFERENCES MOVIE(MNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO CUSTOMER VALUES ('0001','Richard Thomson','1300 Broadway, Portland 65200','2021-04-07',5,10);
INSERT INTO CUSTOMER VALUES ('0002','Renesmee Cullen','2345 Cullens Drive, Forks 64304','2021-08-10',15,50);
INSERT INTO CUSTOMER VALUES ('0004','Isabella Swan','345 Vampires Trail, Forks 64304','2021-07-16',10,5);

INSERT INTO DIRECTOR VALUES('Van De Corg','1001','1936','1976');
INSERT INTO DIRECTOR VALUES('Charles Spielberg','1002','1944','1999');
INSERT INTO DIRECTOR VALUES('Rowen Wolf','1004','1936','2005');

INSERT INTO MOVIE VALUES('70001','Real Steel','2010','Sci-Fi','10.0','10','8','1002');
INSERT INTO MOVIE VALUES('70002','Princess Diaries','2002','Teen Drama','7.5','1','1','1001');
INSERT INTO MOVIE VALUES('70004','Wolverine','2005','Sci-Fi','8.0','3','3','1004');

INSERT INTO TAPE VALUES('2301','1998-12-12','12','0001','70002');
INSERT INTO TAPE VALUES('2302','1992-11-09','4','0002','70001');
INSERT INTO TAPE VALUES('2304','1982-11-09','5','0004','70004');

INSERT INTO STAR VALUES('50001','Jason Holder','Alaska','1945',2010);
INSERT INTO STAR VALUES('50002','Hilton Taylor','Rejkavik','2002',null);
INSERT INTO STAR VALUES('50004','Reed Royal','Boston','2005',null);

INSERT INTO PLAYED_IN VALUES('50001','70001','Lead Actor');
INSERT INTO PLAYED_IN VALUES('50002','70002','Lead Actress');
INSERT INTO PLAYED_IN VALUES('50004','70004','Negative Lead');

#Validating the MySQL commands used to design the schema
#Displaying all the tables
SHOW TABLES;
SELECT * FROM Customer;
SELECT * FROM Director;
SELECT * FROM MOVIE;
SELECT * FROM STAR;
SELECT * FROM Tape;
SELECT * FROM PLAYED_IN;

#Verifying Tape-> C_Number for update cascade and delete set null
UPDATE Customer SET CNumber = '0003' WHERE CNumber = '0001';
DELETE FROM Customer WHERE CNumber = '0002';

#Displaying Customer and TApe tables after the modification
SELECT * FROM Customer;
SELECT * FROM Tape;

UPDATE Director SET DNumber = '1003' WHERE DNumber = '1001';
DELETE FROM Director WHERE DNumber = '1002';

SELECT * FROM Director;
SELECT * FROM MOVIE;

UPDATE Star SET SNumber = '50003' WHERE SNumber = '50001';
DELETE FROM Movie WHERE MNumber = '70002';

SELECT * FROM STAR;
SELECT * FROM MOVIE;
SELECT * FROM PLAYED_IN;



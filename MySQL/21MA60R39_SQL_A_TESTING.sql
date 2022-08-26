-- RollNo: 21MA60R39
-- Name: Mohammed Kashif Mohammed Moizuddin
-- DBMS_ASSIGNMENT_02
-- ___________________________________________________________________________________________________
-- Assumptions Made:
-- 1. Along with students, faculties and staff members also taking courses from academics.
-- 2. There are faculties from departments other than 'CS' but still they are teaching courses 
--    of 'CS' department, such as CN, C++, DSA, OS.
-- 3. Basic subjects are prerequisite for advanced subjects.
-- 4. Highest qualification of STAFF is 'BTECH' and that of faculties is 'PHD'.
-- 5. Courses from 'CS' department can be taken by other department students.

CREATE database college;

create table RegUser(RNo int, RName varchar(20),ROccu varchar(10), 
Age int, HighestQual varchar(5), PRIMARY KEY(RNo));

create table Faculty (FId int, ResearchArea varchar(4), 
FDept varchar(3), PRIMARY KEY(FId), 
FOREIGN KEY fk_std_0(FId) REFERENCES RegUser(RNo)); 

create table Course(CId int, CName varchar(10), CDuration varchar(10), 
CDept varchar(3), FId int, PRIMARY KEY(CId), 
FOREIGN KEY fk_std_1(FId) REFERENCES Faculty(FId)); 

create table Prerequisite (CId int, PreqCId int, 
FOREIGN KEY fk_std2(CId) REFERENCES Course (CId), 
FOREIGN KEY fk_std3(PreqCId) REFERENCES Course (CId), 
PRIMARY KEY(CId, PreqCId));

create table  CourseReg(RNo int, CId int, Score int, PRIMARY KEY(RNo, CId), 
FOREIGN KEY fk_std4(RNo) REFERENCES RegUser (RNo), 
FOREIGN KEY fk_std5(CId) REFERENCES Course (CId));

use college;
show tables;

INSERT INTO RegUser
VALUES(2022001,'Ravi','STUDENT',23,'BTECH');

INSERT INTO RegUser
VALUES(2022002,'Hari','STUDENT',24,'BTECH');

INSERT INTO RegUser
VALUES(2022003,'shami','STUDENT',22,'BTECH');

INSERT INTO RegUser
VALUES(2022104,'John','STUDENT',25,'MTECH');

INSERT INTO RegUser
VALUES(2022105,'Viraj','STUDENT',25,'MTECH');

INSERT INTO RegUser
VALUES(2022206,'Raj','STUDENT',28,'PHD');

INSERT INTO RegUser
VALUES(2022207,'Mike','STUDENT',27,'PHD');

INSERT INTO RegUser
VALUES(2022308,'Munna','STUDENT',30,'PHD');

INSERT INTO RegUser 
VALUES(2022309,'Michel','STUDENT',31,'PHD');

INSERT INTO RegUser
VALUES(2022310,'JACK','STUDENT',31,'MTECH');

-- ----------------------------------

INSERT INTO RegUser
VALUES(33001,'Shankar','FACULTY',37,'PHD');

INSERT INTO RegUser
VALUES(33002,'PAWAN','FACULTY',33,'PHD');

INSERT INTO RegUser
VALUES(33003,'Nilesh','FACULTY',46,'PHD');

INSERT INTO RegUser
VALUES(33104,'Sundar','FACULTY',55,'MTECH');

INSERT INTO RegUser
VALUES(33105,'Harsh','FACULTY',35,'MTECH');

INSERT INTO RegUser
VALUES(33206,'Monica','FACULTY',38,'PHD');

INSERT INTO RegUser
VALUES(33207,'Tison','FACULTY',53,'PHD');

-- ----------------------------------

INSERT INTO RegUser
VALUES(44001,'pooja','STAFF',33,'BTECH');

INSERT INTO RegUser
VALUES(44002,'Imad','STAFF',36,'BTECH');

INSERT INTO RegUser
VALUES(44003,'Dhoni','STAFF',34,'BTECH');

select * FROM RegUser;
-- -----------------------------------------------------------------------
INSERT INTO Faculty
VALUES(33001, 'ALGO', 'ECE');

INSERT INTO Faculty
VALUES(33002, 'ML', 'CS');

INSERT INTO Faculty
VALUES(33003, 'AI', 'CS');

INSERT INTO Faculty
VALUES(33104, 'DBMS', 'ME');

INSERT INTO Faculty
VALUES(33105, 'ML', 'EE');

INSERT INTO Faculty
VALUES(33206, 'AI', 'ECE');

INSERT INTO Faculty
VALUES(33207, 'ALGO', 'ME');

-- --------------------------------------------------------------------------
select * FROM Faculty;

INSERT INTO Course
Values (55001, 'LA for AI','MEDIUM','ECE',33206);

INSERT INTO Course
Values (55002, 'LA for AI','MEDIUM','CS',33003);

INSERT INTO Course
Values (55003, 'LA for ML','MEDIUM','CS',33002);

INSERT INTO Course
Values (55004, 'ADV AI','MEDIUM','ECE',33206);

INSERT INTO Course
Values (55005, 'ADV AI','LONG','CS',33003);

INSERT INTO Course
Values (55006, 'ADV ML','LONG','CS',33002);

INSERT INTO Course
Values (55007, 'ADV ALGO','LONG','ECE',33001);

INSERT INTO Course
Values (55008, 'BASIC ALGO','SHORT','ECE',33001);

INSERT INTO Course
Values (55009, 'ADV ALGO','LONG','ME',33207);

INSERT INTO Course
Values (55010, 'BASIC ALGO','SHORT','ME',33207);

INSERT INTO Course
Values (55011, 'BASICS ML','MEDIUM','EE',33105);


INSERT INTO Course
Values (55012, 'DSA','MEDIUM','CS',33206);


INSERT INTO Course
Values (55013, 'C++','LONG','CS',33206);

INSERT INTO Course
Values (55014, 'CN','MEDIUM','CS',33105);

INSERT INTO Course
Values (55013, 'OS','LONG','CS',33105);


SELECT * FROM Course;

-- ---------------------------------------------------------------
INSERT INTO Prerequisite 
VALUES (55005,55002);

INSERT INTO Prerequisite 
VALUES (55004,55001);

INSERT INTO Prerequisite 
VALUES (55005,55003);

INSERT INTO Prerequisite 
VALUES (55007,55008);

INSERT INTO Prerequisite 
VALUES (55009,55010);

SELECT * FROM Prerequisite;
-- ----------------------------------------------------
INSERT INTO CourseReg
VALUES (2022001,55001,95);
INSERT INTO CourseReg
VALUES (2022001,55008,89);
INSERT INTO CourseReg
VALUES (2022001,55006,65);

INSERT INTO CourseReg
VALUES (2022002,55002,58);
INSERT INTO CourseReg
VALUES (2022002,55003,93);
INSERT INTO CourseReg
VALUES (2022002,55006,79);
INSERT INTO CourseReg
VALUES (2022002,55011,99);

INSERT INTO CourseReg
VALUES (2022003,55010,86);
INSERT INTO CourseReg
VALUES (2022003,55003,87);
INSERT INTO CourseReg
VALUES (2022003,55004,77);

INSERT INTO CourseReg
VALUES (2022104,55010,78);
INSERT INTO CourseReg
VALUES (2022104,55001,88);
INSERT INTO CourseReg
VALUES (2022104,55005,63);

INSERT INTO CourseReg
VALUES (2022105,55001,59);
INSERT INTO CourseReg
VALUES (2022105,55008,62);
INSERT INTO CourseReg
VALUES (2022105,55006,68);

INSERT INTO CourseReg
VALUES (2022206,55004,78);
INSERT INTO CourseReg
VALUES (2022206,55006,74);
INSERT INTO CourseReg
VALUES (2022206,55009,99);

INSERT INTO CourseReg
VALUES (2022207,55002,100);
INSERT INTO CourseReg
VALUES (2022207,55003,89);
INSERT INTO CourseReg
VALUES (2022207,55007,77);

INSERT INTO CourseReg
VALUES (44003,55004,93);
INSERT INTO CourseReg
VALUES (44003,55006,95);
INSERT INTO CourseReg
VALUES (44003,55007,98);

INSERT INTO CourseReg
VALUES (33206,55005,96);
INSERT INTO CourseReg
VALUES (33206,55006,92);
INSERT INTO CourseReg
VALUES (33206,55009,88);

INSERT INTO CourseReg
VALUES (33207,55002,99);
INSERT INTO CourseReg
VALUES (33207,55003,82);
INSERT INTO CourseReg
VALUES (33207,55011,93);

INSERT INTO CourseReg
VALUES (33203,55002,89);
INSERT INTO CourseReg
VALUES (33203,55003,92);
INSERT INTO CourseReg
VALUES (33203,55011,83);

INSERT INTO CourseReg
VALUES (2022308,55012,89);
INSERT INTO CourseReg
VALUES (2022308,55013,91);
INSERT INTO CourseReg
VALUES (2022308,55015,73);

INSERT INTO CourseReg
VALUES (2022309,55012,100);
INSERT INTO CourseReg
VALUES (2022309,55014,95);
INSERT INTO CourseReg
VALUES (2022309,55015,84);


INSERT INTO CourseReg
VALUES (2022310,55013,74);
-- _______________________________________________________________________________

-- ------------------------------ Q1 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName, f.FDept
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
ORDER BY x.RNo;

-- ------------------------------ Q2 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.ROccu = 'STUDENT'
ORDER BY x.RNo;

-- ------------------------------ Q3 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.HighestQual = 'BTECH'
ORDER BY x.RNo;

-- ------------------------------ Q4 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.HighestQual = 'MTECH'
AND 	f.FDept = 'CS'
ORDER BY x.RNo;

-- ------------------------------ Q5 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.ROccu <> 'STAFF'
AND		c.CDuration = 'SHORT'
ORDER BY x.RNo;

-- ------------------------------ Q6 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.HighestQual <> 'PHD'
AND		f.ResearchArea in (	SELECT ff.ResearchArea
							FROM faculty ff
                            WHERE (ff.ResearchArea = 'AI' AND ff.ResearchArea = 'ML')
                            OR(ff.ResearchArea = 'ALGO')
                            )
ORDER BY x.RNo;

-- ------------------------------ Q7 --------------------------------------------  
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName,  c.Cdept,f.FDept
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	((SELECT COUNT(*) FROM course , faculty WHERE (c.CDept='CS' AND f.FDept <>'CS'))>2)
ORDER BY x.RNo;


SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName, f.FDept
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo 
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	c.CDept='CS' 
AND 	f.FDept <>'CS' 
AND 	x.RName IN (SELECT x.RName GROUP BY x.RName HAVING COUNT(*)>1)
ORDER BY x.RNo;


SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName,  c.Cdept,f.FDept
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	c.CDept='CS'
AND 	f.FDept <>'CS'
HAVING COUNT(x.RName IN (SELECT r1.RName FROM RegUser r1 ))>1
ORDER BY x.RNo;
-- ------------------------------ Q8 -------------------------------------------- 
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	c.CDuration<> 'LONG'
AND 	(f.FDept = 'EE' OR f.FDept = 'CS')
ORDER BY x.RNo;

-- ------------------------------ Q9 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName, c.CDept
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.HighestQual = 'BTECH'
AND 	f.ResearchArea <> 'DBMS'
AND 	(C.CDept <> 'EE' AND c.CDept <> 'ME')
ORDER BY x.RNo;

-- ------------------------------ Q10 --------------------------------------------
-- (RId, RName, FId, FName, CId, CName) 
SELECT x.RNo AS RId, x.RName, f.FId,y.RName AS FName, cr.CId, c.CName
FROM RegUser x,RegUSer y, Faculty f, CourseReg cr, course c
WHERE 	x.RNo = cr.RNo
AND		cr.CId = c.CId
AND		c.FId = f.FId
AND 	y.RNo = f.FId
AND 	x.HighestQual<> 'PHD'
AND 	c.CDuration = 'MEDIUM'
AND 	(f.FDept = 'EE' OR f.FDept ='ECE')
AND 	c.CDept <> 'ME'
AND 	(f.ResearchArea = 'AI' OR f.ResearchArea = 'ML' )
ORDER BY x.RNo;

-- ------------------------------------------------------------------------------









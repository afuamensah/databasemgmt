-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lipscomb_registration
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `C_ID` int(11) NOT NULL,
  `C_No` char(6) NOT NULL,
  `C_Name` varchar(30) NOT NULL,
  `Credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`C_ID`),
  UNIQUE KEY `c_num` (`C_No`),
  UNIQUE KEY `course_name` (`C_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'IT 101','Intro. to Info. Tech.',3),(2,'IS 301','Systems Analysis',3),(3,'IT 240','Database Management',3),(4,'CS 120','Intro. To Programming',3),(5,'IT 451','Web-Based Systems',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_section`
--

DROP TABLE IF EXISTS `course_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_section` (
  `C_Sec_ID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `TermID` int(11) DEFAULT NULL,
  `Sec_Num` int(11) DEFAULT NULL,
  `FacID` int(11) DEFAULT NULL,
  `C_Sec_Day` varchar(6) DEFAULT NULL,
  `C_Sec_Start` varchar(15) DEFAULT NULL,
  `C_Sec_End` varchar(15) DEFAULT NULL,
  `LID` int(11) DEFAULT NULL,
  `Max_Enrl` int(11) DEFAULT NULL,
  PRIMARY KEY (`C_Sec_ID`),
  KEY `courseid` (`CID`),
  KEY `facid` (`FacID`),
  KEY `locid` (`LID`),
  KEY `termid` (`TermID`),
  CONSTRAINT `courseid` FOREIGN KEY (`CID`) REFERENCES `course` (`c_id`) ON UPDATE CASCADE,
  CONSTRAINT `facid` FOREIGN KEY (`FacID`) REFERENCES `faculty` (`f_id`) ON UPDATE CASCADE,
  CONSTRAINT `locid` FOREIGN KEY (`LID`) REFERENCES `location` (`loc_id`) ON UPDATE CASCADE,
  CONSTRAINT `termid` FOREIGN KEY (`TermID`) REFERENCES `term` (`term_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_section`
--

LOCK TABLES `course_section` WRITE;
/*!40000 ALTER TABLE `course_section` DISABLE KEYS */;
INSERT INTO `course_section` VALUES (1,1,4,1,2,'MWF','10:00:00 AM','10:50:00 AM',1,140),(2,1,4,2,3,'TR','9:30:00 AM','10:45:00 AM',7,35),(3,1,4,3,3,'MWF','8:00:00 AM','8:50:00 AM',2,35),(4,2,4,1,4,'TR','11:00:00 AM','12:15:00 AM',6,35),(5,2,5,2,4,'TR','2:00:00 PM','3:15:00 PM',6,35),(6,3,5,1,1,'MWF','9:00:00 AM','9:50:00 AM',5,30),(7,3,5,2,1,'MWF','10:00:00 AM','10:50:00 AM',5,30),(8,4,5,1,5,'TR','8:00:00 AM','9:15:00 AM',3,35),(9,5,5,1,2,'MWF','2:00:00 PM','2:50:00 PM',5,35),(10,5,5,2,2,'MWF','3:00:00 PM','3:50:00 PM',5,35),(11,1,6,1,1,'MTWRF','8:00:00 AM','9:30:00 AM',1,50),(12,2,6,1,2,'MTWRF','8:00:00 AM','9:30:00 AM',6,35),(13,3,6,1,3,'MTWRF','8:00:00 AM','9:30:00 AM',5,35);
/*!40000 ALTER TABLE `course_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enrollment` (
  `S_ID` int(11) NOT NULL,
  `C_Sec_ID` int(11) NOT NULL,
  `Grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`S_ID`,`C_Sec_ID`),
  KEY `sectionid` (`C_Sec_ID`),
  CONSTRAINT `sectionid` FOREIGN KEY (`C_Sec_ID`) REFERENCES `course_section` (`c_sec_id`) ON UPDATE CASCADE,
  CONSTRAINT `studentid` FOREIGN KEY (`S_ID`) REFERENCES `student` (`s_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,1,'A'),(1,4,'A'),(1,6,'B'),(1,9,'B'),(2,1,'C'),(2,5,'B'),(2,6,'A'),(2,9,'B'),(3,1,'C'),(3,12,''),(3,13,''),(4,11,''),(4,12,''),(5,1,'B'),(5,5,'C'),(5,9,'C'),(5,11,''),(5,13,''),(6,11,''),(6,12,'');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculty` (
  `F_ID` int(11) NOT NULL,
  `F_Last` varchar(15) NOT NULL,
  `F_First` varchar(15) NOT NULL,
  `F_MI` char(1) DEFAULT NULL,
  `LocID` int(11) DEFAULT NULL,
  `F_Phone` varchar(11) DEFAULT NULL,
  `F_Rank` varchar(15) DEFAULT NULL,
  `F_Super` int(11) DEFAULT NULL,
  `F_PIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  UNIQUE KEY `fac_pin` (`F_PIN`),
  KEY `fac_loc` (`LocID`),
  KEY `fac_super` (`F_Super`),
  CONSTRAINT `fac_loc` FOREIGN KEY (`LocID`) REFERENCES `location` (`loc_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fac_super` FOREIGN KEY (`F_Super`) REFERENCES `faculty` (`f_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Marx','Teresa','J',9,'3251234567','Associate',4,6339),(2,'Zhulin','Mark','M',10,'3252345678','Full',NULL,1121),(3,'Langley','Colin','A',12,'3253456789','Assistant',4,9871),(4,'Brown','Jonnel','D',11,'3254567890','Full',NULL,8297),(5,'Sealy','James','L',13,'3255678901','Associate',2,6089);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `Loc_ID` int(11) NOT NULL,
  `Bldg_Code` varchar(3) DEFAULT NULL,
  `Room` char(3) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Loc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'CR','101',150),(2,'CR','202',40),(3,'CR','103',35),(4,'CR','105',35),(5,'BUS','105',42),(6,'BUS','404',35),(7,'BUS','421',35),(8,'BUS','211',55),(9,'BUS','424',1),(10,'BUS','402',1),(12,'LIB','217',2),(13,'LIB','222',1);
INSERT INTO `location` VALUES (11,'BUS','433',1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `S_ID` int(11) NOT NULL,
  `S_Last` varchar(15) NOT NULL,
  `S_First` varchar(15) NOT NULL,
  `S_MI` char(1) DEFAULT NULL,
  `S_Address` varchar(25) DEFAULT NULL,
  `S_City` varchar(15) DEFAULT NULL,
  `S_State` varchar(15) DEFAULT NULL,
  `S_Zip` int(5) DEFAULT NULL,
  `S_Phone` varchar(11) DEFAULT NULL,
  `S_Class` char(2) DEFAULT NULL,
  `S_DOB` varchar(11) DEFAULT NULL,
  `S_PIN` int(4) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `Date_enrolled` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`S_ID`),
  UNIQUE KEY `stu_pin` (`S_PIN`),
  KEY `stu_fac` (`FID`),
  CONSTRAINT `stu_fac` FOREIGN KEY (`FID`) REFERENCES `faculty` (`f_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Jones','Tammy','R','1817 Eagleridge Circle','Houston','TX',77027,'3250987654','SR','07/14/86',8891,1,'06/03/03'),(2,'Perez','Jorge','C','951 Rainbow Drive','Abilene','TX',79901,'3258765432','SR','08/19/86',1230,1,'01/10/02'),(3,'Marsh','John','A','1275 W Main St','Dallas','TX',78012,'3257654321','JR','10/10/83',1613,1,'08/24/03'),(4,'Smith','Mike','','428 EN 16 Street','Abilene','TX',79902,'3256543210','SO','09/24/87',1841,2,'08/23/04'),(5,'Johnson','Lisa','M','764 College Drive','Abilene','TX',79901,'3255432109','SO','11/20/87',4420,4,'01/08/05'),(6,'Nguyen','Ni','M','688 4th Street','Ft Worth','TX',78767,'3254321098','FR','12/04/88',9188,3,'08/22/06');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `term` (
  `Term_ID` int(11) NOT NULL,
  `Term_Desc` varchar(15) DEFAULT NULL,
  `Tstatus` varchar(6) NOT NULL,
  `Start_date` char(9) DEFAULT NULL,
  PRIMARY KEY (`Term_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'Fall 2006','CLOSED','08/28/07'),(2,'Spring 2007','CLOSED','01/09/08'),(3,'Summer 2007','CLOSED','05/15/06'),(4,'Fall 2007','CLOSED','08/28/07'),(5,'Spring 2019','OPEN','01/08/08'),(6,'Fall 2018','OPEN','05/07/08');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 23:30:36

select * from student;
select * from faculty;
select * from course;
select * from course_section;
select * from enrollment;
select * from location;
select * from term;



#3a
INSERT INTO lipscomb_registration.course_section VALUES ( 12, 2, 6, 2, 2, 'MTWRF','10:00:00 AM', '11:30:00 AM', 5, 35);
INSERT INTO lipscomb_registration.course_section VALUES ( 12, 2, 6, 2, 2, 'MTWRF','09:00:00 AM', '10:30:00 AM', 6, 35);
INSERT INTO lipscomb_registration.course_section VALUES ( 2, 1, 4, 2, 3, 'TR', '09:30:00 AM', '10:45:00 AM', 4, 35);

#3b
INSERT INTO lipscomb_registration.faculty VALUES ( 4, 'Brown', 'Colin', 'D', 11, '3253456789', 'Assistant', 4, 9871);
INSERT INTO lipscomb_registration.faculty VALUES ( 6, 'Reeves', 'Bob', 'S', 15, '3256789012', 'Full', NULL, 1234);
INSERT INTO lipscomb_registration.faculty VALUES ( 6, 'Reeves', 'Bob', 'S', 10, '3256789012', 'Assistant', 7, 1234);
INSERT INTO lipscomb_registration.faculty VALUES ( 6, 'Reeves', 'Bob', 'S', 10, '3255678901', 'Assistant', 2, 1234);

#3c
INSERT INTO lipscomb_registration.faculty VALUE ( 4, 'CS 120', 'Intro. to Programming in C++', 3);

#3d
select * from term;
DELETE FROM term WHERE Term_ID=4;

#3e
select * from location;
DELETE FROM location WHERE (Loc_ID=11 AND Bldg_Code='BUS' AND Room='222' AND Capacity=1);


#4a
select S_ID, S_First, S_Last
from student natural join enrollment
where Grade in ('A', 'B')
group by S_ID;

#4b
select *
from term
where term_desc like '%2007';

#4c
select Bldg_code, Room, Capacity
from location
order by Bldg_code, Room asc;

#4d
select C_No, C_Name, Credits*730.00 as Tuition_charge
from course;

#4e
select sum(Max_Enrl) as Sum_Enrl,  max(ENRL) as Maximum, 
 min(ENRL) as Minimum, avg(ENRL) as Average
from term as T, course_section as CS, enrollment as E, 
 (SELECT COUNT(*) as ENRL FROM course_section as CS) as ENRL
where T.Term_ID = CS.TermID and CS.C_Sec_ID = E.C_Sec_ID and Term_Desc like '%Fall 2007%'
	AND (SELECT Count(E.S_ID) as ENRL
		 FROM course_section);

#4f
select count(*) as Lisa_Course_Grades
from student natural join enrollment
where S_First = 'Lisa' and S_Last = 'Johnson';

#4g
select Bldg_code, sum(Capacity)
from location
group by Bldg_code
having sum(Capacity) > 100;

#4h
select S_ID, S_Last, S_First, F_ID, F_Last
from student, faculty
where F_ID = FID;

#4i
select F_Last
from ((faculty join course_section on F_ID = FacID) join term on Term_ID = TermID)
where term_desc = 'Summer 2008';

#4j
select C_name, Grade
from student as s, course as c, enrollment as e, course_section as cs
where s.S_ID = e.S_ID and e.C_Sec_ID = cs.C_Sec_ID and CID = C_ID and S_First = 'Tammy' and S_Last = 'Jones';

#4k
select S_First, S_Last, S_Phone from student
union
select F_First, F_Last, F_Phone from faculty;


#5a
SELECT S_First, S_Last
FROM STUDENT 
WHERE S_Class= (
	SELECT S_Class
	FROM STUDENT
	WHERE S_First='Jorge' and S_Last='Perez' );
    
#5b
SELECT S_First, S_Last
FROM STUDENT natural join ENROLLMENT
WHERE C_Sec_ID = (
	SELECT C_Sec_ID
    FROM STUDENT natural join ENROLLMENT
    WHERE S_ID=2 
    Group By S_ID);

#5c
SELECT S_First, S_Last
FROM STUDENT natural join ENROLLMENT
WHERE S_Class= 'SR' AND C_Sec_ID = (
	SELECT C_Sec_ID
    FROM STUDENT natural join ENROLLMENT
    WHERE S_ID=2 
    Group By S_ID);

#5d
SELECT S_First, S_Last
FROM STUDENT natural join ENROLLMENT natural join course_section natural join Location
WHERE Bldg_Code= 'CR' AND C_Sec_ID = (
	SELECT C_Sec_ID
    FROM STUDENT natural join ENROLLMENT
    WHERE S_ID=2 
    Group By S_ID)
Group By S_ID;    

#5e
SELECT distinct(C_Name)
FROM course left join course_section on C_ID=CID natural join enrollment natural join student
where S_Class!='SR'
UNION
SELECT distinct(C_Name)
FROM course left join course_section on C_ID=CID
WHERE TermID=6;

#5f
SELECT distinct(C_Name)
FROM course left join course_section on C_ID=CID natural join enrollment natural join student
where S_Class!='SR' OR C_Name IN (
	SELECT C_Name
	FROM course left join course_section on C_ID=CID
	WHERE TermID=6);

#5g
SELECT C_Name, C_ID, TermID
FROM course left join course_section ON C_ID=CID, enrollment, student
WHERE S_Class='FR' or 'SO' or 'JR' - (
	SELECT Term_ID
    FROM term
    WHERE Term_ID=6)
GROUP BY C_ID;

#5h
select J.F_First, J.F_Last, S.F_First, S.F_Last
from faculty as j, faculty as s
where J.F_Rank = 'Assistant' and J.F_Super = S.F_ID;


#6a
create view faculty_view as 
select F_ID, F_Last, F_First, F_MI, LocID, F_Phone, F_Rank, F_Super
from faculty;

#6b
insert into faculty_view values (6, 'May', 'Lisa', 'I', 11, '3256789012', 'Assistant', null);

#6c
select * from faculty_view;

#6d
# The effect in this case is to show a possible scenario for a potential faculty hire at Lipscomb that they don't want 
# to add to the database yet but they still want to see how it could affect the database if they hired her.
# Also, it makes sure only certain people can access the view.

#6e
select F_First, F_Last, Bldg_code, Room
from faculty_view, location
where Loc_ID = LocID;

#6f
drop view faculty_view;

#6g
# The effect of this makes sure Lisa May isn't stored in the database, and if the view is confidential, it makes sure 
# other people can't access the view.


#7a
UPDATE course_section SET LID=(
	SELECT Loc_ID
    FROM location
    WHERE Bldg_Code='BUS' AND Room=211)
WHERE FacID=(
	SELECT F_ID
    FROM faculty
    WHERE F_Last='Brown');

#7b
DROP TABLE IF EXISTS `enrollment_numbers`;
create table enrollment_numbers (
`Course_Number` varchar(8) not null,
`Course_Section` int not null,
`Number_of_Students` int default null,
constraint `Course` primary key (`Course_Number`, `Course_Section`)
);

insert into enrollment_numbers
select C_no, C_Sec_ID, count(*)
from (((enrollment natural join course_section) join course on C_ID = CID) join term on Term_ID = TermID)
where Term_Desc = 'Fall 2007'
group by C_Sec_ID;

alter table enrollment_numbers add constraint `CNO` foreign key (Course_Number) references course (C_no);
alter table enrollment_numbers add constraint `CSec` foreign key (Course_Section) references course_section (C_Sec_ID);

select * from enrollment_numbers;


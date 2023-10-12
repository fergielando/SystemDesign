/* KEYWORDS
 FT is Full Time 
 PT is Part Time
 UG is UnderGrad  */ 
 

 /* TABLES NEED TO BE ORGANIZED BEFORE IT GETS CREATED 
 DATA WILL BE AFFECTED, THINGS WILL NOT WORK IF NOT ORGANIZED */

-- creating and using database
create database SystemDesign;
use SystemDesign;

-- create user table
create table user(
UID int, -- USER ID
FirstName varchar(100), 
LastName varchar(100), 
Gender varchar(2),
DOB DATE,
Street varchar(100),
City varchar(100),
State varchar(100),
ZipCode varchar(100), 
UserType varchar(100),
primary key (UID) 
);

-- create login table
create table Login( 
UID int,
Email varchar(100),
Password varchar(100),
NumOfLogin varchar(100),
LockedOut bool, -- non zero value true
UserType varchar(100), 
primary key (UID),
foreign key (UID) references user (UID)
);

-- create admin table
create table Admin( 
AdminID int, 
AdminType varchar(100),
primary key (AdminID)
);

-- create admin priotiry table
create table AdminPL0(
AdminID int, 
priorityType varchar(100),
primary key(AdminID),
foreign key (AdminID) references Admin(AdminID)
);

create table AdminPL1(
AdminID int, 
priorityType varchar(100),
primary key(AdminID),
foreign key (AdminID) references Admin(AdminID)
);

-- create Faculty table
create table Faculty(
FacultyID int, 
Position varchar(100),
Specialty varchar(100), 
FacultyType varchar(100),
primary key (FacultyID)
);

-- Buolding 
create table Building(
BuildingID int,
BuildingName varchar(100),
BuildingType varchar(100),
primary key (BuildingID)
);

-- Room
create table Room(
RoomID int,
BuildingID int,
RoomNum int,
primary key (RoomID, BuildingID) ,
foreign key (BuildingID) references Building (BuildingID)
);

-- Office 
create table Office(
RoomID int,
OfficeID varchar(100),
primary key (RoomID,OfficeID),
unique index (OfficeID),
foreign key (RoomID) references Room(RoomID)
);

-- table Part Time Faculty PT
create table FacultyPT(
FacultyID int,
NumOfClass int,
OfficeID varchar(100), -- FK Office ID has ro be created first
primary key(FacultyID),
foreign key (FacultyID) references Faculty(FacultyID),
foreign key (OfficeID) references Office(OfficeID) 
);

-- table Full Time Faculty FT
create table FacultyFT(
FacultyID int,
NumOfClass int,
OfficeID varchar(100), -- FK Office ID has ro be created first
primary key(FacultyID),
foreign key (FacultyID) references Faculty(FacultyID),
foreign key (OfficeID) references Office (OfficeID)
);

-- Department
create table Dept(
DeptID int,
DeptName varchar(100),
ChairID int, 
DeptManager varchar(100),
Email varchar(100),
PhoneNum varchar(100),
RoomID int,
primary key (DeptID),
-- foreign key (ChairID) references BLANK (ChairID), 
foreign key (RoomID) references Room (RoomID)
);

-- Major 
create table Major( 
MajorID int,
DeptID int,
primary key (MajorID),
foreign key (DeptID) references Dept (DeptID)
);

-- Student table 
create table Student(
StudentID int,
MajorID int, -- Major ID has ro be created first
StudentYear varchar(100), -- Freshman,sophomore,junior,senior
StudentType varchar(100), -- undergrad or grad
primary key (StudentID) ,
foreign key (MajorID) references Major (MajorID)
);

-- Student UnderGrad
create table UnderGradStudent(
StudentID int, 
DeptID int, 
UnderGradStudentType varchar(100),
primary key (StudentID),
foreign key (StudentID) references Student (StudentID), 
foreign key (DeptID) references Dept (DeptID)
);

-- Full Time UnderGrad 
create table UnderGradStudentFT(
StudentID int, 
Standing varchar(100),
LowCredits int, -- Min amt Credits
HighCredits int, -- Max amt Credits
CreditEarned int, 
primary key (StudentID),
foreign key (StudentID) references UnderGradStudent (StudentID)
);

-- Part Time UnderGrad 
create table UnderGradStudentPT(
StudentID int, 
Standing varchar(100),
LowCredits int, -- Min amt Credits
HighCredits int, -- Max amt Credits
CreditEarned int, 
primary key (StudentID),
foreign key (StudentID) references UnderGradStudent (StudentID)
);

-- Student Grad
create table GradStudent(
StudentID int, 
DeptID int, 
GradStudentType varchar(100),
primary key (StudentID),
foreign key (StudentID) references Student (StudentID)  , 
 foreign key (DeptID) references Dept (DeptID)
);

-- Full Time Grad 
create table GradStudentFT(
StudentID int, 
Standing varchar(100),
CreditEarned int, 
QualifyExam bool,
Thesis bool,
LowCredits int, -- Min amt Credits
HighCredits int, -- Max amt Credits
primary key (StudentID),
foreign key (StudentID) references GradStudent (StudentID)
);

-- Part Time Grad 
create table GradStudentPT(
StudentID int, 
Standing varchar(100),
CreditEarned int, 
QualifyExam bool,
Thesis bool,
LowCredits int, -- Min amt Credits
HighCredits int, -- Max amt Credits
primary key (StudentID),
foreign key (StudentID) references GradStudent (StudentID)
);

-- Hold Tables
create table Hold(
HoldID int,
StudentID int, 
DateOfHold date,
HoldType varchar(100),
primary key (HoldID),
foreign key (StudentID) references Student (StudentID)
);

-- Enrollment Table 
create table Enrollment(
StudentID int,
CRN int,
Grade varchar(3),
DOE date, -- DATE OF ENROLLMENT
primary key (StudentID), 
foreign key (StudentID) references Student (StudentID)
);

-- Course 
create table Course(
CourseID int, 
CourseName varchar(100),
DeptID int,
Credits int,
Description varchar(100),
CourseType varchar(100),
primary key(CourseID),
foreign key (DeptID) references Dept (DeptID)
);

-- TimeSlot
create table TimeSlot(
TimeSlotID varchar(100),
Day varchar(100), -- EITHER DAY OR DAYID
Period varchar(100),
primary key (TimeSlotID)
);

-- Semester table 
create table Semester(
SemesterID int,
SemesterName varchar(100),
SemesterYear int,
StartTime time,
EndTime time,
primary key (SemesterID)
);

-- Course Section 
create table CourseSection(
CRN int, 
CourseID int,
SectionNum int,
FacultyID int,
TimeSlotID varchar(100),
RoomID int,
SemesterID int,
AvailableSeats int,
primary key (CRN),
foreign key (CourseID) references Course (CourseID) , 
foreign key (FacultyID) references Faculty(FacultyID)  , 
foreign key (TimeSlotID) references TimeSlot (TimeSlotID) , 
foreign key (RoomID) references Room (RoomID) , 
foreign key (SemesterID) references Semester (SemesterID)
);

-- Student History
create table StudentHistory(
StudentID int,
CRN int,
CourseID int,
SemesterID int,
Grade varchar(3),
primary key (StudentID), 
foreign key (StudentID) references Student (StudentID)   ,
foreign key (CRN) references CourseSection (CRN) , 
foreign key (CourseID) references Course (CourseID) , 
foreign key (SemesterID) references Semester (SemesterID) 
);



-- Attendace DOUBLE CHECK MAKE SURE IS CORRECT 
create table Attendance(
StudentID int, 
CRN int, 
CourseID int, 
ClassDate date,
Present bool, 
primary key (StudentID, CRN, ClassDate),
foreign key (StudentID) references Student (StudentID), 
foreign key (CRN) references CourseSection (CRN)  , 
foreign key (CourseID) references Course (CourseID)  
);



-- Lab 
create table Lab(
RoomID int,
NumOfWorkStations int,
primary key (RoomID),
foreign key (RoomID) references Room(RoomID)
);

-- ClassRoom
create table Classroom(
RoomID int,
NumOfSeats int,
primary key (RoomID),
foreign key (RoomID) references Room(RoomID)
);


-- Advisor 
create table Advisor(
StudentID int,
FacultyID int,
DOA date, -- DATE OF ASSIGNMENT
primary key (StudentID),
foreign key (StudentID) references Student (StudentID),
foreign key (FacultyID) references Faculty (FacultyID)
);

-- Faculty History 
create table FacultyHistory(
FacultyID int,
CRN int, 
CourseID int, 
SemesterID int,
primary key (FacultyID),
foreign key (FacultyID) references Faculty (FacultyID),
foreign key (CRN) references CourseSection (CRN),
foreign key (CourseID) references Course (CourseID),
foreign key (SemesterID) references Semester (SemesterID)
);



-- Coure Preq
create table CoursePrerequisite(
CourseID int, 
PRcourseID int, 
MinGrade varchar(3),
DOLU date, -- DATE OF LAST UPDATE
primary key (CourseID, PRcourseID),
foreign key (CourseID) references Course (CourseID)
);


-- Faculty Dept
create table FacultyDept(
FacultyID int,
DeptID int,
PercentTime varchar(100),
DOA date, -- DATE OF APPT.
primary key (FacultyID),
foreign key (DeptID) references Dept (DeptID)
);

-- Creation of Admin table
create table createAdmin(
AdminID int,
DOC date, -- DATE OF CREATION
primary key(AdminID),
foreign key (AdminID) references Admin (AdminID)
);


-- Day 
create table Day(
DayID varchar(100),
WeekDay varchar(100),
primary key (DayID)
);


-- TimeSlot Day
create table TimeSlotDay(
TimeSlotID varchar(100),
DayID varchar(100), -- EITHER DAY OR DAYID
Period varchar(100),
primary key (TimeSlotID),
foreign key (DayID) references Day (DayID)
);


-- Period
create table Period(
PeriodID int,
StartTime time,
EndTime time,
primary key (PeriodID)
);

-- Time Slot Period
create table TimeSlotPeriod(
TimeSlotID varchar(100),
PeriodID int,
primary key (TimeSlotID),
foreign key (PeriodID) references Period (PeriodID)
);

-- Stats office
create table StatsOffice(
StatsID int,
GAD date, -- GIVEN ACCESS DATE 
CLientName varchar(100),
primary key (StatsID)
);

-- Data Generation
create table DataGen(
DatAdminID int,
StatsID int,
DateGenerated varchar(100),
DataType varchar(100),
primary key (DatAdminID),
foreign key (StatsID) references StatsOffice (StatsID)
);


-- Student Major
create table StudentMajor(
MajorID int,
DegreeName varchar(100),
primary key (MajorID), 
foreign key (MajorID) references Major (MajorID) 
);

-- MajorPreq
create table MajorPrerequisite(
MajorID int,
PRmajorID int,
MinGrade varchar(3),
DOLU date, -- DATE OF LAST UPDATE
primary key (MajorID, PRmajorID),
foreign key (MajorID) references Major (MajorID)
);

-- Minor
create table Minor( 
MinorID int,
DeptID int,
primary key (MinorID),
foreign key (DeptID) references Dept (DeptID)
);

-- Student Minor
create table StudentMinor(
MinorID int,
DegreeName varchar(100),
primary key (MinorID), 
foreign key (MinorID) references Minor (MinorID) 
);

-- MinorPreq
create table MinorPrerequisite(
MinorID int,
PRmajorID int,
MinGrade varchar(3),
DOLU date, -- DATE OF LAST UPDATE
primary key (MinorID, PRmajorID),
foreign key (MinorID) references Minor (MinorID)
);

 -- drop database SystemDesign; 








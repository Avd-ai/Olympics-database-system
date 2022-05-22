-- 1) Creation of database :

CREATE DATABASE PROJ_Olympics

-- 2) Creating tables

--          Part A - Lookup tables
  -- We do not need foreign key references here

-- Table 01
CREATE TABLE tblEVENT_TYPE
(Event_type_ID INT IDENTITY(61,1) primary key,
Event_type_name varchar(30) NOT NULL,
Event_type_descr varchar(500) NULL)
GO

-- Table 02
CREATE TABLE tblCOUNTRY
(Country_ID INT IDENTITY(201,1) primary key,
Country_name varchar(30) NOT NULL)
GO

-- Table 03
CREATE TABLE tblGENDER
(Gender_ID INT IDENTITY(1,1) primary key,
Gender varchar(10) NOT NULL,
Gender_descr varchar(500) NULL)
GO

-- Table 04
CREATE TABLE tblMEDAL
(Medal_ID INT IDENTITY(1,1) primary key,
MedalName varchar(10) NOT NULL,
Medal_descr VARCHAR(100) NULL)
GO

-- Table 05
CREATE TABLE tblSPONSORS
(Sponsor_ID INT IDENTITY(9001,1) primary key,
SponsorName varchar(20) NOT NULL,
SponsorDescr varchar(500) NULL)
GO

-- Table 06
CREATE TABLE tblCITY
(City_ID varchar(5) primary key,
City_Name varchar(30) NOT NULL)
GO

-- Table 07
create table tblTICKET_TYPE
(Ticket_type_ID INT IDENTITY(1,1) primary key,
Ticket_type_name varchar(20) NOT NULL,
Ticket_type_descr varchar(500) NULL)
GO

-- Table 08
CREATE TABLE tblVENDOR_TYPE
(Vendor_type_ID INT IDENTITY(1,1) primary key,
Vendor_type_name varchar(50) NOT NULL,
Vendor_type_descr varchar(500) NULL)
GO

-- Table 09
CREATE TABLE tblCUSTOMER
(Customer_ID INT IDENTITY(50001,1) primary key,
CustomerFname varchar(30) NOT NULL,
CustomerLname varchar(30) NOT NULL)

----------------------------------------------

--             Part B - Transactional tables

-- Table 10
CREATE TABLE tblFACILITY
(Facility_ID INT IDENTITY(7001,1) primary key,
City_ID varchar(5) FOREIGN KEY REFERENCES tblCITY(City_ID),
Facility_Name varchar(50) NOT NULL)
GO

-- Table 11
CREATE TABLE tblEVENT
(Event_ID INT IDENTITY(1,1) primary key,
Event_Name varchar(30) NOT NULL,
Event_type_ID INT FOREIGN KEY REFERENCES tblEVENT_TYPE(Event_type_ID) NOT NULL)
GO

-- Table 12
CREATE TABLE tblVENDOR
(Vendor_ID INT IDENTITY(40001,1) primary key,
Vendor_name varchar(50) NOT NULL,
Vendor_type_ID INT FOREIGN KEY REFERENCES tblVENDOR_TYPE(Vendor_type_id) NOT NULL)
GO

-- Table 13
CREATE TABLE tblOLYMPIAD
(Olympics_ID INT IDENTITY(3001,1) primary key,
Country_ID INT FOREIGN KEY REFERENCES tblCOUNTRY(Country_ID) NOT NULL,
[YEAR] INT NOT NULL,
Oly_Start_date Date NOT NULL,
Oly_endDate Date NOT NULL)
GO

-- Table 14
CREATE TABLE tblOLYMPIC_EVENT
(OE_ID INT IDENTITY(5001,1) primary key, 
EVENT_ID INT FOREIGN KEY REFERENCES tblEVENT(Event_ID) NOT NULL,
Olympics_ID INT FOREIGN KEY REFERENCES tblOLYMPIAD(Olympics_ID) NOT NULL,
Facility_ID INT FOREIGN KEY REFERENCES tblFACILITY(Facility_ID) NOT NULL,
DateKey Date)
GO

-- Table 15
CREATE TABLE tblTICKET
(Ticket_ID INT IDENTITY(1,1) primary key,
OE_ID INT FOREIGN KEY REFERENCES tblOLYMPIC_EVENT(OE_ID) NOT NULL,
Vendor_ID INT FOREIGN KEY REFERENCES tblVENDOR(Vendor_ID) NOT NULL,
Customer_ID INT FOREIGN KEY REFERENCES tblCUSTOMER(Customer_ID) NOT NULL,
Ticket_type_ID INT FOREIGN KEY REFERENCES tblTICKET_TYPE(Ticket_type_ID) NOT NULL,
Purchase_count INT NOT NULL,
Purchase_date Date NOT NULL)

-- Table 16
CREATE TABLE tblATHLETE
(Athlete_ID INT IDENTITY(10001,1) primary key,
Country_ID INT FOREIGN KEY REFERENCES tblCOUNTRY(Country_ID) NOT NULL,
AthleteFname varchar(50) NOT NULL,
AthleteLname varchar(50) NOT NULL,
DateOfBirth Date NOT NULL,
Gender_ID INT FOREIGN KEY REFERENCES tblGENDER(Gender_ID) NOT NULL)
GO

-- Table 17
CREATE TABLE tblPARTICIPANT
(Participant_ID INT IDENTITY(200001,1) primary key,
OE_ID INT FOREIGN KEY REFERENCES tblOLYMPIC_EVENT(OE_ID) NOT NULL,
Athlete_ID INT FOREIGN KEY REFERENCES tblATHLETE(Athlete_ID) NOT NULL,
Medal_ID INT FOREIGN KEY REFERENCES tblMEDAL(Medal_ID) NOT NULL)
GO

-- Table 18
CREATE TABLE tblSPONSOR_OLY_EVENT
(spsr_OE_ID INTEGER IDENTITY(1,1) PRIMARY KEY,
Sponsor_ID INT FOREIGN KEY REFERENCES tblSPONSORS(Sponsor_ID) NOT NULL,
OE_ID INT FOREIGN KEY REFERENCES tblOLYMPIC_EVENT(OE_ID) NOT NULL,
Sponsor_amount_$ INT NOT NULL)
 

--   CREATING STORED PROCEDURES FOR EACH TABLE

--              Part A - Stored procedures for look-up tables
 
-- 1) For tblEVENT_TYPE
CREATE PROCEDURE add_sport_event_type
@Ev_typeName varchar(30),
@Ev_typeDescr varchar(500)
AS
INSERT INTO tblEVENT_TYPE (Event_type_name, Event_type_descr)
VALUES(@Ev_typeName, @Ev_typeDescr)
GO

-- 2) For tblCOUNTRY
CREATE PROCEDURE country_names
@CntName varchar(30)
AS
INSERT INTO tblCOUNTRY (Country_Name)
VALUES(@CntName)
GO

-- 3) For tblGENDER
CREATE PROCEDURE add_gender_types
@Gname varchar(10),
@Gdescr varchar(500)
AS
INSERT INTO tblGENDER (Gender, Gender_descr)
VALUES(@Gname, @Gdescr)
GO

-- 4) For tblMEDAL
CREATE PROCEDURE medal_types_four
@Mname varchar(10)  
AS
INSERT INTO tblMEDAL (MedalName)  
VALUES(@Mname)
GO

-- 5) For tblSPONSORS
CREATE PROCEDURE add_sponsor_name
@Sname varchar(20),
@SpDescr varchar(500)
AS
INSERT INTO tblSPONSORS (SponsorName, SponsorDescr)
VALUES(@Sname, @SpDescr)
GO

-- 6) For tblCITY
CREATE PROCEDURE add_city_names
@C_ID varchar(5),
@Cname varchar(30)
AS
INSERT INTO tblCITY (City_ID, City_Name)
VALUES(@C_ID,@Cname)
GO

-- 7) For tblTICKET_TYPE
CREATE PROCEDURE ticket_type_add
@T_typename varchar(20),
@T_typeDescr varchar(500)
AS
INSERT INTO TBLTICKET_TYPE (Ticket_type_name, Ticket_type_descr)
VALUES(@T_typename, @T_typeDescr)
GO

-- 8) For tblVENDOR_TYPE
CREATE PROCEDURE add_vendor_type
@V_typeName varchar(50),
@V_typeDescr varchar(500)
AS
INSERT INTO tblVENDOR_TYPE (Vendor_type_name, Vendor_type_descr)
VALUES(@V_typeName, @V_typeDescr)
GO 

/*
data from another available database. 
The code for that operation is in part_3 file. 
*/


--     Part B - Stored procedures for transactional tables - Referring to only one foreign key

-- 10) For tblFACILITY
CREATE PROCEDURE add_facility
@City_nm varchar(30),
@Facility_nm VARCHAR(50)
AS
DECLARE @City_ID VARCHAR(5)
SET @City_ID = (SELECT City_ID FROM tblCITY
            WHERE City_Name = @City_nm)
INSERT INTO tblFACILITY (City_ID, Facility_Name)
VALUES (@City_ID, @Facility_nm)

-- 11) For tblEVENT
CREATE PROCEDURE add_event
@Event_type_nm varchar(30),
@Event_nm VARCHAR(30)
AS
DECLARE @Event_type_ID INT
SET @Event_type_ID = (SELECT Event_type_ID FROM tblEVENT_TYPE
             WHERE Event_type_name = @Event_type_nm)
INSERT INTO tblevent (Event_Name, Event_type_ID)
VALUES (@Event_nm, @Event_type_ID)

-- 12) For tblVENDOR
CREATE PROCEDURE add_vendor_name
@Vend_Name varchar(50),
@Vend_type_name varchar(50)
AS
DECLARE @Vend_type_ID INT
SET @Vend_type_ID = (SELECT Vendor_type_ID FROM tblVENDOR_TYPE
                      WHERE Vendor_type_name = @Vend_type_name)
INSERT INTO tblVENDOR (Vendor_name, Vendor_type_ID)
VALUES(@Vend_Name, @Vend_type_ID)

-- 13) For tblOLYMPIAD
CREATE PROCEDURE Add_Olympic_extravaganza
@Ctr_name varchar(30),
@Yr INT,
@Ol_start DATE,
@Ol_end DATE
AS
DECLARE @Ctr_ID INT
SET @Ctr_ID = (SELECT Country_ID FROM tblCOUNTRY
              WHERE Country_name = @Ctr_name)
INSERT INTO tblOLYMPIAD (Country_ID, Year, Oly_Start_date, Oly_endDate)
VALUES (@Ctr_ID, @Yr, @Ol_start, @Ol_end)
GO 


--   Part C - Stored procedures for transactional tables - Referring more than one foreign key

-- 14) For tblOLYMPIC_EVENT
CREATE PROCEDURE Add_olympic_event
@Event_nm VARCHAR(30),
@Facil_nm varchar(50),
@Ctr_nm VARCHAR(30),
@Dt DATE
AS
DECLARE @Event_ID INT ,@Olymp_ID INT, @Facil_ID INT
SET @Event_ID = (SELECT Event_ID FROM tblEVENT
             WHERE Event_Name = @Event_nm)
SET @Facil_ID = (SELECT Facility_ID FROM tblFACILITY
             WHERE Facility_Name = @Facil_nm)
SET @Olymp_ID = (SELECT Olympics_ID FROM tblOLYMPIAD
                  JOIN tblCOUNTRY on tblOLYMPIAD.Country_ID = tblCOUNTRY.Country_ID
                  WHERE Country_name =@Ctr_nm)
INSERT INTO tblOLYMPIC_EVENT (EVENT_ID, Olympics_ID, Facility_ID, DateKey)
VALUES (@Event_ID,@Olymp_ID, @Facil_ID, @Dt)

-- 15) For tblTICKET
CREATE PROCEDURE ticket_add       
@vedr_nm  VARCHAR(30),
@Cust_Fname varchar(30),
@Cust_Lname varchar(30),
@Ticket_type_nm varchar(30),
@yr INT,
@event_nm varchar(30),
@Purch_amt INTEGER,
@purch_dt DATE
AS
DECLARE @Cust_ID INT, @Vendr_ID INT, @Tick_type_ID INT, @OE_ID INT
SET @Cust_ID = (SELECT TOP 1 Customer_ID FROM tblCUSTOMER
             WHERE CustomerFname = @Cust_Fname
             AND CustomerLname = @Cust_Lname)
SET @Vendr_ID = (SELeCT Vendor_ID FROM tblVENDOR
             WHERE Vendor_name = @vedr_nm)
SET @Tick_type_ID = (SELECT Ticket_type_ID FROM tblTICKET_TYPE
                 WHERe Ticket_type_name = @Ticket_type_nm)
SET @OE_ID = (SELECT TOP 1 OE.OE_ID FROM tblOLYMPIC_EVENT AS OE
              JOIN tblOLYMPIAD AS OLD ON OE.Olympics_ID = OLD.Olympics_ID
              JOIN tblEVENT ON tblEVENT.Event_ID = OE.EVENT_ID
              WHERE OLD.[YEAR] = @yr
              AND Event_Name  = @event_nm)
INSERT INTO tblTICKET (Ticket_type_ID, OE_ID, Vendor_ID, Customer_ID, Purchase_count, Purchase_date)
VALUES (@Tick_type_ID, @OE_ID, @Vendr_ID, @Cust_ID, @Purch_amt, @purch_dt)


--      Part D - Stored procedures for transactional tables - Using nested stored procedures

--         1) Nested procedures to use in the outer stored procedures

-- a) For retrieving countryID
CREATE PROCEDURE get_countryID
@CName varchar(100),
@CountryID INT OUTPUT
AS
SET @CountryID = (SELECT C.Country_ID FROM tblCOUNTRY C WHERE Country_name = @CName)
GO

-- b) For retrieving genderID
CREATE PROCEDURE get_genderID
@GName varchar (100),
@GenderID INT OUTPUT
AS
SET @GenderID = (SELECT G.Gender_ID FROM tblGENDER G WHERE G.Gender = @GName)
GO

-- c) For retrieving medalID
CREATE PROCEDURE get_medal_ID
@MedalColour varchar(10),
@MID INT OUTPUT
AS
SET @MID = (SELECT Medal_ID FROM tblMEDAL WHERE MedalName = @MedalColour)
GO

-- d) For retrieving sponsorID
CREATE PROCEDURE get_sponsor_ID
@SPName varchar(500),
@SP_ID INT OUTPUT
AS
SET @SP_ID = ( SELECT Sponsor_ID FROM tblSPONSORS WHERE SponsorName = @SPName)
GO

-- e) For retrieving athleteID
CREATE PROCEDURE get_athleteID
@AFName varchar(500),
@ALName varchar(500),
@AID INT OUTPUT
AS
SET @AID = (SELECT Athlete_ID from tblATHLETE WHERE AthleteFname = @AFName AND AthleteLname = @ALName)
GO

-- f) For retrieving oly_eventID
CREATE PROCEDURE get_OE_ID
@EventName varchar(500),
@CountryName varchar(500),
@FacilityName varchar(500),
@OE_ID INT OUTPUT
AS
SET @OE_ID = (SELECT OE_ID FROM tblOLYMPIC_EVENT AS OE
                   JOIN tblOLYMPIAD AS OLYD ON OLYD.Olympics_ID = OE.Olympics_ID
                   JOIN tblFACILITY AS FC ON FC.Facility_ID = OE.Facility_ID
                   JOIN tblEVENT ON tblEVENT.Event_ID = OE.EVENT_ID
                   JOIN tblCOUNTRY ON tblCOUNTRY.Country_ID = OLYd.Country_ID
                   WHERE tblEVENT.Event_Name = @EventName
                   AND tblCOUNTRY.Country_name = @CountryName
                   AND FC.Facility_Name = @FacilityName)
GO


--   2) Actual outer stored procedures that use get_ID nested procedures created above

-- 16) For tblATHLETE
CREATE PROCEDURE add_athlete
@Country varchar (100),
@AFName varchar (100),
@ALName varchar (100),
@DOB Date,
@Gender varchar(100)
AS

DECLARE @GID INT, @CID INT
EXECUTE get_countryID
@CName = @Country,
@CountryID = @CID OUTPUT
EXECUTE get_genderID
@GName = @Gender,
@GenderID = @GID OUTPUT

INSERT INTO tblATHLETE (Country_ID, AthleteFname, AthleteLname, DateOfBirth, Gender_ID)
VALUES (@CID, @AFName, @ALName, @DOB, @GID)
GO

-- 17) For tblPARTICIPANT
CREATE PROCEDURE add_participant
@AthleteFName varchar(500),
@AthleteLName varchar(500),
@Event_Name varchar(500),
@Country_Name varchar(50),
@Facility_Name varchar(100),
@MedalWon varchar(15)
AS
DECLARE @A_ID INT, @M_ID INT, @OEID INT, @E_ID INT
EXECUTE get_OE_ID
@EventName = @Event_Name,
@CountryName = @Country_Name,
@FacilityName = @Facility_Name,
@OE_ID = @OEID OUTPUT
EXECUTE get_athleteID
@AFName = @AthleteFName,
@ALName = @AthleteLName,
@AID = @A_ID OUTPUT
EXECUTE get_medal_ID
@MedalColour = @MedalWon,
@MID = @M_ID OUTPUT

INSERT INTO tblPARTICIPANT (OE_ID, Athlete_ID, Medal_ID)
VALUES (@OEID, @A_ID, @M_ID)
Go

-- 18) For tblSPONSOR_OLY_EVENT
CREATE PROCEDURE add_sponsor_oly_event
@Event_name varchar(500),
@CName varchar(500),
@Facility_Name varchar(500),
@sponsor_name varchar(500),
@SPAmount$ INT
AS

DECLARE @SPID INT, @OEID INT
EXECUTE get_OE_ID
@EventName = @Event_name,
@CountryName = @CName,
@FacilityName = @Facility_Name,
@OE_ID = @OEID OUTPUT
EXECUTE get_sponsor_ID
@SPName = @sponsor_name,
@SP_ID = @SPID OUTPUT

INSERT INTO tblSPONSOR_OLY_EVENT (Sponsor_ID, OE_ID, Sponsor_amount_$)
VALUES (@SPID, @OEID, @SPAmount$)
GO

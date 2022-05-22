--         ESTABLISHING THE BUSINESS RULES FOR ENSURING THE VALID ENTRIES
 
--     1) Each customer can purchase maximum of 10 tickets per purchase instance
CREATE FUNCTION TicketCountLimit() 
RETURNS INTEGER 
AS 
BEGIN 
DECLARE @RET INTEGER = 0 
IF EXISTS (SELECT T.Purchase_count, C.Customer_ID 
FROM tblTICKET T 
JOIN tblCUSTOMER C ON T.Customer_ID = C.Customer_ID 
WHERE T.Purchase_count > 10) 
BEGIN 
SET @RET = 1 
END 
RETURN @RET 
END 
GO 

ALTER TABLE tblTICKET 
ADD CONSTRAINT LessThan10PerCustomer 
CHECK (dbo.TicketCountLimit()=0) 
GO 

--      2) All male athletes must be at least 21 years old

CREATE FUNCTION AthleteAgeLimit() 
RETURNS INTEGER 
AS 

BEGIN 
DECLARE @RET INTEGER = 0 
IF EXISTS (SELECT * 
FROM tblATHLETE AS A 
JOIN tblGENDER G ON A.Gender_ID = G.Gender_ID 
WHERE A.Gender_ID = '1' 

 AND DATEDIFF(YEAR, A.DateOfBirth, GETDATE()) < 21) 
BEGIN 
SET @RET = 1 
END 
RETURN @RET 
END 
GO 

ALTER TABLE tblATHLETE
IMT543 GROUP1 ADD CONSTRAINT MaleAthleteAgeLimit 
CHECK (dbo.AthleteAgeLimit()=0) 
GO

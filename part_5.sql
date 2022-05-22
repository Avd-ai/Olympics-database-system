 --                CREATING COMPUTED COLUMNS
 
--   1) Count of number of ticket sales for each type of ticket - digital and physical tickets
CREATE FUNCTION TicketTypeSale(@PK INT) 
RETURNS NUMERIC(20,0) 
AS 

BEGIN 
DECLARE @RET NUMERIC(14, 2) = (SELECT SUM(Purchase_count) 
FROM tblTICKET T 
JOIN TBLTICKET_TYPE TT ON T.Ticket_type_ID = TT.Ticket_type_ID 
WHERE TT.Ticket_type_ID = @PK 
GROUP BY TT.Ticket_type_ID) 
RETURN @RET 
END 
GO 

ALTER TABLE TBLTICKET_TYPE 
ADD TotalSale AS (dbo.TicketTypeSale(Ticket_type_ID)) 
GO 


--    2) Number of times the customer has completed the transactions (not just number of tickets)
CREATE FUNCTION TotalTicketPurchaseInstance(@PK INT) 
RETURNS NUMERIC(14, 2) 
AS 

BEGIN 
DECLARE @RET NUMERIC(14, 2) = (SELECT COUNT(TICKET_ID) 
FROM tblTICKET T 
JOIN tblCUSTOMER C ON T.Customer_ID = C.Customer_ID 
WHERE C.Customer_ID = @PK 
GROUP BY C.Customer_ID) 
RETURN @RET 
END 
GO 

ALTER TABLE tblCUSTOMER 
ADD CountofPurchaseInstance AS (dbo.TotalTicketPurchaseInstance(Customer_ID)) 
GO

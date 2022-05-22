--                       DATA INSERTION
--    EXECUTING THE STORED PROCEDURES TO ADD ENTRIES INTO THE TABLES
 

--          Part A - Adding entries into Lookup tables
  
--          1) For tblEVENT_TYPE 
EXECUTE add_sport_event_type
@Ev_typeName = 'Swimming',
@Ev_typeDescr = "Swimming is an individual or team racing sport that requires the use of one's entire body to move through water."

EXECUTE add_sport_event_type
@Ev_typeName = 'Archery',
@Ev_typeDescr = 'Members shoot at stationary circular targets at varying distances.'

EXECUTE add_sport_event_type
@Ev_typeName = 'Track and Field',
@Ev_typeDescr = 'Includes athletic contests established on the skills of running, jumping, and throwing. It takes place on a running track and a grass field for the throwing and the jumping events.'

EXECUTE add_sport_event_type
@Ev_typeName = 'Rowing',
@Ev_typeDescr ='It involves propelling a boat (racing shell) on water using oars. Two forms: sweep-oar rowing and sculling.'

EXECUTE add_sport_event_type
@Ev_typeName = 'Football',
@Ev_typeDescr = 'Played on a rectangular field with a goal at each end. The object of the game is to outscore the opposition by moving the ball beyond the goal line into the opposing goal.'

EXECUTE add_sport_event_type
@Ev_typeName = 'Tennis',
@Ev_typeDescr = 'Each player uses a tennis racket that is strung with cord to strike a rubber ball. The player who is unable to return the ball will not gain a point, while the opposite player will.'

EXECUTE add_sport_event_type
@Ev_typeName = 'Boxing',
@Ev_typeDescr = 'A combat sport in which two people, wearing protective gloves and other protective equipment, throw punches at each other in a boxing ring.' 
 
 
--          2) For tblCOUNTRY 
EXEC country_names
@CntName = 'Afghanistan'
EXEC country_names
@CntName = 'Albania'
EXEC country_names
@CntName = 'Algeria'

--For best athletes in 2016
EXEC country_names
@CntName = 'Jamaica'
EXEC country_names
@CntName = 'United States of America'
EXEC country_names
@CntName = 'Great Britain'


EXEC country_names
@CntName = 'Hungary'
EXEC country_names
@CntName = 'India'

-- For olympic host countries
EXEC country_names
@CntName = 'Japan'
EXEC country_names
@CntName = 'Brazil'
EXEC country_names
@CntName = 'China'
EXEC country_names
@CntName = 'Greece'
EXEC country_names
@CntName = 'Australia' 


--          3) For tblGENDER
EXEC add_gender_types
@Gname ='Female',
@Gdescr = 'The  second largest section. Generally physically weaker than the males.'

EXEC add_gender_types
@Gname ='Male',
@Gdescr = 'The largest section in the society. Generally stronger than the females.'


--          4) For tblMEDAL 
EXEC medal_types_four
@Mname ='Gold'
EXEC medal_types_four
@Mname ='Silver'
EXEC medal_types_four
@Mname ='Bronze'
EXEC medal_types_four
@Mname ='None' 


--           5) For tblSPONSOR
EXEC add_sponsor_name
@Sname ='Coca Cola Company',
@SpDescr = 'American multinational beverage corporation. Headquartered in Atlanta, Georgia.
The Coca-Cola Company has interests in the manufacturing, retailing, and marketing of nonalcoholic beverage concentrates and syrups.'

EXEC add_sponsor_name
@Sname ='Airbnb',
@SpDescr = 'American vacation rental online marketplace company based in San Francisco, California.
Airbnb maintains and hosts a marketplace, accessible to consumers on its website or via an app.'

EXEC add_sponsor_name
@Sname ='Samsung',
@SpDescr = 'South Korean multinational conglomerate headquartered in Samsung Town, Seoul.'


--        6) For tblCITY 
EXEC add_city_names
@C_ID = 'Syd',
@Cname = 'Sydney'
EXEC add_city_names
@C_ID = 'Ath',
@Cname = 'Athens'

EXEC add_city_names
@C_ID = 'Bei',
@Cname = 'Beijing'
EXEC add_city_names
@C_ID = 'Lon',
@Cname = 'London'

EXEC add_city_names
@C_ID = 'Rio',
@Cname = 'Rio de Janeiro'
EXEC add_city_names
@C_ID = 'Tok',
@Cname = 'Tokyo' 


--        7) For tblTICKET_TYPE
EXEC ticket_type_add
@T_typename ='Online ticket',
@T_typeDescr = 'The customer will be able to watch the sports events online. The access will be restricted for the specific event.'
EXEC ticket_type_add
@T_typename ='Physical ticket',
@T_typeDescr = 'The customer can visit the Olympic games facilities physically to watch the specific events.' 


--        8) For tblVENDOR_TYPE
EXECUTE add_vendor_type
@V_typeName = 'Digital service provider',
@V_typeDescr = 'The customer will be able to get the digital access to view the  Olympic sports events for a limited time.'

EXECUTE add_vendor_type
@V_typeName = 'Physical ticket service  provider',
@V_typeDescr = 'The customer will be able to visit the  venue holding the  games, and view the specific sports event in person.'


--    Part B - Exception : Adding entries into Lookup tables without using stored procedures
-- 9) For tblCUSTOMER -  We populated this table using different method, by copying from the existing database. Not using the stored procedures. It adds 500,000 customer entries.

INSERT INTO tblCUSTOMER (CustomerFname, CustomerLname)
SELECT TOP 500000 CustomerFname, CustomerLname
FROM peeps.dbo.tblCUSTOMER 



--                    Part C - Adding entries into transaction tables

--         10) For tblFACILITY
EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Japan National Stadium'  -- For track and field
EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Ariake Coliseum'   -- For tennis

EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Sea Forest Waterway'   -- For rowing
EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='International Stadium Yokohama'   -- For football

EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Ryogoku'   -- For boxing
EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Tokyo Acquatic Centre'   -- For swimming

EXECUTE add_facility
@City_nm = 'Tokyo',
@Facility_nm ='Yumeno Park'   -- For archery
EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Olympic Aquatics Stadium'   -- For Swimming

EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Olympic Tennis Centre'   -- For tennis
EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Maracana Stadium'   -- For Football

EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Brazil Olympic Stadium'  -- For track and field
EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Sambo'   -- For Archery

EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Rodrigo Lagoon'   -- For Rowing
EXECUTE add_facility
@City_nm = 'Rio de Janeiro',
@Facility_nm ='Riocentro'   -- For Boxing

EXECUTE add_facility
@City_nm = 'London',
@Facility_nm ='Olympic Stadium'


--       11) For tblEVENT
 
EXEC add_event
@Event_type_nm ='Football',
@Event_nm = "Football - Men"
EXEC add_event
@Event_type_nm ='Football',
@Event_nm = "Football - Women"

EXEC add_event
@Event_type_nm ='Rowing',
@Event_nm = "Men Single Scull"
EXEC add_event
@Event_type_nm ='Rowing',
@Event_nm = "Women Single Scull"

EXEC add_event
@Event_type_nm ='Track and Field',
@Event_nm = "100 mtr Sprint- Men"
EXEC add_event
@Event_type_nm ='Track and Field',
@Event_nm = "100 mtr Sprint- Women"

EXEC add_event
@Event_type_nm ='Track and Field',
@Event_nm = "Javelin throw- Men"
EXEC add_event
@Event_type_nm ='Track and Field',
@Event_nm = "High jump- Women"

EXEC add_event
@Event_type_nm ='Swimming',
@Event_nm = "100 mtrs Freestyle- Men"

EXEC add_event
@Event_type_nm ='Swimming',
@Event_nm = "100 mtrs Butterfly- Women"

EXEC add_event
@Event_type_nm ='Archery',
@Event_nm = "Archery Men- Individual"
EXEC add_event
@Event_type_nm ='Archery',
@Event_nm = "Archery Women- Individual"

EXEC add_event
@Event_type_nm ='Boxing',
@Event_nm = "Boxing Men Heavyweight"
EXEC add_event
@Event_type_nm ='Boxing',
@Event_nm = "Boxing Men Lightweight"

EXEC add_event
@Event_type_nm ='Boxing',
@Event_nm = "Boxing Women Heavyweight"
EXEC add_event
@Event_type_nm ='Boxing',
@Event_nm = "Boxing Women Lightweight"

EXEC add_event
@Event_type_nm ='Tennis',
@Event_nm = "Tennis Men Singles"
EXEC add_event
@Event_type_nm ='Tennis',
@Event_nm ="Tennis Women Singles" 


--          12) For tblVENDOR 

EXEC add_vendor_name
@Vend_name ='ESPN',
@Vend_type_name = 'Digital service provider'
EXEC add_vendor_name
@Vend_name ='NHL Network',
@Vend_type_name = 'Digital service provider'

EXEC add_vendor_name
@Vend_name ='Fox Sports',
@Vend_type_name = 'Digital service provider'
EXEC add_vendor_name
@Vend_name ='Fubo TV',
@Vend_type_name = 'Digital service provider'

EXEC add_vendor_name
@Vend_name ='Hulu',
@Vend_type_name = 'Digital service provider'
EXEC add_vendor_name
@Vend_name ='AT&T',
@Vend_type_name = 'Digital service provider'

EXEC add_vendor_name
@Vend_name ='International Olympic Committee',
@Vend_type_name = 'Physical ticket service  provider'   -- two spaces before 'provider'
EXEC add_vendor_name
@Vend_name ='Infosys',
@Vend_type_name = 'Physical ticket service  provider'   -- two spaces before 'provider’ 



--           13) For tblOLYMPIAD 

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='Australia',
@Yr =2000,
@Ol_start = '15 September, 2000',
@Ol_end = '01 October, 2000'

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='Greece',
@Yr =2004,
@Ol_start = '13 August, 2004',
@Ol_end = '29 August, 2004'

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='China',
@Yr =2008,
@Ol_start = '08 August, 2008',
@Ol_end = '24 August, 2008'

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='Great Britain',
@Yr =2012,
@Ol_start = '27 July, 2012',
@Ol_end = '12 August, 2012'

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='Brazil',
@Yr =2016,
@Ol_start = '05 August, 2016',
@Ol_end = '21 August, 2016'

EXECUTE Add_Olympic_extravaganza
@Ctr_name ='Japan',
@Yr =2020,
@Ol_start = '23 July, 2021',
@Ol_end = '08 August, 2021' 

 
--           14) For tblOLYMPIC_EVENT

--     a) Entries for Brazil Olympics - Rio 
EXECUTE Add_olympic_event
@Event_nm ="Tennis Men Singles",
@Facil_nm ='Olympic Tennis Centre',
@Ctr_nm ='Brazil',
@Dt = '10 August, 2016'
EXECUTE Add_olympic_event
@Event_nm ="Tennis Women Singles",
@Facil_nm ='Olympic Tennis Centre',
@Ctr_nm ='Brazil',
@Dt = '10 August, 2016'

EXECUTE Add_olympic_event
@Event_nm ="100 mtr Sprint- Women",
@Facil_nm ='Brazil Olympic Stadium' ,
@Ctr_nm ='Brazil',
@Dt = '27 July, 2016'
EXECUTE Add_olympic_event
@Event_nm ="100 mtr Sprint- Men",
@Facil_nm ='Brazil Olympic Stadium' ,
@Ctr_nm ='Brazil',
@Dt = '27 July, 2016'

EXECUTE Add_olympic_event
@Event_nm ="High jump- Women",
@Facil_nm ='Brazil Olympic Stadium' ,
@Ctr_nm ='Brazil',
@Dt = '31 July, 2016'
EXECUTE Add_olympic_event
@Event_nm ="Football - Women",
@Facil_nm ='Maracana Stadium',
@Ctr_nm ='Brazil',
@Dt = '16 August, 2016'
EXECUTE Add_olympic_event
@Event_nm ="Football - Men",
@Facil_nm ='Maracana Stadium',
@Ctr_nm ='Brazil',
@Dt = '18 August, 2016'

EXECUTE Add_olympic_event
@Event_nm ="100 mtrs Butterfly- Women",
@Facil_nm ='Olympic Aquatics Stadium',
@Ctr_nm ='Brazil',
@Dt = '12 August, 2016'
EXECUTE Add_olympic_event
@Event_nm ="100 mtrs Freestyle- Men",
@Facil_nm ='Olympic Aquatics Stadium',
@Ctr_nm ='Brazil',
@Dt = '12 August, 2016'

EXECUTE Add_olympic_event
@Event_nm ="Women Single Scull",
@Facil_nm ='Rodrigo Lagoon' ,
@Ctr_nm ='Brazil',
@Dt = '19 July, 2016'

EXECUTE Add_olympic_event
@Event_nm ="Men Single Scull",
@Facil_nm ='Rodrigo Lagoon' ,
@Ctr_nm ='Brazil',
@Dt = '15 July, 2016' 


--     b) Entries for Japan Olympics - Tokyo
 
EXECUTE Add_olympic_event
@Event_nm ="Tennis Women Singles",
@Facil_nm ='Ariake Coliseum', 
@Ctr_nm ='Japan',
@Dt = '29 July, 2020'
EXECUTE Add_olympic_event
@Event_nm ="Tennis Men Singles",
@Facil_nm ='Ariake Coliseum',
@Ctr_nm ='Japan',
@Dt = '29 July, 2020'

EXECUTE Add_olympic_event
@Event_nm ="100 mtr Sprint- Women",
@Facil_nm ='Japan National Stadium' ,
@Ctr_nm ='Japan',
@Dt = '27 July, 2021'
EXECUTE Add_olympic_event
@Event_nm ="100 mtr Sprint- Men",
@Facil_nm ='Japan National Stadium' ,
@Ctr_nm ='Japan',
@Dt = '27 July, 2021'

EXECUTE Add_olympic_event
@Event_nm ="High jump- Women",
@Facil_nm ='Japan National Stadium' ,
@Ctr_nm ='Japan',
@Dt = '28 July, 2021'
EXECUTE Add_olympic_event
@Event_nm ="Football - Women",
@Facil_nm ='International Stadium Yokohama',
@Ctr_nm ='Japan',
@Dt = '16 August, 2021'

EXECUTE Add_olympic_event
@Event_nm ="Football - Men",
@Facil_nm ='International Stadium Yokohama',
@Ctr_nm ='Japan',
@Dt = '16 August, 2021'
EXECUTE Add_olympic_event
@Event_nm ="100 mtrs Butterfly- Women",
@Facil_nm ='Tokyo Acquatic Centre',
@Ctr_nm ='Japan',
@Dt = '03 August, 2021'

EXECUTE Add_olympic_event
@Event_nm ="100 mtrs Freestyle- Men",
@Facil_nm ='Tokyo Acquatic Centre',
@Ctr_nm ='Japan',
@Dt = '2 August, 2021'
EXECUTE Add_olympic_event
@Event_nm ="Women Single Scull",
@Facil_nm ='Sea Forest Waterway' ,
@Ctr_nm ='Japan',
@Dt = '28 July, 2021' 

--     c) Entries for UK Olympics - London
EXECUTE Add_olympic_event
@Event_nm ="100 mtr Sprint- Men",
@Facil_nm ='Olympic Stadium' ,
@Ctr_nm ='Great Britain',
@Dt = '31 July, 2012'


--       15) For tblTICKET
EXECUTE ticket_add
@vedr_nm  = 'FUBO TV',
@Cust_Fname ='Lloyd',
@Cust_Lname ='Thierman',
@Ticket_type_nm ='Online ticket',
@yr =2016,
@event_nm ="Tennis Men Singles",
@Purch_amt =3,
@purch_dt = '18 August, 2016'


--           16) For tblATHLETE 
Execute add_athlete
@Country = 'United States of America',
@AFName ='Michael',
@ALName ='Phelps',
@DOB ='30 June, 1985',
@Gender ='Male'

Execute add_athlete
@Country = 'Jamaica',
@AFName ='Usain',
@ALName ='Bolt',
@DOB ='21 August, 1986',
@Gender ='Male'

Execute add_athlete
@Country = 'United States of America',
@AFName ='Kathleen',
@ALName ='Ledecky',
@DOB ='17 March, 1997',
@Gender ='Female'

Execute add_athlete
@Country = 'United States of America',
@AFName ='Simone',
@ALName ='Biles',
@DOB ='14 March, 1997',
@Gender ='Female'

Execute add_athlete
@Country = 'Great Britain',
@AFName ='Jason',
@ALName ='Kenny',
@DOB ='23 March, 1988',
@Gender ='Male'

Execute add_athlete
@Country = 'Hungary',
@AFName ='Katinka',
@ALName ='Hosszu',
@DOB ='3 May, 1989',
@Gender ='Female'

Execute add_athlete
@Country = 'United States of America',
@AFName ='Ryan',
@ALName ='Murphy',
@DOB ='02 July, 1995',
@Gender ='Male'

Execute add_athlete
@Country = 'India',
@AFName ='Uttam',
@ALName ='H',
@DOB ='12 June, 1993',
@Gender ='Male'

Execute add_athlete
@Country = 'Hungary',
@AFName ='Danuta',
@ALName ='Kozak',
@DOB = ’11 January, 1987',
@Gender ='Female’


--          17) For tblPARTICIPANT 
-- i) Usain Bolt
EXECUTE add_participant
@AthleteFName = 'Usain',
@AthleteLName = 'Bolt',
@Event_Name = "100 mtr Sprint- Men",
@Country_Name ='Brazil',
@Facility_Name ='Brazil Olympic Stadium' ,
@MedalWon = 'Gold'
EXECUTE add_participant
@AthleteFName = 'Usain',
@AthleteLName = 'Bolt',
@Event_Name = "100 mtr Sprint- Men",
@Country_Name ='Great Britain',
@Facility_Name ='Olympic Stadium' ,
@MedalWon = 'Gold'
EXECUTE add_participant
@AthleteFName = 'Usain',
@AthleteLName = 'Bolt',
@Event_Name = "100 mtr Sprint- Men",
@Country_Name ='Japan',
@Facility_Name ='Japan National Stadium' ,
@MedalWon = 'Gold'

--  ii) Michael Phelps
EXECUTE add_participant
@AthleteFName = 'Michael',
@AthleteLName = 'Phelps',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Brazil',
@Facility_Name ='Olympic Aquatics Stadium' ,
@MedalWon = 'Gold'
EXECUTE add_participant
@AthleteFName = 'Michael',
@AthleteLName = 'Phelps',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Japan',
@Facility_Name ='Tokyo Acquatic Centre' ,
@MedalWon = 'Bronze'

--   iii) Kathleen Ledecky
EXECUTE add_participant
@AthleteFName = 'Kathleen',
@AthleteLName = 'Ledecky',
@Event_Name = "100 mtrs Butterfly- Women",
@Country_Name ='Brazil',
@Facility_Name ='Olympic Aquatics Stadium' ,
@MedalWon = 'Gold'
EXECUTE add_participant
@AthleteFName = 'Kathleen',
@AthleteLName = 'Ledecky',
@Event_Name = "100 mtrs Butterfly- Women",
@Country_Name ='Japan',
@Facility_Name ='Tokyo Acquatic Centre' ,
@MedalWon = 'Gold'

--   iv) Katinka Hosszu
EXECUTE add_participant
@AthleteFName = 'Katinka',
@AthleteLName = 'Hosszu',
@Event_Name = "Tennis Women Singles",
@Country_Name ='Brazil',
@Facility_Name ='Olympic Tennis Centre' ,
@MedalWon = 'Bronze'

--  v) Danuta Kozak
EXECUTE add_participant
@AthleteFName = 'Danuta',
@AthleteLName = 'Kozak',
@Event_Name = "Tennis Women Singles",
@Country_Name ='Japan',
@Facility_Name ='Ariake Coliseum'  ,
@MedalWon = 'None'

--    vi) Jason Kenny
EXECUTE add_participant
@AthleteFName = 'Jason',
@AthleteLName = 'Kenny',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Japan',
@Facility_Name ='Tokyo Acquatic Centre' ,
@MedalWon = 'Gold'

--  vii) Ryan Murphy
EXECUTE add_participant
@AthleteFName = 'Ryan',
@AthleteLName = 'Murphy',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Brazil',
@Facility_Name ='Olympic Aquatics Stadium' ,
@MedalWon = 'Bronze'

EXECUTE add_participant
@AthleteFName = 'Jason',
@AthleteLName = 'Kenny',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Brazil',
@Facility_Name ='Olympic Aquatics Stadium' ,
@MedalWon = 'Silver'

EXECUTE add_participant
@AthleteFName = 'Ryan',
@AthleteLName = 'Murphy',
@Event_Name = "100 mtrs Freestyle- Men",
@Country_Name ='Japan',
@Facility_Name ='Tokyo Acquatic Centre'  ,
@MedalWon = 'None'


--        18) For tblSPONSOR_OLY_EVENT 

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtr Sprint- Men",
@CName = 'Brazil',
@Facility_Name = 'Brazil Olympic Stadium',
@sponsor_name = 'Coca Cola Company',
@SPAmount$ = 134990

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtr Sprint- Women",
@CName = 'Brazil',
@Facility_Name = 'Brazil Olympic Stadium',
@sponsor_name = 'Coca Cola Company',
@SPAmount$ = 80000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtrs Freestyle- Men",
@CName = 'Brazil',
@Facility_Name = 'Olympic Aquatics Stadium',
@sponsor_name = 'Samsung',
@SPAmount$ = 65000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtrs Butterfly- Women",
@CName = 'Brazil',
@Facility_Name = 'Olympic Aquatics Stadium',
@sponsor_name = 'Samsung',
@SPAmount$ = 65000

EXECUTE add_sponsor_oly_event
@Event_name = "Tennis Women Singles",
@CName = 'Brazil',
@Facility_Name = 'Olympic Tennis Centre',
@sponsor_name = 'Coca Cola Company',
@SPAmount$ = 135000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtr Sprint- Men",
@CName = 'Japan',
@Facility_Name = 'Japan National Stadium',
@sponsor_name = 'Airbnb',
@SPAmount$ = 115000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtr Sprint- Men",
@CName = 'Japan',
@Facility_Name = 'Japan National Stadium',
@sponsor_name = 'Airbnb',
@SPAmount$ = 115000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtrs Freestyle- Men",
@CName = 'Japan',
@Facility_Name = 'Tokyo Acquatic Centre',
@sponsor_name = 'Airbnb',
@SPAmount$ = 75000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtrs Butterfly- Women",
@CName = 'Japan',
@Facility_Name = 'Tokyo Acquatic Centre',
@sponsor_name = 'Airbnb',
@SPAmount$ = 70000

EXECUTE add_sponsor_oly_event
@Event_name = "Tennis Women Singles",
@CName = 'Japan',
@Facility_Name = 'Ariake Coliseum'  ,
@sponsor_name = 'Coca Cola Company',
@SPAmount$ = 150000

EXECUTE add_sponsor_oly_event
@Event_name = "100 mtr Sprint- Women",
@CName = 'Japan',
@Facility_Name = 'Japan National Stadium',
@sponsor_name = 'Samsung',
@SPAmount$ = 80000


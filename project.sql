--  --------------------------
create schema `Travel_Agency` ;--  
--  --------------------------
CREATE TABLE `Customer`(
`passport_no` DECIMAL(9) NOT NULL,
`fName` varchar(50) NOT NULL,
`lName` varchar(50) NOT NULL ,
`email` varchar(50)  NOT NULL ,
`phone` DECIMAL(15) NOT NULL,
`Gender` varchar(50) CHECK(Gender IN('Male','Female')),
`birth_date` varchar(50) NOT NULL,
constraint Customer_PK primary Key(passport_no));

INSERT INTO Customer (passport_no, fName, lName, email, phone, Gender, birth_date) VALUES 
(12263678, 'Abdullah', 'Al Otaibi', 'abdullah5543@gmail.com', 00966543948775, 'Male','2000-04-17'),
(23456789, 'Jane', 'Doe', 'janedoe@gmail.com', 00922345678901, 'Female','1991-01-11'),
(34567890, 'Hamd', 'Al heseni', 'Hamd_heseni@gmail.com', 0097134567890, 'Male','1985-10-23'),
(45678901, 'Alice', 'Johnson', 'alicejohnson@gmail.com', 00442078917866, 'Female','2000-12-06'),
(12433571, 'Amera', 'Al hazmi', 'Amera1ahazmi@gmail.com', 00966567890123, 'Female', '2000-12-06');

DELETE FROM Customer        
where passport_no=23456789;

INSERT INTO Customer (passport_no, fName, lName, email, phone, Gender, birth_date) VALUES 
(63729264, 'Farah', 'Hamdi', 'Farahh1233@gmail.com', 0020068901600, 'Female', '2002-07-20');

SELECT * -- subqueries
FROM reserva_on
WHERE passport_no IN (
  SELECT passport_no
  FROM customer
  where `total_price`>2000
);

Select *
From customer;
-- ------------------------------------------------
CREATE TABLE `Services` (
`ID` DECIMAL(7) NOT NULL,
`service_name` varchar(50) NOT NULL ,
`price` varchar(50) ,
constraint Services_PK primary Key(ID)
);
   
INSERT INTO Services (ID, service_name, price) VALUES 
(1, 'Healthy food', '100'),
(2, 'Vegetarian food', '150'),
(3, 'Keto meal', '120'),
(4, 'exstra weight', '200'),
(5, 'carry bags', '60'),
(6, 'Delivery to the hotel', '80');

select*
from `Services`;

select *
from `Services`
ORDER BY price DESC;

-- NUMBER OF ALL SERVISES --
select count(*)
from `Services`;

-- ------------------------------------------
CREATE TABLE Seats (
    ID varchar(5) NOT NULL,
    class char(5) NOT NULL,
    price DECIMAL(7) ,
    status varchar(50) CHECK(status IN('Available','Reserved')),
    IATA_code varchar(50),
    CONSTRAINT Seats_PK PRIMARY KEY(ID),
    CONSTRAINT Seats_FK FOREIGN KEY(IATA_code) REFERENCES Flight(IATA_code) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Seats (ID, class, price, status, IATA_code) VALUES 
('AA1','A',2450,'Available','AMS-BER'), -- A class->First class.
('CJ15','C',1900,'Reserved','AMS-GVA'), -- C class->Business class.
('AD3','A',1900,'Reserved','BGY-OMO'),
('YB30','Y',1200,'Available','RUH-MEL'), -- Y class->Premium Economy class.
('BL40','B',900,'Reserved','IST-TBS'), -- B class-> Economy class.
('YK34','Y',1200,'Available','JED-KWI');

select *
from seats;

UPDATE Seats
SET `status`='Reserved'
where `status`='Available'
AND `ID`='YK34';

UPDATE Seats
SET `status`='Reserved'
where `status`='Available'
AND `ID`='AA1';

Select *  -- join
from seats
inner join Reserva_On
on seats.ID = Reserva_On.St_ID;
-- -----------------------------------------------------------------
CREATE TABLE `flight` (
  `IATA_code` VARCHAR(50) NOT NULL,
  `city_code` VARCHAR(50),
  `capacity` DECIMAL(4),
  `departure_time` VARCHAR(10),
  `destination_city` VARCHAR(50),
  `departure_city` VARCHAR(50),
  `ID_AL` DECIMAL(50) NOT NULL,
  CONSTRAINT flight_Pk PRIMARY KEY (IATA_code),
  CONSTRAINT flight_FK FOREIGN KEY (`ID_AL`)
  REFERENCES `AirLine` (ID) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
INSERT INTO flight (IATA_code, city_code, capacity, departure_time, destination_city, departure_city, ID_AL) 
VALUES ('AMS-BER','AMS',798,'22:15:00','Amesterdam','berlin',1), 
       ('JED-KWI','JED',1000,'09:45:00','Jeddah','Kuwait',2), 
	   ('IST-TBS','IST',234,'16:30:00','Istanbul','Tbilisi',5), 
       ('AMS-GVA','AMS',150,'02:25:00' ,'Amesterdam','Geneva',4), 
       ('BGY-OMO','BGY',489,'11:42:00' ,'Milan','Mostar',5), 
	   ('RUH-MEL','RUH',190,'06:55:00' ,'Riyadh','Melbourne',4),
       ('AMS-TBS','AMS',100,'12:00:00' ,'Amsterdam','Tbilisi',3)
       ; 
      select *
      from flight;
      
DELETE FROM flight
WHERE IATA_code = 'RUH-MEL';

UPDATE flight
SET capacity= 1000
where capacity= 860
AND IATA_code='JED-KWI' ;

-- DETERMINR THE NUMBER OF PASSENGER TO EACH CITY--
SELECT destination_city, count(capacity) AS Number_of_passengers
FROM flight
WHERE capacity>100
GROUP BY destination_city
HAVING count(capacity) ;

-- ---------------------------------------------------------
CREATE TABLE AirLine (
  ID DECIMAL(50) PRIMARY KEY,
  name VARCHAR(50),
  location VARCHAR(50),
  ID_EP DECIMAL(50),
  start_manage DATE
);

INSERT INTO AirLine (ID, name, location, ID_EP, start_manage)
VALUES
  (1, 'Air France', 'France', 1234, '2022-01-01'),
  (2, 'British Airways', 'UK', 5678, '2022-02-01'),
  (3, 'Lufthansa', 'Germany', 9012, '2022-03-01'),
  (4, 'Emirates', 'UAE', 3456, '2022-04-01'),
  (5, 'Delta Air Lines', 'USA', 7890, '2022-05-01');

select * 
from  AirLine;

UPDATE AirLine
SET location = 'France'
WHERE name = 'Air France'
AND ID=1;


 SELECT location, COUNT(*) FROM AirLine GROUP BY location;

 SELECT location, MAX(start_manage) FROM AirLine GROUP BY location;

 SELECT location, AVG(ID_EP) FROM AirLine GROUP BY location HAVING AVG(ID_EP) > 102;

 SELECT * FROM AirLine ORDER BY start_manage ASC;

 SELECT *
FROM AirLine 
WHERE
location IN 
 (SELECT location
  FROM AirLine
  WHERE name = 'Emirates');
            
 SELECT * FROM AirLine WHERE location = (SELECT location FROM AirLine WHERE name = 'Lufthansa');
-- -----------------------------------------------------------------------------
CREATE TABLE `Employee`(
`Employee_ID` DECIMAL(50) NOT NULL,
`fName` varchar(50) NOT NULL,
`lName` varchar(50) NOT NULL ,
`address` varchar(50)  NOT NULL ,
`salary` DECIMAL(7,2) NOT NULL,
`phone_No` DECIMAL(15)Not null,
`commission` varchar(50),
`hireDate` VARCHAR(11) NOT NULL,
`bonus` DECIMAL(50) ,
`email` varchar(50) NOT NULL,
`ID_AL` DECIMAL(50) NOT NULL,
constraint Employee_PK primary Key(Employee_ID),
constraint Employee_FK foreign key (`ID_AL`) references AirLine(ID) ON DELETE cascade ON UPDATE CASCADE 
);

INSERT INTO Employee (Employee_ID, fName, lName, address, salary,phone_No, commission, hireDate, bonus, email,ID_AL) VALUES 
(5437, 'Mohammed', 'Al Qahtani','Jeddah' ,'5300','009665488748765','%5','9-8-1998','0','mQathani5543@gmail.com',1),
(5432, 'jhone', 'Hider','Bangkuk' ,'4800','009665857264857','%5','29-6-1991','8 ','jhone3@gmail.com',2),
(4828, 'Sedra', 'Al Ali','Makkah' ,'5300','009665674120472','%2','16-12-2000','12','sedra21@gmail.com',3),
(2599, 'Maha', 'Al Ansari','yunbu' ,'5000','009665663452889','%8','23-2-1995','2','mansari4@gmail.com',4),
(3267, 'Ahmed', 'rashed','Jeddah' ,'4750','00966555573256','%0','14-8-1997','55','ahmed66@gmail.com',5);

UPDATE Employee
SET `Salary`='5200'
where `Salary`='5000'
AND Employee_ID=2599;

DELETE FROM Employee
where Employee_ID=2599;

select *
from `Employee`
Where salary > 4750;
 
select *
From Employee;
-- ------------------------------------------------
create table Reserva_On(
Passport_No DECIMAL(9)not null,
serv_ID DECIMAL(7)not null,
St_ID VARCHAR(5)not null,
Date Date,
total_price DECIMAL(7,2),
Note varchar(50),
 constraint Reserva_OnPK primary Key (Passport_No,serv_ID,St_ID),
 constraint Reserva_OnFK1 foreign key (Passport_No) references Customer (passport_no) ON DELETE cascade ON UPDATE CASCADE,
 constraint Reserva_OnFK2 foreign key (serv_ID) references services (ID) ON DELETE cascade ON UPDATE CASCADE  ,
 constraint Reserva_OnFK3 foreign key (St_ID) references seats (ID) ON DELETE cascade ON UPDATE CASCADE );
 
 INSERT INTO Reserva_On (Passport_No, serv_ID, St_ID, Date, total_price, Note) VALUES
 (63729264,2,'CJ15','23-6-27', 2050, 'Business calss'),
 (34567890,4,'AD3','23-12-16',2650, 'First calss'),
 (45678901,1,'BL40','23-7-6', 1000, 'Business calss'),
 (12433571,5,'YK34','23-9-21', 1260, 'Premium Economy calss'),
 (12263678,6,'AA1','23-11-8', 2539, 'First calss');

SELECT *
FROM Reserva_On;

 -- CALCULATE TAX --
 UPDATE Reserva_On 
 SET `total_price` = total_price + total_price*0.1
 WHERE `total_price`>0
 AND `Passport_No`>0 ;
 

Select *  -- join
from Customer
inner join Reserva_On
on Customer.passport_no = Reserva_On.passport_no;

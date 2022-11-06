drop table if exists FLIGHT;
drop table if exists AIRCRAFT;
drop table if exists PILOT;
drop table if exists DEPARTURES;
drop table if exists ASSIGNED_TO;
drop table if exists EMPLOYEE;
drop table if exists CUSTOMER;
drop table if exists BOOKED_ON;
drop table if exists PLANE_TYPE;


CREATE TABLE FLIGHT
( Flight_num      INT               NOT NULL,
  origin          CHAR(3)           NOT NULL,
  dest            CHAR(3)           NOT NULL,
  dep_time        VARCHAR(5)        NOT NULL,
  arr_time        VARCHAR(5)        NOT NULL, 
PRIMARY KEY (Flight_num) );

CREATE TABLE AIRCRAFT
( Serial_no      VARCHAR(6)       NOT NULL,
  Model_no       VARCHAR(6)       NOT NULL,
PRIMARY KEY (Serial_no) );

CREATE TABLE BOOKED_ON
( Customer_Name   VARCHAR(40)   NOT NULL, 
  Departure_Date  DATE          NOT NULL,
  Flight_Num      INT           NOT NULL, 
 PRIMARY KEY (Customer_Name) );

CREATE TABLE DEPARTURES
( DEPARTURE_Date           DATE              NOT NULL,
  Flight_Number            INT               NOT NULL,
  Aircraft_serial_no       VARCHAR(5), 
PRIMARY KEY (Flight_Number, Departure_date),
FOREIGN KEY (Flight_Number) REFERENCES FLIGHT(Flight_num) );


CREATE TABLE CUSTOMER
( fname          VARCHAR(10)    NOT NULL,
  last_name      VARCHAR(30)    NOT NULL,
  street         VARCHAR(20)    NOT NULL,
  city           VARCHAR(20)    NOT NULL,
  state_         CHAR(2)        NOT NULL,
  zip_code       VARCHAR(10)    NOT NULL,
  phone          VARCHAR(12)    NOT NULL
);

CREATE TABLE EMPLOYEE
( Employee_no     INT              NOT NULL,
  Tname           VARCHAR(40)      NOT NULL,
  Salary          DECIMAL(6)       NOT NULL,
PRIMARY KEY (Tname),
UNIQUE (Employee_no)
);

CREATE TABLE PLANE_TYPE
( Model_no       VARCHAR(6)       NOT NULL,
  Manufacturer   VARCHAR(20)      NOT NULL,
PRIMARY KEY (Model_no)
);

CREATE TABLE PILOT
( pilot_enum             INT              NOT NULL,
  Tname                  VARCHAR(40)      NOT NULL,
  License_date           DATE             NOT NULL,
  Plane_model_can_fly    VARCHAR(6)       NOT NULL,
PRIMARY KEY (License_date, pilot_enum),
FOREIGN KEY (Tname) REFERENCES EMPLOYEE(Tname)
);

CREATE TABLE ASSIGNED_TO
( Employee_no          INT               NOT NULL,
  dep_date             DATE              NOT NULL,
  flight_num           INT               NOT NULL,
PRIMARY KEY (Employee_no, flight_num, dep_date),
FOREIGN KEY (flight_num) REFERENCES FLIGHT(flight_num) 
);

ALTER TABLE CUSTOMER ADD COLUMN id SERIAL PRIMARY KEY;

INSERT INTO CUSTOMER
VALUES      ('Rose', 'Parker', '123 Thomas St.', 'Toledo', 'OH', '57556', '801-556-2239'),
            ('Jessica', 'Jones', '234 Pines St.', 'Los Angeles', 'CA', '34898', '801-552-2943'),
            ('Bryan', 'Brown', '435 Palm St.','Miami', 'FL', '30533', '801-933-2320'),
            ('John', 'Peters', '345 Star St.', 'Raleigh', 'NC', '79999', '801-393-2230'),
            ('Mark', 'Williams', '348 Andrew St.','Fort Lauderdale', 'FL', '33318', '801-343-2320'),
            ('Carol', 'Phillips', '395 Pine St.','Omaha', 'NE', '88899', '801-323-2320'),
            ('Madison', 'Parker', '285 Diamond St.','San Diego', 'CA', '99977', '801-493-2203'),
            ('Justin', 'Colano', '223 Easy St.', 'Tampa', 'FL', '66798', '801-193-2320'),
            ('Claudia', 'Stevens', '775 Main St.','Saint Louis', 'MO', '99878', '801-303-2222'),
            ('Arthur', 'Hooper', '456 Rose St.', 'Las Vegas', 'NV', '17878', '313-912-2101'),
            ('Sergio', 'Ryan', '567 Spruce St.','Lincoln', 'NE', '87898', '801-228-6729'),
            ('Julia', 'Maverick', '678 Tulip St.','Raleigh', 'NC', '79999', 'NULL'),
            ('Brandon', 'Gordon', '789 First St.','Miami', 'FL', '30533', 'NULL');

INSERT INTO BOOKED_ON
VALUES      ('Rose Parker', 'Oct-31-2018', 100),
            ('Bryan Brown', 'Oct-31-2018', 206),
            ('Arthur Hooper', 'Oct-31-2018', 334),
            ('Sergio Ryan', 'Oct-31-2018', 449),
            ('Brandon Gordon', 'Nov-1-2018', 991),
            ('Madison Parker', 'Nov-1-2018', 991),
            ('Mark Williams', 'Nov-1-2018', 100),
            ('Carol Phillips', 'Nov-1-2018', 100),
            ('Justin Colano', 'Oct-31-2018', 449),
            ('Claudia Stevens', 'Oct-31-2018', 449),
            ('Julia Maverick', 'Nov-1-2018', 991),
            ('John Peters', 'Nov-1-2018', 100);
           
INSERT INTO EMPLOYEE
VALUES      (1001, 'John Jones', 90000),
            (1002, 'Albert Peters', 85000),
            (1003, 'Carl Rowe', 115000),
            (1004, 'Phillips', 25000),
            (1005, 'William Gates', 50000),
            (1006, 'Robert Clark', 45000),
            (1007, 'Joseph Warnock', 50000),
            (1008, 'Lisa Stuart', 75000);

INSERT INTO PLANE_TYPE
VALUES      ('B1110', 'B727'),
            ('B1325', 'B727'),
            ('B1088', 'B747'),
            ('B1419', 'B747'),
            ('B2244', 'B757'),
            ('B9377', 'B757'),
            ('D2101', 'DC9'),
            ('D2216', 'DC9'),
            ('D2333', 'DC9'),
            ('D2429', 'DC9'),
            ('D2530', 'DC10'),
            ('A7099', 'A310'),
            ('A8055', 'A320');

INSERT INTO AIRCRAFT
VALUES      ('B727', 'Boeing'),
            ('B747', 'Boeing'),
            ('B757', 'Boeing'),
            ('DC9', 'MD'),
            ('DC10', 'MD'),
            ('A310', 'Airbus'),
            ('A320', 'Airbus'),
            ('A330', 'Airbus'),
            ('A340', 'Airbus');

INSERT INTO PILOT
VALUES      (1001, 'John Jones', 'JUNE-1-1999', 'B727'),
            (1001, 'John Jones', 'AUG-14-2000', 'B747'),
            (1001, 'John Jones', 'APRIL-20-2005', 'DC10'),
            (1002, 'Albert Peters', 'SEP-25-2010', 'DC9'),
            (1002, 'Albert Peters', 'APRIL-20-2005', 'A310'),
            (1002, 'Albert Peters', 'JULY-17-2003', 'B757'),
            (1002, 'Albert Peters', 'MAY-28-2012', 'A320'),
            (1002, 'Albert Peters', 'DEC-01-2015', 'B727'),
            (1003, 'Carl Rowe', 'JAN-25-2013', 'A310'),
            (1003, 'Carl Rowe', 'JUNE-05-2015', 'DC9');

INSERT INTO FLIGHT
VALUES      (100, 'SLC', 'BOS', '8:00', '17:50'),
            (206, 'DFW', 'STL', '9:00', '11:40'),
            (334, 'ORD', 'MIA', '12:00', '14:14'),
            (335, 'MIA', 'ORD', '15:00', '17:14'),
            (336, 'ORD', 'MIA', '18:00', '20:14'),
            (337, 'MIA', 'ORD', '20:30', '23:53'),
            (121, 'STL', 'SLC', '7:00', '9:13'),
            (122, 'STL', 'YYV', '8:30', '10:19'),
            (330, 'JFK', 'YYV', '16:00', '18:53'),
            (991, 'BOS', 'ORD', '17:00', '18:22'),
            (394, 'DFW', 'MIA', '19:00', '21:30'),
            (395, 'MIA', 'DFW', '21:00', '23:43'),
            (449, 'CDG', 'DEN', '10:00', '19:29'),
            (930, 'YYV', 'DCA', '13:00', '16:10'),
            (931, 'DCA', 'YYV', '17:00', '18:10'),
            (932, 'DCA', 'YYV', '18:00', '19:10'),
            (112, 'DCA', 'DEN', '14:00', '18:07');

INSERT INTO DEPARTURES
VALUES      ('Oct-31-2018', 100, 'B1110'),
            ('Oct-31-2018', 112, 'NULL'),
            ('Oct-31-2018', 206, 'D2530'),
            ('Oct-31-2018', 334, 'NULL'),
            ('Oct-31-2018', 335, 'NULL'),
            ('Oct-31-2018', 337, 'D2216'),
            ('Oct-31-2018', 449, 'NULL'),
            ('Nov-1-2018', 100, 'D2530'),
            ('Nov-1-2018', 112, 'A8055'),
            ('Nov-1-2018', 206, 'NULL'),
            ('Nov-1-2018', 334, 'NULL'),
            ('Nov-1-2018', 395, 'NULL'),
            ('Nov-1-2018', 991, 'B1325');
            
INSERT INTO ASSIGNED_TO           
VALUES      (1001, 'Oct-31-2018', 100),
            (1003, 'Oct-31-2018', 100),
            (1004, 'Oct-31-2018', 100),
            (1002, 'Oct-31-2018', 206),
            (1007, 'Oct-31-2018', 206),
            (1003, 'Oct-31-2018', 337),
            (1004, 'Oct-31-2018', 337),
            (1005, 'Oct-31-2018', 337),
            (1006, 'Oct-31-2018', 337),
            (1001, 'Nov-1-2018', 100),
            (1005, 'Nov-1-2018', 100),
            (1007, 'Nov-1-2018', 100),
            (1003, 'Nov-1-2018', 991),
            (1006, 'Nov-1-2018', 991),
            (1007, 'Nov-1-2018', 991),
            (1002, 'Nov-1-2018', 112),
            (1004, 'Nov-1-2018', 112),
            (1008, 'Nov-1-2018', 112);


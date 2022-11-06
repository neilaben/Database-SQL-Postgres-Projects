drop table if exists Specialty CASCADE;
drop table if exists Doctor CASCADE;
drop table if exists Specialized CASCADE;
drop table if exists Receptionist CASCADE;
drop table if exists Room CASCADE;
drop table if exists Patient CASCADE;
drop table if exists Appointment CASCADE;
drop table if exists Treatment CASCADE;
drop table if exists Medicine CASCADE;
drop table if exists Employee CASCADE;
drop table if exists Nurse CASCADE;

CREATE TABLE Employee
(  EmployeeName     varchar(10),
   LastName         varchar(10),
   Emp_SSN          int             PRIMARY KEY,
   DOB              int,
   HouseNo          int,
   Age              int,
   Street           varchar(50),
   city             varchar(50),
   States           char(2),
   zip              int,
   sex              char(1),
   salary           decimal(18,0),
   Phone            varchar(10),
   EmployeeType     varchar(50),
   EmployeeNumber   int
);


CREATE TABLE Nurse
(   Emp_Number      int             PRIMARY KEY,
    Emp_SSN         int             ,
    FOREIGN KEY (Emp_SSN) REFERENCES Employee(Emp_SSN)
);

CREATE TABLE Specialty
(
    SpecialtyName   varchar(50)    PRIMARY KEY,
    Descript        varchar(50)
);

CREATE TABLE Doctor
(
    Emp_Number      int           PRIMARY KEY,
    Emp_SSN         int           ,
    FOREIGN KEY (Emp_SSN) REFERENCES Employee(Emp_SSN))
;

CREATE TABLE Specialized
(
    Emp_Number         int             ,
    SpecialtyName      varchar(50)     ,
    FOREIGN KEY (Emp_Number) REFERENCES Doctor(Emp_Number),
    FOREIGN KEY (SpecialtyName) REFERENCES Specialty(SpecialtyName)
);

CREATE TABLE Receptionist
(
    Emp_Number          int         PRIMARY KEY,
    Emp_SSN             int         ,
    FOREIGN KEY (Emp_SSN) REFERENCES Employee(Emp_SSN)
);

CREATE TABLE Room
(
    RoomNumber         int              PRIMARY KEY,
    RoomType           varchar(50),
    Periods            varchar(10),
    Emp_Number         int        , 
    FOREIGN KEY (Emp_Number) REFERENCES Nurse(Emp_Number)
);

CREATE TABLE Patient
(
    Patient_SSN         int             PRIMARY KEY,
    PatientName         varchar(50),
    LastName            varchar(50),
    houseno             int,
    Street              varchar(50),
    city                varchar(50),
    states              char(2),
    ZIP                 int,
    Sex                 char(1),
    Phone               int,
    DOB                 int,
    age                 int, 
    AdmittedDate        int,
    DischargedDate      varchar(20),
    RoomNumber          int,             
    Emp_Number          int,   
    ER                  boolean,
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
    FOREIGN KEY (Emp_Number) REFERENCES Doctor(Emp_Number)
);

CREATE TABLE Appointment
(
    recordNumber        int             PRIMARY KEY,
    appoitmentDate      int,
    observation         varchar(50),
    Patient_SSN         int,             
    Emp_Number          int,             
    FOREIGN KEY (Emp_Number) REFERENCES Receptionist(Emp_Number),
    FOREIGN KEY (Patient_SSN) REFERENCES Patient(Patient_SSN)
);

CREATE TABLE Treatment
(
    TreatmentNo             int     PRIMARY KEY,
    medicineQuantity        int,
    Patient_SSN             int,     
    FOREIGN KEY (Patient_SSN) REFERENCES Patient(Patient_SSN)
);

CREATE TABLE Medicine
(
    code                    int              PRIMARY KEY,
    Descript                varchar(50),
    Price                   decimal(18,0),
    TreatmentNo             int,              
    FOREIGN KEY (TreatmentNo) REFERENCES Treatment(TreatmentNo)
);


INSERT INTO EMPLOYEE
VALUES      ('John', 'Smith',123456789, 1965-01-09, 731, 57, 'Fondren', 'Houston', 'TX' , 77001, 'M', 45000, 3334459555, 'Receptionist', 1006),
            ('Franklin','Wong',333445555, 1965-12-08, 638, 58, 'Voss', 'Houston', 'TX', 77001, 'M', 50000, 8886655655, 'Receptionist', 1007),
            ('Alicia', 'Zelaya' ,999887777, 1968-01-19, 3321, 54,'Castle', 'Spring', 'TX', 44598, 'F', 64000, 9876547321, 'Nurse', 1005),
            ('Jennifer','Wallace',987654321, 1961-06-20, 291, 61,'Berry', 'Bellaire', 'TX', 77401, 'F', 68000,8886965555, 'Nurse', 1004),
            ('Ramesh','Narayan',666884444, 1962-09-15, 975, 60,'Fire Oak', 'Humble', 'TX', 77380,'M',65000 ,3334465555, 'Nurse', 1003),
            ('Joyce','English',453453453, 1972-07-31, 5631, 50,'Rice', 'Houston', 'TX', 77006, 'F', 83000,3334455855, 'Doctor', 1002),
            ('Ahmad','Jabbar',987987987, 1969-03-29, 980, 59,'Dallas', 'Houston', 'TX', 77009, 'M', 85000 ,9876543921, 'Doctor', 1001),
            ('James','Borg', 888665555, 1957-11-10, 450, 65,'Stone', 'Houston', 'TX', 78258, 'M', 80000, 5987654321, 'Doctor', 1000);

INSERT INTO Doctor
VALUES      (1000, 888665555),
            (1001, 987987987),
            (1002, 453453453);
            
INSERT INTO Nurse            
VALUES      (1003 ,666884444 ),
            (1004 ,987654321 ),
            (1005 ,999887777 );

INSERT INTO Receptionist
VALUES      (1006 ,123456789 ),
            (1007 ,333445555 );
            
INSERT INTO Room
VALUES      (100, 'single bed', '1 day', 1003),
            (101, 'double bed', '30 day', 1003),
            (102, 'double bed', '1 day', 1003),
            (103, 'single bed', '0 day', 1004),
            (104, 'single bed', '3 day', 1004),
            (105, 'double bed', '0 day', 1004),
            (106, 'single bed', '7 day', 1005),
            (107, 'single bed', '3 day', 1005);

INSERT INTO Patient
VALUES      (000000000 ,'Rose', 'Parker', 123, 'Thomas St.', 'Toledo', 'OH', 57556, 'F', 801-556-2239, 06-01-1999, 23,10-29-2018, '10-30-2018', 100, 1000, '0'),
            (000000001 ,'Jessica', 'Jones', 234, 'Pines St.', 'Los Angeles', 'CA', 34898, 'F', 801-552-2943, 07-10-1999, 23, 11-01-2018, '11-30-2018', 101, 1000, '0'),
            (000000002 ,'Bryan', 'Brown', 435, 'Palm St.','Miami', 'FL', 30533, 'M', 801-933-2320, 02-25-1942, 80, 11-01-2018, '11-13-2018', 101, 1000, '1'),
            (000000003 ,'John', 'Peters', 345, 'Star St.', 'Raleigh', 'NC', 79999, 'M', 801-393-2230, 03-10-1972, 50, 12-05-2018, '12-06-2018', 102, 1001, '0'),
            (000000004 ,'Mark', 'Williams', 348, 'Andrew St.','Fort Lauderdale', 'FL', 33318, 'M', 801-343-2320, 05-13-1989, 33, 11-01-2018, '11-01-2018', 103, 1001, '0'),
            (000000005 ,'Carol', 'Phillips', 395, 'Pine St.','Omaha', 'NE', 88899, 'F', 801-323-2320, 07-08-1997, 25, 09-05-2018, '09-08-2018', 104, 1001, '0'),
            (000000006 ,'Madison', 'Parker', 285, 'Diamond St.','San Diego', 'CA', 99977, 'F', 801-493-2203, 04-04-1999, 23, 08-01-2019, '08-01-2019', 105, 1002, '0'),
            (000000007 ,'Justin', 'Colano', 223, 'Easy St.', 'Tampa', 'FL', 66798, 'M',801-193-2320, 04-24-1975, 47, 08-21-2019, '08-30-2019', 106, 1002, '1'),
            (000000008 ,'Claudia', 'Stevens', 775, 'Main St.','Saint Louis', 'MO', 99878, 'F', 801-303-2222, 02-29-1992, 30, 05-01-2019, '05-04-2019', 107, 1002, '0');

INSERT INTO Specialty            
VALUES      ('Cardiologist', 'heart doctor'),
            ('Pulmonologist', 'lung doctor'),
            ('Nephrologist', 'kidney doctor'),
            ('ENT', 'ear, nose, throat doctor'),
            ('Neurologist', 'brain doctor'), 
            ('Endocrinologist', 'hormone doctor'); 

INSERT INTO Specialized
VALUES      (1000, 'Pulmonologist'),
            (1001, 'ENT'),
            (1002, 'Cardiologist');
            
INSERT INTO Appointment
VALUES      (1110, 10-29-2018, 'asthma', 000000000, 1006),
            (1101, 11-01-2018, 'looks fine', 000000001, 1006),
            (1011, 11-01-2018, 'looks fine', 000000002, 1006),
            (0111, 12-05-2018, 'asthma', 000000003, 1006),
            (1100, 11-01-2018, 'halloween fun', 000000004, 1006),
            (1000, 09-08-2018, 'clammy', 000000005, 1007),
            (1001, 08-01-2019, 'cold', 000000006, 1007),
            (1010, 08-30-2019, 'pale', 000000007, 1007),
            (1111, 05-01-2019, 'halloween fun', 000000008, 1007);

INSERT INTO Treatment
VALUES      (200, 4, 000000008),
            (201, 1, 000000008),
            (203, 10, 000000001),
            (204, 2, 000000002),
            (205, 8, 000000003),
            (206, 30, 000000003),
            (207, 30, 000000005);

INSERT INTO Medicine
VALUES      (10, 'inhaler', 20.00, 200),
            (11, 'asprin', 10.00, 201),
            (12, 'cpap', 100.50, 203),
            (13, 'inhaler 2', 30.00, 204),
            (14, 'oxycodine', 300.00, 205),
            (15, 'tylenol', 5.00, 206),
            (16, 'vitamine d', 1.00, 206),
            (17, 'ibuprofen', 1.50, 207);


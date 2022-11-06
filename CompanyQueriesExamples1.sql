select 
    *
from
    department;

select 
    *
from
    employee
where
    bdate between '1966-10-09' and '1988-10-09'


select 
    fname, Lname, BDATE, ADDRESS
from
    employee
where
    FNAME = 'John' and MINIT = 'B'
        and LNAME = 'Smith';

select 
    FNAME, LNAME, ADDRESS, DNAME
from
    employee,
    department
where
    DNO = DNUMBER and DNAME = 'Research';
    
select 
    FNAME, LNAME, ADDRESS, DNAME
from
    employee E
        inner join
    department D on (E.dno = D.dnumber)
where
    DNAME = 'Research';

select 
    FNAME, LNAME, ADDRESS, DNO
from
    employee,
    department
where
    DNUMBER = DNO;

select 
    FNAME, LNAME, ADDRESS, DNO
from
    employee
        join
    department on (department.dnumber = employee.dno)
where
    DNUMBER = DNO;


select 
    fname, lname, address, dno
from
    employee
where
    5 = dno;


select 
    PNUMBER, Pname, DNUM, DNAME, LNAME, BDATE, ADDRESS
from
    project,
    department,
    employee
where
    DNUM = DNUMBER and MGR_SSN = SSN
        and PLOCATION = 'Stafford';
                

select 
    PNUMBER, Pname, DNUM, DNAME, LNAME, BDATE, ADDRESS
from
    PROJECT P
        join
    DEPARTMENT D
    join EMPLOYEE E on D.MGR_SSN = E.ssn on P.Dnum = D.Dnumber
where
    PLOCATION = 'Stafford';
                
select 
    EMPLOYEE.FNAME, EMPLOYEE.LNAME, EMPLOYEE.ADDRESS
from
    employee,
    department
where
    department.DNAME = 'Research'
        and department.DNUMBER = employee.DNO;

select 
    employee.FNAME, employee.LNAME, employee.ADDRESS
from
    employee
        join
    department on department.DNUMBER = employee.DNO
where
    department.DNAME = 'Research';

select 
    E.FNAME, E.LNAME, E.ADDRESS
from
    employee E,
    department as D
where
    D.DNAME = 'Research'
        and D.DNUMBER = E.DNO;

select 
    E.FNAME, E.LNAME, E.ADDRESS
from
    employee E
        join
    department as D on D.DNUMBER = E.DNO
where
    D.DNAME = 'Research';


select 
    P.PNAME, D.DNAME
from
    project as P,
    department as D
where
    P.DNUM = D.DNUMBER;
           
select 
    P.PNAME, D.DNAME
from
    project as P
        join
    department as D on P.DNUM = D.DNUMBER;

select 
    E.FNAME,
    E.LNAME,
    e.ssn as "employee_ssn",
    S.ssn as "supervisor ssn",
    S.FNAME,
    S.LNAME
from
    employee as E,
    employee as S
where
    E.SUPER_SSN = S.SSN;


select 
    SALARY
from
    employee;

select distinct
    SALARY
from
    employee;

select  
    PNAME
from
    project, department, employee
where
    dnum = dnumber and MGR_SSN = ssn
        and LNAME = 'Wong';

select 
    PNAME
from
    project, employee, works_on
where
    PNUMBER = PNO and ESSN = SSN
        and LNAME = 'Smith';
        
                    
	
select 
    PNAME
from
    project, department, employee, works_on
where
    (DNUM = DNUMBER and MGR_SSN = SSN and LNAME = 'Smith')
        or (PNUMBER = PNO and ESSN = SSN and LNAME = 'Smith');

select 
    PNAME
from
    project, department, employee
where
    DNUM = DNUMBER and MGR_SSN = SSN and LNAME = 'Smith' 
union all (select 
    PNAME
from
    project, works_on, employee
where
    PNUMBER = PNO and ESSN = SSN
        and LNAME = 'Smith');


select 
    PNAME
from
    project, department, employee
where
    DNUM = DNUMBER and MGR_SSN = SSN
        and LNAME = 'Smith' 
union all (select 
    PNAME
from
    project, works_on, employee
where
    PNUMBER = PNO and ESSN = SSN and LNAME = 'Smith');

select 
    PNAME, DNAME, LNAME
from
    project, department, employee, works_on
where
    PNUMBER = PNO and ESSN = SSN and LNAME = 'Smith';

select 
    pname, dname
from
    project, department
where
    project.dnum = department.dnumber;
    
select 
    pname, dname
from
    project join department on project.dnum = department.dnumber;

/* start from here ........

*/

select 
    FNAME, LNAME, address
from
   employee
where
    ADDRESS like '%Houston TX%';


select 
    E.FNAME, E.LNAME, 1.1 * E.SALARY
from
    employee as E, works_on as W, project as P
where
    E.SSN = W.ESSN and W.PNO = P.PNUMBER
        and P.PNAME = 'ProductX';

select 
    E.FNAME, E.LNAME,
    round((1.1 * E.SALARY), 2) as raised_salary
from
    employee as E, works_on as W, project as P
where
    E.SSN = W.ESSN and W.PNO = P.PNUMBER
        and P.PNAME = 'ProductX';
        

select 
    E.FNAME, E.LNAME,
    round((1.1 * E.SALARY), 2) as raised_salary
from
    employee as E 


select 
    SSN, DNO, DNAME, round(Salary, 2) as "$US_currency"
from
    employee, department
where
    (SALARY between 30000 and 40000)
        and DNUMBER = DNO and DNO = 5;

select 
    SSN, DNO, DNAME, round(Salary, 2) as "$US_currency"
from
    employee join department on dnumber = dno
where SALARY between 30000 and 40000 and DNO = 5;


select 
    SSN, Dname
from
    employee, department; /* number of tuples: number of employees * number of departments */
    
select 
    SSN, Dname
from
    employee join department; /* number of tuples: number of employees * number of departments */


select 
    DNAME, LNAME, FNAME, PNAME
from
    department, employee, works_on, project
where
    DNUMBER = DNO and SSN = ESSN and PNO = PNUMBER
order by DNAME desc, LNAME desc;



insert into  employee
	values ('Richard','K','Marini', 653298653, '1962-12-30',
	'98 Oak Forest Drive, TX', 'M', 37000,'333445555', 5 ) ;


delete from employee
where
    SSN = '653298653';

insert into  employee
	values ('Bob','K','Schneider', '666779999', '1962-12-30',
	'98 Oak Forest,Katy,TX', 'M', 37000,'987654321', 4 ) ;

delete from employee 
where
    SSN = '666779999';

desc employee;


select 
    lname, minit, fname
from
    employee
where
    lname = 'Brown';

insert into employee 
	values ('Joe','K','Montana', '666009999', '1962-12-30','98 Oak Forest,Katy,CA', 'M', 37000,null, 5 ), 
    ('Dan','K','Marino', '666119999', '1962-12-30','98 Oak Forest,Katy,FL', 'M', 37000,null, 5 );


insert into employee
	values ('Joe','K','Montana', '000000099', '1962-12-30','98 Oak Forest,Katy,CA', 'M', 37000,null, 1 );

select * from employee;

insert into employee (SSN, BDATE, Address, Sex, Salary, super_ssn, Dno)
	values ('000000199', '1962-12-30','98 Oak Forest,Katy,CA', 'M', 37000,null, 5 );

insert into employee (Fname, Lname, SSN)
	values ('Jimmy', 'Brown', '000000199'); -- here you should see an error of null value in column
    
select 
    *
from
    employee
where
    SSN = '000000199';



update employee 
set 
    address = '126 Kings Blvd, CA'
where
    SSN = '666884444';

select 
    *
from
    employee
where
    SSN = '666884444';



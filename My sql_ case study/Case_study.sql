Use first_class_exercise;
/* 1. case study */
/* 
-------
first table employees details
-----
*/
create table Employees_Details(Emp_ID INT (5) , Emp_NAME VARCHAR (30) , Emp_BRANCH VARCHAR (15),
Emp_DESIGNATION VARCHAR (40), Emp_ADDR VARCHAR (100), Emp_CONT_NO VARCHAR (10) , primary KeY(Emp_ID));
select * from Employees_details;

/* 
-------
Second table Membership
-----
*/
create table Membership(M_ID INT, START_DATE text , END_DATE text, primary key(M_ID));

select * from Membership;


/* 
-------
Third table Customer
-----
*/
create table Customer(Cust_ID INT (4), Cust_NAME VARCHAR (30), Cust_EMAIL_ID VARCHAR (50), Cust_CONT_NO 
VARCHAR (10), Cust_ADDR VARCHAR (100), Cust_TYPE VARCHAR (30), Membership_M_ID INT, 
Primary key (Cust_ID),
Foreign Key (Membership_M_ID) REFERENCES Membership(M_ID));
select * from customer;
describe customer;
/* 
-------
Fourth table Payment_Details 
-----
*/
create table Payment_Details (PAYMENT_ID VARCHAR (40), AMOUNT INT, PAYMENT_STATUS VARCHAR (10), PAYMENT_DATE
TEXT, PAYMENT_MODE VARCHAR (25), Shipment_SH_ID VARCHAR (6), Shipment_Client_C_ID 	INT (4),
unique(PAYMENT_ID),
primary key(PAYMENT_ID),
Foreign key(Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
Foreign key ( Shipment_Client_C_ID) REFERENCES Customer(Cust_ID));
select * from Payment_Details;
 describe Payment_Details;
/* 
-------
Fifth table Shipment_Details  
-----
*/
create table Shipment_Details ( SD_ID VARCHAR (6),SD_CONTENT VARCHAR (40), SD_DOMAIN VARCHAR (15),
SD_TYPE VARCHAR (15), SD_WEIGHT VARCHAR (10), SD_CHARGES INT (10), SD_ADDR VARCHAR (100), DS_ADDR
VARCHAR (100), Customer_Cust_ID INT (4),
Primary key (SD_ID),
Foreign key (Customer_Cust_ID) REFERENCES Customer(Cust_ID));

select * from Shipment_Details;
describe Shipment_Details;

/* 
-------
Sixth table Status  
-----
*/
create table Status(CURRENT_ST VARCHAR (15), SENT_DATE TEXT, DELIVERY_DATE TEXT, SH_ID VARCHAR (6),
primary key ( SH_ID));
describe Status;
select * from status;
/* 
-------
Seventh table Employee Manages Shipment Table:
-----
*/
create  table Employee_Manages_Shipment( Employee_E_ID INT (5), Shipment_SH_ID 	VARCHAR (6), 
Status_SH_ID VARCHAR (6),
foreign key (Employee_E_ID) references Employees_Details(Emp_ID),
foreign key (Shipment_SH_ID) references Shipment_Details(SD_ID),
foreign key (Status_SH_ID) references Status(SH_ID));

describe Employee_Manages_Shipment;
select * from Employee_Manages_Shipment;


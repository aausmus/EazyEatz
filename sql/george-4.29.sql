-- Create Users table
CREATE TABLE sdev_users (
  user_id INTEGER PRIMARY KEY,
  email  VARCHAR(75) NOT NULL UNIQUE,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(75) NOT NULL,
  city VARCHAR(75),
  State CHAR(2),
  zip VARCHAR(10) 
);

-- Roles table
CREATE TABLE roles (
  role_id INTEGER PRIMARY KEY,
  role varchar(20) NOT NULL UNIQUE
);

-- user-info
-- Modified to track failed login attempts in compliance with PCI DSS 8.1.6
CREATE TABLE user_info (
  user_id INTEGER Primary Key, 
  password  VARCHAR(100)  NOT NULL,
  loginAttempts INTEGER NOT NULL,
  CONSTRAINT fk_wu2 Foreign Key (user_id) 
  references  sdev_users(user_id) on delete cascade   
);


-- User roles
CREATE TABLE user_roles (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  Constraint PKUR primary key (user_id, role_id),
  Constraint fk_ur1 Foreign Key (user_id) references  
   sdev_users(user_id) on delete cascade,   
  Constraint fk_ur2 Foreign Key (role_id) references  
   roles(role_id) on delete cascade    
);

-- Account data
-- Removed full track data, CCV, PIN, and all but last card number for compliance
-- with PCI DSS 3.2.1 - 3.2.3, 3.3-3.4
CREATE TABLE CustomerAccount (
  account_id INTEGER Primary Key,
  user_id INTEGER NOT NULL references sdev_users (user_id),
  Cardholdername VARCHAR(75) NOT NULL,
  CardType VARCHAR(20) NOT NULL,
  ServiceCode VARCHAR(20) NOT NULL,
  CardNumber VARCHAR(4) NOT NULL,
  expiredate date NOT NULL
);
drop database if exists EazyEatz;


create database EazyEatz;

drop table if exists EazyEatz.MenuItem_CondimentAddOn_Xref;

drop table if exists EazyEatz.CondimentAddOn;

drop table if exists EazyEatz.OrderLogMenuItemComposition;

drop table if exists EazyEatz.OrderLog;

drop table if exists EazyEatz.MenuItemInventoryComposition;

drop table if exists EazyEatz.MenuItem;

drop table if exists EazyEatz.InventoryItem;

drop table if exists EazyEatz.Notification;

drop table if exists EazyEatz.NotificationType;

drop table if exists EazyEatz.AssignedCashRegisterEventType; 

drop table if exists EazyEatz.AssignedCashRegister;

drop table if exists EazyEatz.EmployeeTimeLog;

drop table if exists EazyEatz.Employee;

drop table if exists EazyEatz.EmployeeType;

drop table if exists EazyEatz.CashRegister;




create table EazyEatz.CashRegister
(
CashRegister_ID int not null
, CashRegister_Name nvarchar(100) not null
, CashRegister_CurrentValue decimal(18,5) not null
, primary key (CashRegister_ID)
);
 
   

insert into EazyEatz.CashRegister values(1,'Register1',0);


insert into EazyEatz.CashRegister values(2,'Register2',0);


insert into EazyEatz.CashRegister values(3,'Register3',0);


    

create table EazyEatz.EmployeeType
(
EmployeeType_ID int not null
, EmployeeType_Name nvarchar(50) not null
, primary key (EmployeeType_ID));



insert into EazyEatz.EmployeeType value (1,'Manager');


insert into EazyEatz.EmployeeType value (2,'Cashier');


insert into EazyEatz.EmployeeType value (3,'Cook');




create table EazyEatz.Employee
(
Employee_ID int not null AUTO_INCREMENT
, Employee_Name nvarchar(50) not null
, Employee_Address nvarchar(100)
, Employee_Phone nvarchar(20)
, EmployeeType_ID int not null
, EmployeePin int not null
, primary key (Employee_ID), foreign key (EmployeeType_ID) references EazyEatz.EmployeeType(EmployeeType_ID)

);
   

insert into EazyEatz.Employee values(1,'jeff','earth','111-111-1111',1,1234); 


create table EazyEatz.EmployeeTimeLog
(
Employee_ID int not null
, EmployeeTimeLog_LogTime datetime not null
, EmployeeTimeLog_Type int not null, foreign key (Employee_ID) references EazyEatz.Employee(Employee_ID)
, primary key (EmployeeTimeLog_LogTime));
  
      

create table EazyEatz.AssignedCashRegister(
AssignedCashRegister_Timestamp datetime not null, CashRegister_ID int not null
, Employee_ID int not null
, AssignedCashRegister_CashAmount decimal(18,5) not null
, AssignedCashRegisterEventType_ID int not null, primary key (AssignedCashRegister_Timestamp,CashRegister_ID, Employee_ID,AssignedCashRegisterEventType_ID)
, foreign key (CashRegister_ID) references EazyEatz.CashRegister(CashRegister_ID)
, foreign key (Employee_ID) references EazyEatz.Employee(Employee_ID)
);



create table EazyEatz.AssignedCashRegisterEventType(
AssignedCashRegisterType_ID int not null
, AssignedCashRegisterType_Name nvarchar(100) not null
, primary key (AssignedCashRegisterType_ID)
);
    


insert into EazyEatz.AssignedCashRegisterEventType values (1,'Employee Assigned to Register');
insert into EazyEatz.AssignedCashRegisterEventType values (2,'Employee Removed from Register');



create table EazyEatz.NotificationType
(
NotificationType_ID int not null
, NotificationType_Name nvarchar(50) not null
, primary key(NotificationType_ID)
);


insert into EazyEatz.NotificationType values (1,'Inventory Item Low Notification');



create table EazyEatz.Notification
(
NotificationType_ID int not null
, Notification_Timestamp datetime not null
, Notification_Description nvarchar(256)
, primary key(Notification_Timestamp, NotificationType_ID)
);



create table EazyEatz.InventoryItem
(
InventoryItem_ID int not null AUTO_INCREMENT, InventoryItem_Name nvarchar(50) not null
, InventoryItem_Quantity int not null
, InventoryItem_SingleUnitCost decimal(18,5) not null
, primary key (InventoryItem_ID)
);



insert into EazyEatz.InventoryItem values (1,'Burger Pattie',50,2.00);


insert into EazyEatz.InventoryItem values (2,'Chicken Pattie',50,2.00);


insert into EazyEatz.InventoryItem values (3,'Fish Pattie',50,2.00);


insert into EazyEatz.InventoryItem values (4,'Veggie Pattie',50,2.00);


insert into EazyEatz.InventoryItem values (5,'Nugget',50,.25);


insert into EazyEatz.InventoryItem values (6,'Taco',50,.99);


insert into EazyEatz.InventoryItem values (7,'Burger Bun',50,.99);


insert into EazyEatz.InventoryItem values (8,'Lettuce',50,.25);


insert into EazyEatz.InventoryItem values (9,'Potato',50,.50);


insert into EazyEatz.InventoryItem values (10,'Tomato',50,.50);




insert into EazyEatz.InventoryItem values (11,'Cheese',50,.25);


insert into EazyEatz.InventoryItem values (12,'Coke',50,.99);


insert into EazyEatz.InventoryItem values (13,'Sprite',50,.99);

create table EazyEatz.MenuItem
	(
MenuItem_ID int not null AUTO_INCREMENT
, MenuItem_Name nvarchar(50) not null
, MenuItem_Cost decimal(18,5) not null
, primary key (MenuItem_ID));


insert into EazyEatz.MenuItem values (1,'Regular EazyEatz Burger',4.99);

insert into EazyEatz.MenuItem values (2,'Regular EazyEatz Cheeseburger',5.99);

insert into EazyEatz.MenuItem values (3,'Regular EazyEatz Chicken Sandwich',4.99);

insert into EazyEatz.MenuItem values (4,'Regular EazyEatz Fish Sandwich',4.99);

insert into EazyEatz.MenuItem values (5,'Regular EazyEatz Veggieburger',4.99);

insert into EazyEatz.MenuItem values (6,'Regular EazyEatz Taco Fiesta',4.99);



create table EazyEatz.MenuItemInventoryComposition
(
MenuItem_ID int not null
, InventoryItem_ID int not null
, MenuItemInventoryComposition_Quantity int not null
, foreign key (MenuItem_ID) references EazyEatz.MenuItem (MenuItem_ID)
, foreign key (InventoryItem_ID) references EazyEatz.InventoryItem (InventoryItem_ID)
, primary key (MenuItem_ID, InventoryItem_ID));



insert into EazyEatz.MenuItemInventoryComposition values (1,1,1);


insert into EazyEatz.MenuItemInventoryComposition values (1,8,1);


insert into EazyEatz.MenuItemInventoryComposition values (1,10,1);


insert into EazyEatz.MenuItemInventoryComposition values (1,9,1);


insert into EazyEatz.MenuItemInventoryComposition values (2,1,1);


insert into EazyEatz.MenuItemInventoryComposition values (2,8,1);


insert into EazyEatz.MenuItemInventoryComposition values (2,10,1);


insert into EazyEatz.MenuItemInventoryComposition values (2,9,1);

insert into EazyEatz.MenuItemInventoryComposition values (2,11,2);



insert into EazyEatz.MenuItemInventoryComposition values (3,2,1);


insert into EazyEatz.MenuItemInventoryComposition values (3,8,1);


insert into EazyEatz.MenuItemInventoryComposition values (3,10,1);


insert into EazyEatz.MenuItemInventoryComposition values (3,9,1);



insert into EazyEatz.MenuItemInventoryComposition values (4,3,1);


insert into EazyEatz.MenuItemInventoryComposition values (4,8,1);


insert into EazyEatz.MenuItemInventoryComposition values (4,10,1);


insert into EazyEatz.MenuItemInventoryComposition values (4,9,1);



insert into EazyEatz.MenuItemInventoryComposition values (5,4,1);


insert into EazyEatz.MenuItemInventoryComposition values (5,8,1);


insert into EazyEatz.MenuItemInventoryComposition values (5,10,1);


insert into EazyEatz.MenuItemInventoryComposition values (5,9,1);


insert into EazyEatz.MenuItemInventoryComposition values (6,6,4);

insert into EazyEatz.MenuItemInventoryComposition values (6,9,1);



create table EazyEatz.OrderLog
	(
OrderLog_ID int not null, CashRegister_ID int not null
, Employee_ID int not null
, OrderLog_Timestamp datetime not null
, OrderLog_TotalCost decimal(18,5) not null
, foreign key (CashRegister_ID) references EazyEatz.CashRegister (CashRegister_ID)
, foreign key (Employee_ID) references EazyEatz.Employee (Employee_ID)
, primary key (OrderLog_ID)
);



create table EazyEatz.OrderLogMenuItemComposition
(
OrderLog_ID int not null, MenuItem_ID int not null
, OrderLog_AmountOrdered int not null
, foreign key (OrderLog_ID) references EazyEatz.OrderLog (OrderLog_ID)
, foreign key (MenuItem_ID) references EazyEatz.MenuItem (MenuItem_ID)
, primary key (OrderLog_ID, MenuItem_ID)
);



/* 

The next two tables were added after our meeting on Saturday.  The first, CondimentAddOn, will hold any add ons that can be added to
orders in our POS system as well as the cost associated with them.  The second table, MenuItem_CondimentAddOn_Xref will hold all of the
add ons that are associated with a single menu item.
  
*/


create table EazyEatz.CondimentAddOn
(
CondimentAddOn_ID int not null, CondimentAddOn_Name nvarchar(50)
, CondimentAddOn_Cost decimal(18,5)
, primary key (CondimentAddOn_ID)
);


    
insert into EazyEatz.CondimentAddOn values (1,'Ketchup',0.00);


insert into EazyEatz.CondimentAddOn values (2,'Cheese',0.99);



create table EazyEatz.MenuItem_CondimentAddOn_Xref
(
MenuItem_ID int not null
, CondimentAddOn_ID int not null
, foreign key (MenuItem_ID) references EazyEatz.MenuItem (MenuItem_ID)
, foreign key (CondimentAddOn_ID) references EazyEatz.CondimentAddOn (CondimentAddOn_ID)
, primary key (MenuItem_ID, CondimentAddOn_ID));



insert into EazyEatz.MenuItem_CondimentAddOn_Xref values (1,1);


insert into EazyEatz.MenuItem_CondimentAddOn_Xref values (1,2);

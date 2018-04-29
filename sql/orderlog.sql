
	
	
	
	
	
-- What I added into the employee table.	
	
INSERT INTO eazyeatz.employee (`Employee_ID`, `Employee_Name`, `Employee_Address`, `Employee_Phone`, `EmployeeType_ID`, `EmployeePin`) 
	VALUES (1, 'Bob', '1111 Burger St', '999-999-9999', 1, 1234)
INSERT INTO eazyeatz.employee (`Employee_ID`, `Employee_Name`, `Employee_Address`, `Employee_Phone`, `EmployeeType_ID`, `EmployeePin`) 
	VALUES (2, 'Cat', '2222 Salad St', '999-999-8888', 2, 1111);
	
	
	
	
-- What I added to the orderlog table. 	
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (1, 1, 2, '2018-01-04 14:55:44.0', 30.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (2, 1, 2, '2018-01-20 14:55:44.0', 40.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (3, 1, 2, '2018-02-07 14:55:44.0', 50.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`,  `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (4, 2, 2, '2018-02-25 14:55:44.0', 60.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (5, 2, 2, '2018-03-15 14:55:44.0', 70.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (6, 2, 2, '2018-03-17 14:55:44.0', 80.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (7, 3, 2, '2018-04-04 14:55:44.0', 90.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (8, 3, 2, '2018-04-05 14:55:44.0', 130.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (9, 3, 2, '2018-04-06 14:55:44.0', 130.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (10, 1, 2, '2018-04-07 14:55:44.0', 230.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (11, 2, 2, '2018-04-08 14:55:44.0', 320.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (12, 3, 2, '2018-04-09 14:55:44.0', 30.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (13, 1, 2, '2018-04-10 14:55:44.0', 35.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (14, 2, 2, '2018-04-21 14:55:44.0', 37.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (15, 3, 2, '2018-04-22 14:55:44.0', 89.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (16, 2, 2, '2018-04-23 14:55:44.0', 31.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (17, 1, 2, '2018-04-24 14:55:44.0', 23.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (18, 2, 2, '2018-04-25 14:55:44.0', 30.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (19, 2, 2, '2018-04-26 14:55:44.0', 34.00000);
INSERT INTO eazyeatz.orderlog (`OrderLog_ID`, `CashRegister_ID`, `Employee_ID`, `OrderLog_Timestamp`, `OrderLog_TotalCost`) 
	VALUES (20, 2, 2, '2018-04-27 14:55:44.0', 36.00000);

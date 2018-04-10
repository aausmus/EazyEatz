
create database eedb;

use eedb; 

CREATE TABLE eedb.`users` ( 
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `payrate` decimal(6,2) DEFAULT NULL,
  `jobtitle` varchar(100) DEFAULT NULL,
  `role` enum('a', 'c', 'n') DEFAULT NULL,
  PRIMARY KEY (`userid`)
);

CREATE TABLE eedb.`inventory` (
  `inventoryid` int(11) NOT NULL AUTO_INCREMENT,
  `stock` int(11) DEFAULT NULL,
  `item` enum('burgerPatties', 'burgerBuns', 'cheeseSlices', 'fries', 'pepsi', 'mountainDew') DEFAULT NULL,
  PRIMARY KEY (`inventoryid`)
);
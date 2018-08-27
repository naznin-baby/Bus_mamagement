-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bus_management
--

CREATE DATABASE IF NOT EXISTS bus_management;
USE bus_management;

--
-- Definition of table ` user_type`
--

DROP TABLE IF EXISTS ` user_type`;
CREATE TABLE ` user_type` (
  `u_type_id` int(10) unsigned NOT NULL auto_increment,
  `u_type_name` varchar(45) default NULL,
  PRIMARY KEY  (`u_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table ` user_type`
--

/*!40000 ALTER TABLE ` user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE ` user_type` ENABLE KEYS */;


--
-- Definition of table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `book_id` int(10) unsigned NOT NULL auto_increment,
  `pass_id` int(10) unsigned default NULL,
  `schedule_id` int(10) unsigned default NULL,
  `book_date` date default NULL,
  `book_status` varchar(45) default NULL,
  `total_seat` int(10) unsigned default NULL,
  `counter_id` int(10) unsigned default NULL,
  `bus_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`book_id`),
  KEY `pass_id` (`pass_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `counter_id` (`counter_id`),
  KEY `FK_booking_4` (`bus_id`),
  CONSTRAINT `FK_booking_4` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `counter_id` FOREIGN KEY (`counter_id`) REFERENCES `route_counter` (`counter_id`),
  CONSTRAINT `pass_id` FOREIGN KEY (`pass_id`) REFERENCES `passenger` (`pass_id`),
  CONSTRAINT `schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `bus_schedule` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`book_id`,`pass_id`,`schedule_id`,`book_date`,`book_status`,`total_seat`,`counter_id`,`bus_id`) VALUES 
 (1,1,1,'2018-07-10','active',4,1,NULL),
 (5,2,1,'2018-07-10','active',3,2,NULL),
 (6,2,2,'2018-07-10','active',3,2,NULL),
 (7,3,3,'2018-07-04','ok',50,0,NULL),
 (8,2,4,'2018-07-04','ok',4,1,NULL),
 (9,2,1,'2018-07-04','ok',5,0,2);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;


--
-- Definition of trigger `bookingafter_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `bookingafter_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `bookingafter_insert` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
update bus_info
set bus_capacity=bus_capacity-new.total_seat;
END $$

DELIMITER ;

--
-- Definition of table `booking_seat`
--

DROP TABLE IF EXISTS `booking_seat`;
CREATE TABLE `booking_seat` (
  `book_seat_id` int(10) unsigned NOT NULL auto_increment,
  `book_id` int(10) unsigned default NULL,
  `seat_no` varchar(45) default NULL,
  `bus_id` int(10) unsigned default NULL,
  `pass_id` int(10) unsigned default NULL,
  `book_date` date default NULL,
  PRIMARY KEY  (`book_seat_id`),
  KEY `book_id` (`book_id`),
  KEY `FK_booking_seat_2` (`bus_id`),
  KEY `FK_booking_seat_3` (`pass_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `booking` (`book_id`),
  CONSTRAINT `FK_booking_seat_2` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_id`),
  CONSTRAINT `FK_booking_seat_3` FOREIGN KEY (`pass_id`) REFERENCES `passenger` (`pass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_seat`
--

/*!40000 ALTER TABLE `booking_seat` DISABLE KEYS */;
INSERT INTO `booking_seat` (`book_seat_id`,`book_id`,`seat_no`,`bus_id`,`pass_id`,`book_date`) VALUES 
 (2,6,'3',13,1,NULL),
 (3,6,'4',13,1,NULL),
 (4,6,'3',13,4,NULL),
 (5,6,'3',13,3,NULL),
 (7,6,'2',13,2,NULL);
/*!40000 ALTER TABLE `booking_seat` ENABLE KEYS */;


--
-- Definition of table `bus_info`
--

DROP TABLE IF EXISTS `bus_info`;
CREATE TABLE `bus_info` (
  `bus_id` int(10) unsigned NOT NULL auto_increment,
  `bus_no` int(11) default NULL,
  `bus_reg_no` varchar(45) default NULL,
  `bus_model` varchar(45) default NULL,
  `bus_capacity` int(11) default NULL,
  `purchase_date` date default NULL,
  `insurance_status` varchar(45) default NULL,
  `insurance_date` date default NULL,
  `insurance_expiry` varchar(45) default NULL,
  `bus_type` varchar(45) default NULL,
  `bus_photo` varchar(200) default NULL,
  PRIMARY KEY  (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_info`
--

/*!40000 ALTER TABLE `bus_info` DISABLE KEYS */;
INSERT INTO `bus_info` (`bus_id`,`bus_no`,`bus_reg_no`,`bus_model`,`bus_capacity`,`purchase_date`,`insurance_status`,`insurance_date`,`insurance_expiry`,`bus_type`,`bus_photo`) VALUES 
 (2,2,'129','bbv73',31,'2017-10-20','active','2017-12-25','2030-11-15','AC','urlkdhweu'),
 (4,4,'111','ct55',31,'2018-12-10','active','2018-12-10','2018-12-10','Ac','kfdm'),
 (5,4,'111','ct55',31,'2018-12-10','active','2018-12-10','2018-12-10','Ac','kfdm'),
 (7,4,'111','ct55',31,'2018-12-10','active','2018-12-10','2018-12-10','Ac','kfdm'),
 (13,6,'166','vf5',36,'2017-12-30','active','2018-01-21','2028-12-31','non ac','egeg'),
 (25,25,'432','g56',36,'2017-12-12','active','2017-12-20','2027-12-25','non Ac','erregv'),
 (26,1,'888','855',26,'2017-12-12','active','2017-12-20','2027-12-25','non Ac','urlieudi'),
 (27,25,'852','gh56',26,'2017-12-12','active','2018-10-15','2018-10-18','non Ac','urlieudi'),
 (28,1,'995','g55',26,'2017-12-12','active','2017-12-20','2016-12-25','non ac','erregv'),
 (29,2,'149','kk56',31,'2017-10-20','active','2017-12-25','2030-11-15','AC','urlkdhweu'),
 (30,NULL,'19','bbv773',31,'2017-10-20','active','2017-12-05','2030-11-07','AC','urlkdhweu');
/*!40000 ALTER TABLE `bus_info` ENABLE KEYS */;


--
-- Definition of table `bus_schedule`
--

DROP TABLE IF EXISTS `bus_schedule`;
CREATE TABLE `bus_schedule` (
  `schedule_id` int(10) unsigned NOT NULL auto_increment,
  `bus_id` int(10) unsigned default NULL,
  `route_id` int(10) unsigned default NULL,
  `emp_id` int(10) unsigned default NULL,
  `date_schdule` date default NULL,
  `depart_time` varchar(45) default NULL,
  `schedule_start` int(11) default NULL,
  `depart_place` varchar(45) default NULL,
  PRIMARY KEY  (`schedule_id`),
  KEY `FK_bus_schedule_bus_id` (`bus_id`),
  KEY `FK_bus_schedule_route_id` (`route_id`),
  KEY `FK_bus_schedule_emp_id` (`emp_id`),
  CONSTRAINT `FK_bus_schedule_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_id`),
  CONSTRAINT `FK_bus_schedule_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_bus_schedule_route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_schedule`
--

/*!40000 ALTER TABLE `bus_schedule` DISABLE KEYS */;
INSERT INTO `bus_schedule` (`schedule_id`,`bus_id`,`route_id`,`emp_id`,`date_schdule`,`depart_time`,`schedule_start`,`depart_place`) VALUES 
 (1,13,1,3,'2018-12-12','1970-01-01 10:17:25',2,'Bogura'),
 (2,2,2,2,'2018-12-12','2018-12-12 11:30:00',1,'manikgonj'),
 (3,4,1,2,'2018-12-12','2018-12-12 11:30:00',1,'joshor'),
 (4,5,3,3,'2018-12-12','2018-12-12 11:30:00',3,'hgdjruytd'),
 (5,7,2,2,'2018-12-25','1970-01-01 06:02:34',4,'Bogur'),
 (7,4,2,3,'2018-10-10','2018-10-10 06:00:00',3,'kkkk'),
 (8,4,2,2,'2018-10-10','2018-10-10 06:00:00',3,'dhaka');
/*!40000 ALTER TABLE `bus_schedule` ENABLE KEYS */;


--
-- Definition of table `emp_category`
--

DROP TABLE IF EXISTS `emp_category`;
CREATE TABLE `emp_category` (
  `emp_cat_id` int(10) unsigned NOT NULL auto_increment,
  `e_cid` varchar(45) default NULL,
  `emp_cat_name` varchar(45) default NULL,
  PRIMARY KEY  (`emp_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_category`
--

/*!40000 ALTER TABLE `emp_category` DISABLE KEYS */;
INSERT INTO `emp_category` (`emp_cat_id`,`e_cid`,`emp_cat_name`) VALUES 
 (1,'D1','Driver'),
 (4,'D11','Driver'),
 (5,'C11','Contactur'),
 (41,'D14','Driver'),
 (42,'D13','Driver'),
 (43,'C11','Contactur'),
 (44,'D13','Driver');
/*!40000 ALTER TABLE `emp_category` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(10) unsigned NOT NULL auto_increment,
  `emp_name` varchar(45) default NULL,
  `gender` varchar(45) default NULL,
  `dob` date default NULL,
  `emp_cat_id` int(10) unsigned default NULL,
  `moblic` varchar(45) default NULL,
  `address` varchar(45) default NULL,
  `resigned_date` date default NULL,
  `emp_photo` varchar(200) default NULL,
  PRIMARY KEY  (`emp_id`),
  KEY `emp_cat-id` (`emp_cat_id`),
  CONSTRAINT `emp_cat-id` FOREIGN KEY (`emp_cat_id`) REFERENCES `emp_category` (`emp_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`emp_id`,`emp_name`,`gender`,`dob`,`emp_cat_id`,`moblic`,`address`,`resigned_date`,`emp_photo`) VALUES 
 (1,'Mr.x','male','1990-12-12',1,'0172343213','magura','2017-05-14','fhktskd'),
 (2,'hr.x','male','1990-12-12',1,'0172343243','magura','2017-05-14','fhktskd'),
 (3,'mr.haron','male','2018-07-18',5,'0175432452','Borisal','2018-07-10','htrhyhgn'),
 (4,'wdfwef','male','2017-02-08',4,'01314534565','savar','2018-07-04','fvbgrb');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `login_info`
--

DROP TABLE IF EXISTS `login_info`;
CREATE TABLE `login_info` (
  `login_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned default NULL,
  `user_name` varchar(45) default NULL,
  `user_pass` varchar(45) default NULL,
  PRIMARY KEY  (`login_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;


--
-- Definition of table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `pass_id` int(10) unsigned NOT NULL auto_increment,
  `pass_name` varchar(45) default NULL,
  `pass_address` varchar(100) default NULL,
  `pass_mobile` varchar(45) default NULL,
  `reg_date` date default NULL,
  `email` varchar(45) default NULL,
  `pass_photo` varchar(200) default NULL,
  `gender` varchar(45) default NULL,
  PRIMARY KEY  (`pass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` (`pass_id`,`pass_name`,`pass_address`,`pass_mobile`,`reg_date`,`email`,`pass_photo`,`gender`) VALUES 
 (1,'mr.maruf','nikaton,Dhaka','01785469874','2018-07-18','maruf@gmail.com','cvbdftges','male'),
 (2,'jakir','khulna','01745874584','2018-10-21','khulna@gmail.com','nhtydd','male'),
 (3,'toma','Bikrimpur','014785245689','2018-11-11','toma@gmail.com','serrrrrrrrrd','male'),
 (4,'mr.mustofa','nikaton,Dhaka','01785469874','2018-07-12','mustofa@gmail.com','cvbdftges','male'),
 (5,'mr.mia','fdtytdrtdj','01765432677','2018-07-12','gfjyeyteke@gmail.com','khjgttkut','female');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `pay_id` int(10) unsigned NOT NULL auto_increment,
  `pass_id` int(10) unsigned default NULL,
  `pay_date` date default NULL,
  `price_of_ticket` double default NULL,
  `number_of_ticket` int(10) unsigned default NULL,
  `total_fair` double default NULL,
  `transcation_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`pay_id`),
  KEY `FK_payment_pass_id` (`pass_id`),
  CONSTRAINT `FK_payment_pass_id` FOREIGN KEY (`pass_id`) REFERENCES `passenger` (`pass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`pay_id`,`pass_id`,`pay_date`,`price_of_ticket`,`number_of_ticket`,`total_fair`,`transcation_id`) VALUES 
 (5,1,'2018-07-03',300,4,1200,12547896),
 (7,2,'2018-07-02',300,3,900,23543647),
 (8,2,'2018-07-02',300,3,900,23543647),
 (9,3,'2018-07-17',30,3,90,785899),
 (10,1,'2018-07-24',300,3,900,12547896),
 (11,1,'2018-07-24',300,3,900,12547896),
 (12,2,'2018-07-24',300,3,900,24135655),
 (13,1,'2018-07-26',300,4,1200,23543647);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `route_id` int(10) unsigned NOT NULL auto_increment,
  `route_no` varchar(45) default NULL,
  `route_name` varchar(45) default NULL,
  `depot` varchar(45) default NULL,
  `destination` varchar(45) default NULL,
  `distance` varchar(45) default NULL,
  `ac_charge` double default NULL,
  `non_ac_charge` double default NULL,
  `bus_id` int(10) unsigned default NULL,
  `emp_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`route_id`),
  KEY `FK_route_1` (`bus_id`),
  KEY `FK_route_2` (`emp_id`),
  CONSTRAINT `FK_route_1` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_id`),
  CONSTRAINT `FK_route_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` (`route_id`,`route_no`,`route_name`,`depot`,`destination`,`distance`,`ac_charge`,`non_ac_charge`,`bus_id`,`emp_id`) VALUES 
 (1,'2','Dhaka','vbfjh','Aricha','120',500,300,2,1),
 (2,'3','csfgewtr','wer','wertf','130',550,350,4,2),
 (3,'4','dsfsew','wsefs','sdfwsef','150',700,400,13,3),
 (4,'55d','Dhaka-Aricha','Saidabad','Arichaghat','120km',300,200,13,1),
 (5,'44c','fvfbgrg','fgbtr','rtg','130km',350,300,2,1),
 (6,'44c','fvfbgrg','fgbtr','rtg','130km',350,300,2,1);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;


--
-- Definition of table `route_counter`
--

DROP TABLE IF EXISTS `route_counter`;
CREATE TABLE `route_counter` (
  `counter_id` int(10) unsigned NOT NULL,
  `counter_name` varchar(45) default NULL,
  `route_id` int(10) unsigned default NULL,
  `counter_address` varchar(45) default NULL,
  `contact_no` varchar(45) default NULL,
  PRIMARY KEY  (`counter_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_counter`
--

/*!40000 ALTER TABLE `route_counter` DISABLE KEYS */;
INSERT INTO `route_counter` (`counter_id`,`counter_name`,`route_id`,`counter_address`,`contact_no`) VALUES 
 (0,'fergw',4,'dfgbvwsrhbg','1344354365'),
 (1,'sdfaesge',1,'dfgherrth','01745324523'),
 (2,'weatweg',1,'dfgeds','01786863365');
/*!40000 ALTER TABLE `route_counter` ENABLE KEYS */;


--
-- Definition of table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL auto_increment,
  `emp_cat_id` int(10) unsigned NOT NULL,
  `emp_id` int(10) unsigned NOT NULL,
  `salary_type_id` int(10) unsigned NOT NULL,
  `basic` double NOT NULL,
  `no_of_trip` int(10) unsigned NOT NULL,
  `festival_fee` double NOT NULL,
  `insurance_fee` double NOT NULL,
  `total_salary` double NOT NULL,
  PRIMARY KEY  (`salary_id`),
  KEY `FK_salary_1` (`emp_cat_id`),
  KEY `FK_salary_2` (`emp_id`),
  KEY `FK_salary_3` (`salary_type_id`),
  CONSTRAINT `FK_salary_1` FOREIGN KEY (`emp_cat_id`) REFERENCES `emp_category` (`emp_cat_id`),
  CONSTRAINT `FK_salary_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_salary_3` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_type` (`salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` (`salary_id`,`emp_cat_id`,`emp_id`,`salary_type_id`,`basic`,`no_of_trip`,`festival_fee`,`insurance_fee`,`total_salary`) VALUES 
 (1,1,1,1,500,3,1000,500,3000),
 (2,4,1,1,700,5,254,245,3600);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;


--
-- Definition of table `salary_type`
--

DROP TABLE IF EXISTS `salary_type`;
CREATE TABLE `salary_type` (
  `salary_type_id` int(10) unsigned NOT NULL auto_increment,
  `salary_type` varchar(45) NOT NULL,
  PRIMARY KEY  (`salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary_type`
--

/*!40000 ALTER TABLE `salary_type` DISABLE KEYS */;
INSERT INTO `salary_type` (`salary_type_id`,`salary_type`) VALUES 
 (1,'per trip'),
 (2,'per day'),
 (3,'per month');
/*!40000 ALTER TABLE `salary_type` ENABLE KEYS */;


--
-- Definition of table `sale_account`
--

DROP TABLE IF EXISTS `sale_account`;
CREATE TABLE `sale_account` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `bus_id` int(10) unsigned default NULL,
  `schedule_id` int(10) unsigned default NULL,
  `route_id` int(10) unsigned default NULL,
  `amount_of_ticket` int(10) unsigned default NULL,
  `ticket_price` double default NULL,
  `total_price` double default NULL,
  `sale_date` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_sale_account_bus_id` (`bus_id`),
  KEY `FK_sale_account_route_id` (`route_id`),
  KEY `FK_sale_account_3` (`schedule_id`),
  CONSTRAINT `FK_sale_account_3` FOREIGN KEY (`schedule_id`) REFERENCES `bus_schedule` (`schedule_id`),
  CONSTRAINT `FK_sale_account_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_id`),
  CONSTRAINT `FK_sale_account_route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_account`
--

/*!40000 ALTER TABLE `sale_account` DISABLE KEYS */;
INSERT INTO `sale_account` (`id`,`bus_id`,`schedule_id`,`route_id`,`amount_of_ticket`,`ticket_price`,`total_price`,`sale_date`) VALUES 
 (1,4,1,4,520,500,500,'2018-05-15'),
 (2,2,1,2,400,2,800,'2018-07-21');
/*!40000 ALTER TABLE `sale_account` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `u_type_id` int(10) unsigned default NULL,
  `user_name` varchar(45) default NULL,
  `user_pass` varchar(45) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `u_type_id` (`u_type_id`),
  CONSTRAINT `u_type_id` FOREIGN KEY (`u_type_id`) REFERENCES ` user_type` (`u_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

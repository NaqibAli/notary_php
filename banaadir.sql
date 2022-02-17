-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2022 at 06:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banaadir`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Balance_sheet` (IN `_id` INT, IN `_desc` VARCHAR(100), IN `_income` FLOAT(11,2), IN `_expense` FLOAT(11,2), IN `_date` DATE, IN `_action` VARCHAR(100))  BEGIN
set @balance = (select SUM(_income) - SUM(ifnull(_expense,0)));
IF(_action="Insert") THEN
INSERT INTO `balance`(`Description`, `Income`, `Expense`, `Date`) VALUES(_desc,_income,_expense,@balance,_date);
SELECT "Inserted" as message;
END IF;
IF(_action="Update") THEN
UPDATE `balance` SET `Description`=_desc,`Income`=_income,`Expense`=_expense,`Date`=_date WHERE balance.ID=_id;
SELECT "Updated" as message;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_get_sp` (IN `_id` VARCHAR(100))  BEGIN
IF(_id="")THEN
SELECT
customer_tbl.ID,customer_tbl.Name,customer_tbl.Mother,
customer_tbl.Place,customer_tbl.Dob,customer_tbl.Address,
customer_tbl.Identity,customer_tbl.Phone,customer_tbl.Date
FROM customer_tbl;
ELSE
SELECT *FROM customer_tbl WHERE customer_tbl.ID = _id;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_sp` (IN `_id` VARCHAR(50), IN `_name` VARCHAR(50), IN `_mother` VARCHAR(50), IN `_place` VARCHAR(50), IN `_dob` VARCHAR(10), IN `_address` VARCHAR(50), IN `_identity` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_date` DATE, IN `_user_id` VARCHAR(20), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `customer_tbl`(`Name`, `Mother`, `Place`, `Dob`, `Address`, `Identity`, `Phone`, `Date`, `user_id`) VALUES
(_name,_mother,_place,_dob,_address,_identity,_phone,_date,_user_id);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `customer_tbl` SET `Name`=_name,`Mother`=_mother,`Place`=_place,`Dob`=_dob,
`Address`=_address, `Identity`=_identity,`Phone`=_phone,
`Date`=_date,`user_id`=_user_id WHERE customer_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_vehicle` (IN `_id` INT)  BEGIN

DELETE FROM vehicle_tbl WHERE vehicle_tbl.ID =_id;

SELECT 'deleted' as message;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `document_get_sp` (IN `_id` VARCHAR(20))  BEGIN
if(_id="")THEN
SELECT
document_tbl.ID,document_tbl.Name,document_tbl.Vehicle,document_tbl.Chassis,
document_tbl.Plate,document_tbl.Phone,document_tbl.Details,document_tbl.Ref,document_tbl.Date FROM document_tbl;
ELSE
SELECT *FROM document_tbl WHERE document_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `document_sp` (IN `_id` INT, IN `_name` VARCHAR(50), IN `_vehicle` VARCHAR(50), IN `_chassis` VARCHAR(50), IN `_plate` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_details` VARCHAR(50), IN `_Ref` VARCHAR(50), IN `_date` DATE, IN `_usrid` VARCHAR(20), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `document_tbl`(`Name`, `Vehicle`, `Chassis`, `Plate`, `Phone`,`Details`,`Ref`, `Date`, `user_id`)VALUES(_name,_vehicle,_chassis,_plate,_phone,_details,_Ref,_date,_usrid);
SELECT 'Inserted' as message;
ENd IF;

IF(_action="Update")THEN
UPDATE `document_tbl` SET `Name`=_name,`Vehicle`=_vehicle,`Chassis`=_chassis,`Plate`=_plate,`Phone`=_phone,`Details`=_details,`Ref`=_Ref,`Date`=_date,
`user_id`=_usrid WHERE document_tbl.ID = _id;
SELECT 'Updated' as message;
ENd IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `expense_get` (IN `_id` VARCHAR(100))  BEGIN
IF(_id="")THEN
SELECT
expense_tbl.ID,expense_tbl.Name,expense_tbl.Phone,
expense_tbl.Description,expense_tbl.Amount,expense_tbl.Type,
expense_tbl.Date FROM expense_tbl;
ELSE
SELECT * FROM expense_tbl WHERE expense_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `expense_sp` (IN `_id` INT, IN `_name` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_desc` VARCHAR(50), IN `_amount` FLOAT(20,2), IN `_type` VARCHAR(50), IN `_date` DATE, IN `_userid` VARCHAR(50), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `expense_tbl` (`Name`, `Phone`, `Description`, `Amount`, `Type`, `Date`, `userid`) VALUES (_name,_phone,_desc,_amount,_type,_date,_userid);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `expense_tbl` SET `Name`=_name,`Phone`=_phone,`Description`=_desc,`Amount`=_amount,`Type`=_type,`Date`=_date,`userid`=_userid WHERE expense_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_custom` ()  BEGIN
SELECT customer_tbl.id,customer_tbl.name
FROM customer_tbl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_customers_sp` ()  BEGIN
SELECT customer_tbl.id,customer_tbl.name, customer_tbl.phone
FROM customer_tbl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_owners_sp` ()  BEGIN
SELECT
owners_tbl.ID,owners_tbl.Name FROM owners_tbl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_fill_custom` (IN `_id` VARCHAR(20))  BEGIN
SELECT payment_tbl.amount FROM payment_tbl WHERE payment_tbl.id=_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `income_get` (IN `_id` VARCHAR(100))  BEGIN
if(_id="")THEN
SELECT
income_tbl.ID,income_tbl.Name,income_tbl.Phone,income_tbl.Description,
income_tbl.Plate,income_tbl.Amount,income_tbl.Date FROM income_tbl;
ELSE
SELECT *FROM income_tbl WHERE income_tbl.ID=_id;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `income_sp` (IN `_id` INT, IN `_name` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_desc` VARCHAR(50), IN `_plate` VARCHAR(50), IN `_amount` FLOAT(20,2), IN `_date` DATE, IN `_userid` VARCHAR(50), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `income_tbl`(`Name`, `Phone`, `Description`,`Plate`, `Amount`, `Date`, `userid`) VALUES (_name,_phone,_desc,_plate,_amount,_date,_userid);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `income_tbl` SET `Name`=_name,`Phone`=_phone,`Description`=_desc,`Plate`=_plate,
`Amount`=_amount,`Date`=_date,`userid`=_userid WHERE income_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Login_sp` (IN `_username` VARCHAR(100), IN `_password` VARCHAR(100))  BEGIN

IF EXISTS(SELECT *FROM users_tbl WHERE users_tbl.user_name=_username AND users_tbl.password=PASSWORD(_password)) THEN

IF EXISTS(SELECT *FROM users_tbl WHERE users_tbl.user_name=_username AND users_tbl.password=PASSWORD(_password) AND users_tbl.user_status='Active') THEN
SELECT users_tbl.user_id,users_tbl.user_name,users_tbl.user_status FROM users_tbl WHERE users_tbl.user_name=_username;
ELSE
SELECT 'inactive' as message;
END IF;
ELSE
SELECT 'Invalid' AS message;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `owners_get_sp` (IN `_id` VARCHAR(100))  BEGIN
IF(_id="") THEN
SELECT
owners_tbl.ID,owners_tbl.Name,owners_tbl.Mother,owners_tbl.Place,
owners_tbl.Dob,owners_tbl.Address,owners_tbl.Identity,owners_tbl.Phone,owners_tbl.Date FROM owners_tbl;
ELSE
SELECT *FROM owners_tbl WHERE owners_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `owners_sp` (IN `_id` VARCHAR(100), IN `_name` VARCHAR(100), IN `_mother` VARCHAR(100), IN `_place` VARCHAR(100), IN `_dob` VARCHAR(100), IN `_address` VARCHAR(100), IN `_identity` VARCHAR(20), IN `_phone` VARCHAR(100), IN `_date` DATE, IN `_user_id` VARCHAR(20), IN `_action` VARCHAR(100))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `owners_tbl`(`Name`, `Mother`, `Place`, `Dob`, `Address`, `Identity`, `Phone`, `Date`, `user_id`) VALUES (_name,_mother,_place,_dob,_address,_identity,_phone,_date,_user_id);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `owners_tbl` SET `Name`=_name,`Mother`=_mother,`Place`=_place,`Dob`=_dob,
`Address`=_address,`Identity`=_identity,`Phone`=_phone,`Date`=_date,`user_id`=_user_id 
WHERE owners_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `payment_get_sp` (IN `_id` VARCHAR(100))  BEGIN
IF(_id="")THEN
SELECT
payment_tbl.ID,payment_tbl.Name,payment_tbl.Amount ,
payment_tbl.discount AS 'Discount',payment_tbl.net_payment AS 'Net_Amount',
payment_tbl.Date  FROM payment_tbl;
ELSE
SELECT * FROM payment_tbl WHERE payment_tbl.ID=_id;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `payment_sp` (IN `_id` VARCHAR(20), IN `_name` VARCHAR(50), IN `_amount` FLOAT(20,2), IN `_discount` FLOAT(20,2), IN `_date` DATE, IN `_user_id` VARCHAR(20), IN `_action` VARCHAR(20))  BEGIN
SET @v1:= (select SUM(_amount) - SUM(ifnull(_discount,0)));
IF(_action="Insert") THEN
INSERT INTO `payment_tbl`(`Name`, `Amount`, `discount`, `net_payment`, `Date`, `user_id`) VALUES(_name,_amount,_discount,@v1,_date,_user_id);
SELECT "Inserted" as message;
END IF;
IF(_action="Update") THEN
UPDATE `payment_tbl` SET `Name`=_name,`Amount`=_amount,`discount`=_discount,
`net_payment`=@v1,`Date`=_date,`user_id`=_user_id 
WHERE payment_tbl.ID=_id;
SELECT "Updated" as message;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_payments` (IN `_from` DATE, IN `_to` DATE)  BEGIN

-- Check If The Date Is All
IF(_from = '') THEN

SELECT payment_tbl.ID,payment_tbl.Name, payment_tbl.Amount, payment_tbl.discount, payment_tbl.net_payment, payment_tbl.Date
FROM payment_tbl;

-- If The Date Is Custom And Not All
ELSE

SELECT payment_tbl.ID, payment_tbl.Name, payment_tbl.Amount, payment_tbl.discount, payment_tbl.net_payment, payment_tbl.Date
FROM payment_tbl WHERE payment_tbl.Date BETWEEN _from AND _to;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `taago_get_sp` (IN `_id` VARCHAR(100))  BEGIN
IF(_id="") THEN
SELECT
taargo_tbl.ID,concat(customer_tbl.name) as Customer,taargo_tbl.Phone,
taargo_tbl.Photo,taargo_tbl.Date FROM taargo_tbl
LEFT JOIN customer_tbl ON taargo_tbl.Name=customer_tbl.id;
ELSE
SELECT * FROM taargo_tbl WHERE taargo_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `taago_sp` (IN `_id` INT(20), IN `_name` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_photo` TEXT, IN `_date` DATE, IN `_user_id` VARCHAR(50), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `taargo_tbl`(`Name`, `Phone`, `Photo`, `Date`,`user_id`) VALUES(_name,_phone,_photo,_date,_user_id);
SELECT 'Inserted' as message;
END IF;
IF(_action="Update")THEN
UPDATE `taargo_tbl` SET `Name`=_name,`Phone`=_phone,
`Photo`=_photo,`Date`=_date,`user_id`=user_id WHERE taargo_tbl.ID=_id;
SELECT 'Updated' as message;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users_get` (IN `_id` VARCHAR(100))  BEGIN
if(_id='')THEN
SELECT
users_tbl.user_id AS ID, users_tbl.user_name as Username,
users_tbl.email as Email, users_tbl.role As Role, users_tbl.created_date as Date, users_tbl.user_status AS Status FROM users_tbl;
ELSE
SELECT *FROM users_tbl WHERE users_tbl.user_id= _id;
END IF ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users_sp` (IN `_user_id` VARCHAR(100), IN `_user_name` VARCHAR(100), IN `_password` VARCHAR(100), IN `_email` VARCHAR(100), IN `_role` VARCHAR(100), IN `_user_status` VARCHAR(50), IN `_created_date` DATE, IN `_action` VARCHAR(100))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `users_tbl` (`user_name`, `password`, `email`, `role`, `user_status`, `created_date`) VALUES(_user_name,PASSWORD(_password),_email,_role,_user_status,_created_date);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `users_tbl` SET `user_name`=_user_name,`password`=PASSWORD(_password),
`email`=_email,`role`=_role,`user_status`=_user_status,`created_date`=_created_date WHERE users_tbl.user_id=_user_id;

SELECT 'Updated' as message;
ENd IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vehicles_get_sp` (IN `_id` VARCHAR(100))  BEGIN
if(_id="")THEN
SELECT
vehicle_tbl.ID,vehicle_tbl.Type,vehicle_tbl.Plate_no,vehicle_tbl.Chassis_no,
vehicle_tbl.Model,vehicle_tbl.Color,vehicle_tbl.Cylinder,vehicle_tbl.Amount,
vehicle_tbl.Ref,owners_tbl.Name as 'Owner',c1.Name as 'Supplier',ifnull(c2.Name,'N/A') as 'Supplier2',w1.Name as 'Witness', ifnull(w2.Name,'N/A') as 'Witness2',vehicle_tbl.Registration_date,vehicle_tbl.Date FROM vehicle_tbl
JOIN customer_tbl c1 on c1.ID=vehicle_tbl.supplier_1
left JOIN customer_tbl c2 on c2.ID = vehicle_tbl.supplier_2
JOIN witness_tbl w1 on w1.ID = vehicle_tbl.witness_1
LEFT JOIN witness_tbl w2 on w2.ID = vehicle_tbl.witness_2
JOIN owners_tbl on owners_tbl.ID = vehicle_tbl.owner_id;
ELSE
SELECT *FROM vehicle_tbl WHERE vehicle_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vehicles_print_info_sp` (IN `_id` VARCHAR(100))  BEGIN
SELECT
vehicle_tbl.ID,vehicle_tbl.Type,vehicle_tbl.Plate_no,vehicle_tbl.Chassis_no,
vehicle_tbl.Model,vehicle_tbl.Color,vehicle_tbl.Cylinder,vehicle_tbl.Amount,
vehicle_tbl.Ref,
owners_tbl.Name as 'Owner',owners_tbl.Mother 'owner_mother',owners_tbl.Place 'owner_pob',owners_tbl.Dob 'owner_dob',owners_tbl.Address 'owner_address',owners_tbl.Identity 'owner_identity',owners_tbl.Phone 'owner_phone',

c1.Name as 'Supplier',c1.Mother 'supplier_1mother',c1.Place 'supplier_1place',c1.Dob 'supplier_1dob',c1.Address 'supplier_1address',c1.Identity 'supplier_1identity',c1.Phone 'supplier_1phone',

ifnull(c2.Name,'N/A') as 'Supplier2',c2.Mother 'supplier_2mother',c2.Place 'supplier_2place',c2.Dob 'supplier_2dob',c2.Address 'supplier_2address',c2.Identity 'supplier_2identity',c2.Phone 'supplier_2phone',

w1.Name as 'Witness', 
w1.Phone 'witness1phone',
ifnull(w2.Name,'N/A') as 'Witness2',
w2.Phone 'witness2phone',
vehicle_tbl.Registration_date,vehicle_tbl.Date FROM vehicle_tbl
JOIN customer_tbl c1 on c1.ID=vehicle_tbl.supplier_1
left JOIN customer_tbl c2 on c2.ID = vehicle_tbl.supplier_2
JOIN witness_tbl w1 on w1.ID = vehicle_tbl.witness_1
LEFT JOIN witness_tbl w2 on w2.ID = vehicle_tbl.witness_2
JOIN owners_tbl on owners_tbl.ID = vehicle_tbl.owner_id
WHERE vehicle_tbl.ID=_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vehicles_sp` (IN `_id` INT(100), IN `_type` VARCHAR(100), IN `_plate_no` VARCHAR(100), IN `_chassis_no` VARCHAR(100), IN `_model` VARCHAR(100), IN `_color` VARCHAR(20), IN `_cylinder` VARCHAR(100), IN `_amount` FLOAT(20,2), IN `_Ref` VARCHAR(100), IN `owner_id` INT, IN `supplier_1` INT, IN `supplier_2` INT, IN `witness_1` INT, IN `witness_2` INT, IN `_registration_date` DATE, IN `_date` DATE, IN `_user_id` VARCHAR(100), IN `_action` VARCHAR(100))  BEGIN
IF(_action="Insert")THEN

set @witness_2 =  IF(witness_2='',null,witness_2);
set @supplier_2 = IF(supplier_2='',null,supplier_2);

INSERT INTO `vehicle_tbl`(`Type`, `Plate_no`, `Chassis_no`, `Model`, `Color`, `Cylinder`, `Amount`, `Ref`, `owner_id`, `supplier_1`, `supplier_2`, `witness_1`, `witness_2`, `Registration_date`, `Date`, `user_id`)VALUES (_type,_plate_no,_chassis_no,_model,_color,_cylinder,_amount,_Ref,owner_id,supplier_1,@supplier_2,witness_1,@witness_2,_registration_date,_date,_user_id);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `vehicle_tbl` SET `Type`=_type,`Plate_no`=_plate_no,`Chassis_no`=_chassis_no,`Model`=_model,
`Color`=_color,`Cylinder`=_cylinder,`Amount`=_amount,`Ref`=_Ref,`Registration_date`=_registration_date,
`Date`=_date,`user_id`=_user_id,`owner_id`=owner_id,`supplier_1`=supplier_1,`supplier_2`=supplier_2,`witness_1`=witness_1,`witness_2`=witness_2
WHERE vehicle_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wakaalad_sp` (IN `_id` INT, IN `_provider` VARCHAR(50), IN `_phone` VARCHAR(50), IN `_des` VARCHAR(50), IN `_receive` VARCHAR(50), IN `_mobile` VARCHAR(50), IN `_ref` VARCHAR(50), IN `_date` DATE, IN `_userid` VARCHAR(50), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert") THEN
INSERT INTO `wakaalad_tbl`(`Provider`, `Phone`, `Description`, `Receiving`, `Mobile`, `Ref`, `Date`, `user_id`) VALUES  (_provider,_phone,_des,_receive,_mobile,_ref,_date,_userid);
SELECT 'Inserted' as message;
ENd IF;

IF(_action="Update")THEN
UPDATE `wakaalad_tbl` SET
`Provider`=_provider,`Phone`=_phone,`Description`=_des,`Receiving`=_receive,`Mobile`=_mobile,
`Ref`=_ref,`Date`=_date,`user_id`=_userid WHERE wakaalad_tbl.ID=_id;
SELECT 'Updated' as message;
ENd IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wakalad_get_sp` (IN `_id` VARCHAR(20))  BEGIN
IF(_id="")THEN
SELECT
wakaalad_tbl.ID,wakaalad_tbl.Provider,wakaalad_tbl.Phone,
wakaalad_tbl.Description,wakaalad_tbl.Receiving,wakaalad_tbl.Mobile,wakaalad_tbl.Ref,wakaalad_tbl.Date FROM wakaalad_tbl;
ELSE
SELECT * FROM wakaalad_tbl WHERE wakaalad_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `witness_get_sp` (IN `_id` VARCHAR(20))  BEGIN
IF(_id="")THEN
SELECT
witness_tbl.ID,witness_tbl.Name,witness_tbl.Phone FROM witness_tbl;
ELSE
SELECT * FROM witness_tbl WHERE witness_tbl.ID=_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `witness_sp` (IN `id` INT, IN `name` VARCHAR(50), IN `phone` VARCHAR(50), IN `userid` VARCHAR(50), IN `_action` VARCHAR(50))  BEGIN
IF(_action="Insert")THEN
INSERT INTO `witness_tbl`(`Name`, `Phone`, `user_id`) VALUES (name,phone,userid);
SELECT 'Inserted' as message;
ENd IF;
IF(_action="Update")THEN
UPDATE `witness_tbl` SET `Name`=name,`Phone`=phone,`user_id`=userid WHERE witness_tbl.id=id;
SELECT 'Updated' as message;
ENd IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_account` (`_id` VARCHAR(100)) RETURNS FLOAT(20,2) BEGIN
SET @total = (ifnull((SELECT SUM(payment_tbl.amount) FROM payment_tbl WHERE payment_tbl.ID=_id),0));
RETURN @total;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_balance` (`_from` DATE) RETURNS FLOAT(20,2) BEGIN
SET @total = (ifnull((SELECT SUM(payment_tbl.amount) FROM payment_tbl WHERE payment_tbl.Date <=_from),0));
RETURN @total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `ID` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Income` float NOT NULL,
  `Expense` float NOT NULL,
  `Balance` float NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`ID`, `Description`, `Income`, `Expense`, `Balance`, `Date`) VALUES
(1, 'wareejin', 100, 0, 0, '2022-01-09'),
(2, 'kala wareejin', 20, 0, 0, '2022-01-10'),
(3, 'Qado', 0, 10, 0, '2022-01-10'),
(4, 'Break Fast', 0, 20, 0, '2022-01-10'),
(6, 'Dhul', 60, 0, 0, '2022-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `customer_tbl`
--

CREATE TABLE `customer_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Mother` varchar(50) NOT NULL,
  `Place` varchar(50) NOT NULL,
  `Dob` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Identity` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_tbl`
--

INSERT INTO `customer_tbl` (`ID`, `Name`, `Mother`, `Place`, `Dob`, `Address`, `Identity`, `Phone`, `Date`, `user_id`) VALUES
(1, 'Maxamed Xuseen Cilmi', 'Xabiibo Cadceed Warsame', 'Galgaduud', '1970', 'Yaqshiid', 'Laysiin', '0615585313', '2022-01-14', '1'),
(2, 'Farxaan Cabdullahi Faarax', 'Xabiibo Maxamed Axmed', 'Cabudwaq', '1964-dii', 'H/wadag', 'ID Card', '0615953234', '2022-01-18', '1');

-- --------------------------------------------------------

--
-- Table structure for table `document_tbl`
--

CREATE TABLE `document_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Vehicle` varchar(50) NOT NULL,
  `Chassis` varchar(50) NOT NULL,
  `Plate` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Details` varchar(50) NOT NULL,
  `Ref` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document_tbl`
--

INSERT INTO `document_tbl` (`ID`, `Name`, `Vehicle`, `Chassis`, `Plate`, `Phone`, `Details`, `Ref`, `Date`, `user_id`) VALUES
(1, 'IBRAHIM MAXAMED NUUR', 'TOYOTA CARIB', 'AE115-0068017', 'AB-2155', '0615485865', 'Qabyo', 'B190/98948/021', '2021-12-27', '1'),
(2, 'KAAFI CABDI SABRIYE', 'TOYOTA LITEACE', 'CM60-0030322', 'AG-9098', '0617046474', 'Qabyo', 'B190/98919/021', '2021-12-08', '1'),
(3, 'CABDIKARIIN CUSMAAN YAROW', 'TOYOTA WIISH', 'ZNE124-0036205', 'AF-0885', '0615542410', 'Qabyo', 'B190/98944/021', '2021-12-25', '1'),
(4, 'DAHABO M-CABDULLAHI XASAN', 'TOYOTA WIISH', 'NZE124-0021849', 'AE-9758', '0615516383', 'Qabyo', 'B164/81218/020', '2020-12-05', '1'),
(5, 'MAXAMUD DAHIR XIRSI', 'TOYOTA FIELDER', 'NZE124-3028372', 'AI-7684', '0617234001', 'Qabyo', 'B190/98743/021', '2021-08-18', '1'),
(6, 'CABDULLAHI CALI HASHIM', 'SUZUKI ESCUDO', 'TD52W-104788', 'AI-6723', '0615994588', 'Qabyo', 'B164/81273/021', '2021-01-17', '1'),
(7, 'AXMED MEYRE MAKARAN', 'TOYOTA HILUX PICKUP', 'MRODB8CD200179281', 'AH-8659', '0615872342', 'Qabyo', 'B190/98684/021', '2021-06-30', '1'),
(8, 'YUSUF CALI MAHAD', 'TOYOTA NOAH', 'SR50-0083418', 'AI-9671', '0616577273', 'Qabyo', 'B190/98713/021', '2021-07-31', '1'),
(9, 'MAXAMED XASAN JEELE', 'TOYOTA HILUX SURF', 'KNZ130-9071018', 'AH-2046', '0616286450', 'Qabyo', 'B190/98680/021', '2021-06-23', '1'),
(10, 'ABSHIR XUSEEN DHUBOW', 'NISSAN CARAVAN', 'VWMGE24-423427', 'AI-5778', '0615949478', 'Qabyo', 'B164/81377/021', '2021-03-15', '1'),
(11, 'MAXAMED CUSMAN ODAWA', 'MOTO LTM', 'LDAPAKOB3KGD41791', 'MF-19X', '0615563001', 'Qabyo', 'B190/98873/021', '2021-11-11', '1'),
(12, 'COSOBOW XASAN MAXAMED', 'SUZUKI ESCUDO', 'TL52W-153914', 'AE-3190', '0615898148', 'Baxay', 'B190/98870/021', '2021-11-09', '1'),
(14, 'XAWO SIYAD KHEYRE', 'FIAT 130', '009885', 'AC-2545', '0612761500', 'Qabyo', 'B190/98780/021', '2021-09-08', '1'),
(15, 'MAXMAED CADDILADHIIF CALI', 'TOYOTA ALLION', 'ZZT245-0019829', 'AG-3170', '0615965948', 'Yaalo', 'B148/72364/018', '2018-11-18', '1'),
(16, 'DAHIR AXMED MAXAMED', 'NISSAN CARAVAN', 'VWMGE24-810802', 'AI-9858', '0615119038', 'Yaalo', 'B190/98756/021', '2021-08-23', '1'),
(17, 'CUSMAN MAXAMED CALI', 'TOYOTA IST', 'NCP115-0003613', 'AI-1530', '0615590141', 'Yaalo', 'B164/81021/020', '2020-07-18', '1'),
(18, 'NAFISO CABDISALAN CABDI', 'TOYOTA TOWNACE', 'YM60-0011448', 'AJ-0884', '064181585', 'Yaalo', 'B190/98939/021', '2021-12-22', '1'),
(19, 'MAXAMED CABDIRAXMAN CABDULLAHI', 'TOYOTA ALLION', 'ZZT245-0027304', 'AI-2629', '0614442771', 'Yaalo', 'B190/98823/021', '2021-10-09', '1'),
(20, 'CABDIRASHID AXMED MAXAMED', 'TOYOTA IST', 'NCP65-0038606', 'AG-3706', '0618128248', 'Yaalo', 'B190/98927/021', '2021-12-13', '1'),
(21, 'CABDIQADIR XASAN FARAX', 'TOYOTA HARRIER', 'ACU35-0009300', 'AI-5539', '0612123016', 'Yaalo', 'B164/81140/020', '2020-10-14', '1'),
(22, 'CALI CILMI CALI', 'TOYOTA HARRIER', 'ACU35-0005581', 'AH-8968', '0615586062', 'Yaalo', 'B190/98889/021', '2021-11-18', '1'),
(23, 'XASAN MAXAMED CALI', 'TOYOTA PREMIO', 'ZZT245-0027956', 'AH-7937', '0612043963', 'Yaalo', 'B164/81246/020', '2020-12-29', '1'),
(24, 'MAXAMED CABDULLAHI AXMED', 'NISSAN X-TRAIL', 'NT30-048399', 'AE-6931', '0612646512', 'Yaalo', 'B164/80943/020', '2020-05-01', '1'),
(25, 'AXMED XUSEEN MAXAMUD', 'TOYOTA NOAH', 'SR50-0113431', 'AI-3657', '0615878770', 'Yaalo', 'B164/80997/020', '2020-06-25', '1'),
(26, 'ADAN CALI CABDI', 'TOYOTA HILUX PICKUP', 'LN107-0003536', 'AI-0417', '0616546655', 'Yaalo', 'B164/81236/020', '2020-12-21', '1'),
(27, 'CABDALLA ABUKAR MAXAMED', 'TOYOTA COROLLA', 'AE104-0010036', 'AB-5003', '0615456052', 'Yaalo', 'B164/80852/019', '2019-12-30', '1'),
(28, 'CUMAR DIINI XOOSH', 'TOYOTA HARRIER', 'ACU35-0011631', 'AG-3012', '0615274720', 'Yaalo', 'B190/98799/021', '2021-09-20', '1'),
(29, 'MAXAMED ADAN IBRAHIM', 'NISSAN CARAVAN', 'VWMGE24-400619', 'AH-9731', '0615563555', 'Yaalo', 'B164/81427/021', '2021-04-15', '1'),
(30, 'MAXAMED DAHIR ADAN', 'NISSAN CARAVAN', 'CWGE24-416716', 'AI-4831', '0615177777', 'Yaalo', 'B164/81157/020', '2020-10-24', '1'),
(31, 'CABDINASIR XAASHI JIMCAALE', 'TOYOTA HILUX SURF', 'TRN215-0011332', 'AG-4549', '0615568011', 'Yaalo', 'B164/81108/020', '2020-09-19', '1'),
(32, 'CABDULLE AXMED MAXAMED', 'MITSUBISHI PAJERO', 'H57A-0111987', 'AJ-0404', '0615052032', 'Yaalo', 'B190/98853/021', '2021-10-23', '1'),
(33, 'CALAS CALI JIMCAALE', 'TOYOTA HARRIER', 'ACU35-0013077', 'AH-8043', '0615556988', 'Yaalo', 'B190/98764/021', '2021-08-25', '1'),
(34, 'MAXAMED FARAX BARE', 'MITSUBISHI PAJERO', 'H57A-0116699', 'AJ-1319', '0615398624', 'Yaalo', 'B190/98866/021', '2021-11-07', '1'),
(35, 'DAA\'UUD MAXAMED ADAN', 'TOYOTA HILUX PICKUP', 'MROHA3CD-100378300', 'AI-1886', '0615505167', 'Yaalo', 'B164/81289/021', '2021-01-24', '1'),
(36, 'DAHIR AXMED MAXAMED', 'TOYOTA NOAH', 'SR50-0079303', 'AI-7803', '0615119038', 'Yaalo', 'B190/98755/021', '2021-08-23', '1'),
(37, 'MAXAMED BARE MAXAMUD', 'TOYOTA MARKII', 'GX115-6010163', 'AI-5339', '0614215555', 'Yaalo', 'B164/81399/021', '2021-03-29', '1'),
(38, 'MOWLIID CALAS CALI', 'TOYOTA PREMIO', 'ZZT245-0035918', 'AG-6101', '0615840997', 'Yaalo', 'B190/98804/021', '2021-09-26', '1'),
(39, 'NURADIIN SALAAD QAASIM', 'TOYOTA FIELDER', 'NZE124-004168', 'AI-7278', '0614912344', 'Yaalo', 'B164/81309/021', '2021-02-01', '1'),
(40, 'CABDIKARIIN JAMAC XARIIR', 'TOYOTA ALLION', 'ZZT245-0029296', 'AG-4589', '0613690039', 'Baxay', 'B190/98953/021', '2021-12-28', '1'),
(41, 'AXMED CABDULLE XUSEEN', 'TOYOTA CARIB', 'AE114-7000346', 'AH-5775', '0618101006', 'Baxay', 'B190/98952/021', '2021-12-28', '1'),
(42, 'CABDI MAXAMED CIISE', 'TOYOTA DYNA', 'BU73-0000191', 'AH-9896', '0615575578', 'Baxay', 'B190/98951/021', '2021-12-27', '1'),
(43, 'SHAMSO AXMED CABDULLE', 'MOTO RE', 'MD2A25BZOHWG70368', 'MP-365', '0615827316', 'Baxay', 'B190/98947/021', '2021-12-26', '1'),
(44, 'CABDIRISAQ AXMED CABDI DINI', 'MOTO RE', 'MD2A25BZOHWH80241', 'MQ-118', '0618488789', 'Baxay', 'B190/98910/021', '2021-12-02', '1'),
(45, 'MAXAMED XAJI XUSEEN MUUSE', 'TOYOTA PREMIO', 'ZZT245-0037245', 'AH-5406', '065137235', 'Baxay', 'B190/98950/021', '2021-12-27', '1'),
(46, 'CABDULLAHI CILMI CAWAALE', 'TOYOTA PREMIO', 'ZZT245-0028312', 'AH-1660', '0615168645', 'Baxay', 'B190/98902/021', '2021-11-28', '1'),
(47, 'FARAX MAXAMUD ADAN', 'TOYOTA HARRIER', 'ACU35-0019611', 'AI-3013', '0615388438', 'Baxay', 'B190/98702/021', '2021-07-18', '1'),
(48, 'SACIID ADAN CABDULLE', 'TOYOTA PRADO', 'TRJ120-5027640', 'AI-7810', '0614886767', 'Baxay', 'B190/98920/021', '2021-12-09', '1'),
(49, 'WARSHADA BIYAHA AL-NACIM, WAKIL AXMED CALI CUMAR', 'NISSAN DIESSEL', 'CM89G800365', 'AI-8400', '061575016', 'Baxay', 'B190/98921/021', '2021-12-09', '1'),
(50, 'AXMED CABDI XASAN', 'TOYOTA FIELDER', 'NZE124-3029199', 'AJ-0279', '0615222586', 'Baxay', 'B190/98922/021', '2021-12-09', '1'),
(51, 'MARKAZ AS-SUNNAH, WAKIL: CABDIRAXMAN CALI AXMED', 'NISSAN CIVILIAN', 'BW40-030348', 'AJ-1327', '0615545939', 'Baxay', 'B190/98923/021', '2021-12-13', '1'),
(52, 'MAXAMED ISAQ CABDI', 'TOYOTA FIELDER', 'NZE124-0049719', 'AH-2348', '0615646857', 'Baxay', 'B190/98925/021', '2021-12-13', '1'),
(53, 'MAXAMED CABDIRAXMAN XASHI', 'TOYOTA HILUX PICKUP', 'MROHX8CD701357795', 'AJ-0357', '0619913344', 'Baxay', 'B190/98926/021', '2021-12-13', '1'),
(54, 'CABDIKARIN MAXAMED ISMACIIL', 'TOYOTA SUCCEED', 'NCP55-0080602', 'AJ-1537', '0615111400', 'Baxay', 'B190/98928/021', '2021-12-14', '1'),
(55, 'ADAN SICIID ABA-NUR', 'MOTO RE', 'MD2A25BZ9JWD70348', 'MU-968', '0616107543', 'Baxay', 'B190/98929/021', '2021-12-14', '1'),
(56, 'SAYNAB YUSUF CABDINUR', 'MOTO RE', 'MD2A25BYOLWG93939', 'M2B-384', '0615596366', 'Baxay', 'B190/98930/021', '2021-12-15', '1'),
(57, 'XADI MAXAMED XASHI', 'TOYOTA PREMIO', 'ZZT245-0026037', 'AJ-1630', '0612349061', 'Baxay', 'B190/98931/021', '2021-12-18', '1'),
(58, 'LIIBAAN CAABI NUUR', 'TOYOTA SPACIO', 'ZZE124-3015887', 'AI-3377', '0615990399', 'Baxay', 'B190/98932/021', '2021-12-18', '1'),
(59, 'ILEYS ACADEMY SCHOOL, WAKIL: MIRE MAXAMED MAXAMUD', 'TOYOTA FIELDER', 'NZE124-0049447', 'AF-6089', '065650958', 'Baxay', 'B190/98933/021', '2021-12-18', '1'),
(60, 'DAHIR CABDIRAXMAN MAXAMUD', 'TOYOTA FIELDER', 'NZE124-0035402', 'AI-3002', '0615530452', 'Baxay', 'B190/98934/021', '2021-12-19', '1'),
(61, 'ABUBAKAR XASAN MAXAMED', 'TOYOTA NOAH', 'SR50-0061465', 'AJ-1694', '0615528810', 'Baxay', 'B190/98935/021', '2021-12-19', '1'),
(62, 'AXMED MAXAMED XASAN', 'TOYOTA ALLION', 'ZZT245-0003441', 'AH-2697', '0612699948', 'Baxay', 'B190/98936/021', '2021-12-21', '1'),
(63, 'MAXAMED CUSMAN FARAX', 'TOYOTA NOAH', 'SR50-0104334', 'AI-9856', '0615883132', 'Baxay', 'B190/98937/021', '2021-12-21', '1'),
(64, 'AXMED NUUNE AXMED', 'TOYOTA ALLION', 'ZZT245-0036858', 'AF-2424', '0616827901', 'Baxay', 'B190/98938/021', '2021-12-22', '1'),
(65, 'CABDIRAXMAN ADAN CABDIKARIN', 'MITSUBISHI FUZU', 'FK335G540290', 'AI-0683', '0615876531', 'Baxay', 'B190/98940/021', '2021-12-23', '1'),
(66, 'TAHLIIL CABDISHAKUR XASAN', 'TOYOTA PROBOX', 'NCP55-0044111', 'AJ-1612', '0616118686', 'Baxay', 'B190/98941/021', '2021-12-23', '1'),
(67, 'NUUR MAXAMUD CALI', 'TOYOTA TOWNACE', 'YM60-0003910', 'AF-9698', '0615594335', 'Baxay', 'B190/98942/021', '2021-12-23', '1'),
(68, 'SIYAD MAXAMED SIYAD', 'TOYOTA ALLION', 'ZZT245-0036845', 'AI-5972', '0615515516', 'Baxay', 'B190/98943/021', '2021-12-23', '1'),
(69, 'SIICOW HADAFOW MAXAMUD', 'TOYOTA ALLION', 'ZZT245-0006126', 'AG-4067', '0615521682', 'Baxay', 'B190/98945/021', '2021-12-25', '1'),
(70, 'CABDIFITAX CUSMAN MAXAMED', 'SUZUKI ESCUDO', 'TD54W-111796', 'AG-2699', '0615497541', 'Baxay', 'B190/98946/021', '2021-12-25', '1'),
(75, 'AXMED XAASHI JIMCAALE', 'TOYOTA FIELDER', 'NZE124-3027223', 'AI-7813', '0615565288', 'Baxay', 'B190/98958/022', '2022-01-03', '1'),
(76, 'MAXAMED CALI MAKARAN, WAKIL: CABDULLAHI MAKARAN CA', 'TOYOTA NOAH', 'SR50-0093050', 'AJ-1991', '004746949998', 'Baxay', 'B190/98959/022', '2022-01-02', '1'),
(77, 'CIISE CABDI JILACOW', 'TOYOTA SPACIO', 'ZZE124-3007637', 'AG-9892', '0615969612', 'Baxay', 'B190/98955/022', '2022-01-01', '1'),
(78, 'ASAD MUXUDIIN CUMAR', 'TOYOTA PREMIO', 'ZZT245-0028312', 'AH-1660', '0615386850', 'Baxay', 'B190/98961/022', '2022-01-04', '1'),
(79, 'CALAS CALI JIMCAALE', 'TOYOTA FRONTIER', '1N6ADOEVXEN714299', 'AH-3992', '0615556988', 'Baxay', 'B190/98956/022', '2022-01-02', '1'),
(80, 'LIIBAAN MAXAMED GARUUN', 'TOYOTA PREMIO', '2RT265-3005970', 'AI-5162', '0615597707', 'Qabyo', 'B190/98960/022', '2022-01-04', '1'),
(81, 'MAXAMED CABDI QAASIM', 'TOYOTA FRONTIER', '1N6ADOEVXEN714299', 'AH-3992', '0611204628', 'Qabyo', 'B190/98957/022', '2022-01-02', '1'),
(100, 'COSOBOW XASAN MAXAMED', 'SUZUKI ESCUDO', 'TL52W-153914', 'AE-3190', '0615898148', 'Baxay', 'B190/98870/201', '2021-11-09', '1'),
(104, 'JAMAL GARANE  MAXAMED', 'TOYOTA SPACIO', 'ZZE124-3003052', 'AC-7094', '0615894828', 'Baxay', 'B138/67539/018', '2018-04-30', '1'),
(105, 'AHMED KHALIIF MAXAMED', 'TOYOTA NOAH', 'SR50-0083426', 'AH-8535', '0615957897', 'Baxay', 'B164/80786/019', '2019-08-11', '1'),
(106, 'MAXAMED FAARAX MAXAMED', 'NISSAN UD', 'CM87EE-41119', 'AC-4379', '0612738985', 'Baxay', 'B190/98978/022', '2022-01-13', '1');

-- --------------------------------------------------------

--
-- Table structure for table `expense_tbl`
--

CREATE TABLE `expense_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Amount` float(11,2) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense_tbl`
--

INSERT INTO `expense_tbl` (`ID`, `Name`, `Phone`, `Description`, `Amount`, `Type`, `Date`, `userid`) VALUES
(1, 'Rent', '0716359080', 'Rent for Jan', 20.00, 'EVCPLUS', '2022-02-10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `income_tbl`
--

CREATE TABLE `income_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Plate` varchar(50) NOT NULL,
  `Amount` float(20,2) NOT NULL,
  `Date` date NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income_tbl`
--

INSERT INTO `income_tbl` (`ID`, `Name`, `Phone`, `Description`, `Plate`, `Amount`, `Date`, `userid`) VALUES
(1, 'Mahad Abdullahi Abdirahman', '0617737088', 'Wareegin gaari', 'AF-7040', 20.00, '2022-02-01', '1');

-- --------------------------------------------------------

--
-- Table structure for table `owners_tbl`
--

CREATE TABLE `owners_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mother` varchar(100) NOT NULL,
  `Place` varchar(50) NOT NULL,
  `Dob` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Identity` varchar(50) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `owners_tbl`
--

INSERT INTO `owners_tbl` (`ID`, `Name`, `Mother`, `Place`, `Dob`, `Address`, `Identity`, `Phone`, `Date`, `user_id`) VALUES
(1, 'Mohamed Abdinor Mohamed', 'Maryama Mohamed Abdi', 'Mogadishu', '1997', 'Hodan', 'Laysiin', '0615241155', '2021-12-05', '1'),
(2, 'Zaki abdalle Mohamed', 'Hawo Osman Farah', 'Mogadishu', '2000', 'xamarweyne', 'Passport', '061896542', '2021-12-27', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tbl`
--

CREATE TABLE `payment_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Amount` float(20,2) NOT NULL,
  `discount` float(20,2) NOT NULL,
  `net_payment` float(20,2) NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_tbl`
--

INSERT INTO `payment_tbl` (`ID`, `Name`, `Amount`, `discount`, `net_payment`, `Date`, `user_id`) VALUES
(5, 'CABDISHAKUR GARAD CALI', 18.00, 0.00, 18.00, '2021-11-03', '1'),
(6, 'MAXAMED AXMED CABDI', 20.00, 0.00, 20.00, '2021-11-04', '1'),
(7, 'MAXAMED  CALI IBRAHIM ', 15.00, 0.00, 15.00, '2021-11-06', '1'),
(8, 'CABDI-AWAL CIISE MAHADALE', 20.00, 0.00, 20.00, '2021-11-06', '1'),
(9, 'CADAAWE JAMAC SALAAD', 20.00, 0.00, 20.00, '2021-11-07', '1'),
(10, 'MAXAMED FARAX BARE', 15.00, 0.00, 15.00, '2021-11-07', '1'),
(11, 'CABDULLAHI CILMI CAWALE', 15.00, 0.00, 15.00, '2021-11-07', '1'),
(12, 'MAXAMED MACALIN ABSHIR', 20.00, 0.00, 20.00, '2021-11-09', '1'),
(13, 'YUSUF GEEDI SHADUUQ', 20.00, 0.00, 20.00, '2021-11-09', '1'),
(14, 'COSOBOW XASAN MAXAMED', 15.00, 0.00, 15.00, '2021-11-09', '1'),
(15, 'CABDULLAHI CALI JUULLE', 20.00, 0.00, 20.00, '2021-11-10', '1'),
(16, 'MAXAMED CABDULLAHI XUSEEN', 20.00, 0.00, 20.00, '2021-11-11', '1'),
(17, 'MAXAMED CUSMAN ODAWA', 15.00, 0.00, 15.00, '2021-11-11', '1'),
(18, 'CABDULLAHI BURAALE MUXUMAD', 20.00, 0.00, 20.00, '2021-11-11', '1'),
(19, 'MOWLIID CALAS CALI', 10.00, 0.00, 10.00, '2021-11-11', '1'),
(20, 'CABDIKARIIN MUUSE MUUDEY', 20.00, 0.00, 20.00, '2021-11-13', '1'),
(21, 'MAXAMED MAYOW XUSEEN', 15.00, 0.00, 15.00, '2021-11-13', '1'),
(22, 'MAXAMED MAYOW XUSEEN', 15.00, 0.00, 15.00, '2021-11-13', '1'),
(23, 'MAXAMED MUUSE AXMED', 30.00, 0.00, 30.00, '2021-11-13', '1'),
(24, 'SAYID-CUMAR MAXAMED GEEDI', 20.00, 0.00, 20.00, '2021-11-13', '1'),
(25, 'SHIRKADA BECO POWERING SOMALIA', 20.00, 0.00, 20.00, '2021-11-13', '1'),
(26, 'XIRSI CABDI JIMCAALE', 15.00, 0.00, 15.00, '2021-11-14', '1'),
(27, 'MAXAMED CABDI MAXAMED', 18.00, 0.00, 18.00, '2021-11-14', '1'),
(28, 'YUSUF ABUUKAR CALI', 20.00, 0.00, 20.00, '2021-11-15', '1'),
(29, 'CABDULLAHI CILMI CAWALE', 15.00, 0.00, 15.00, '2021-11-15', '1'),
(30, 'MAXAMED XUSEEN CABDI', 20.00, 0.00, 20.00, '2021-11-15', '1'),
(31, 'MAXAMUD MAXAMED AXMED', 20.00, 0.00, 20.00, '2021-11-16', '1'),
(32, 'SHUCAYB BASHIIR DIRIYE', 50.00, 0.00, 50.00, '2021-11-17', '1'),
(33, 'CALI CILMI CALI', 15.00, 0.00, 15.00, '2021-11-18', '1'),
(34, 'CABDULLAHI ISMACIIL CABDI', 20.00, 0.00, 20.00, '2021-11-20', '1'),
(35, 'CABDIFITAX ABUBAKAR XASAN', 15.00, 0.00, 15.00, '2021-11-21', '1'),
(36, 'SULEYMAN XASAN SAALAX', 20.00, 0.00, 20.00, '2021-11-22', '1'),
(37, 'MAXAMED KORANE AXMED', 15.00, 0.00, 15.00, '2021-11-22', '1'),
(38, 'MAXAMED CALI MAXAMUUD', 20.00, 0.00, 20.00, '2021-11-22', '1'),
(39, 'NUUR XUSEEN CALI', 15.00, 0.00, 15.00, '2021-11-22', '1'),
(40, 'CUMAR MAXAMED NUUR', 20.00, 0.00, 20.00, '2021-11-24', '1'),
(41, 'MAXAMED AXMED CADAWE', 20.00, 0.00, 20.00, '2021-11-24', '1'),
(42, 'CABDIRAXMAN CUMAR CALI', 20.00, 0.00, 20.00, '2021-11-24', '1'),
(43, 'ASAD XUSEEN SHIDAALE', 20.00, 0.00, 20.00, '2021-11-28', '1'),
(44, 'CABDIRASHIID AXMED CIGAAL', 20.00, 0.00, 20.00, '2021-11-28', '1'),
(45, 'CABDULLAHI CILMI CAWAALE', 15.00, 0.00, 15.00, '2021-11-28', '1'),
(46, 'AXMED MAXAMUD CALI', 20.00, 0.00, 20.00, '2021-11-29', '1'),
(47, 'CABDULLAHI ABUUKAR MURSAL', 20.00, 0.00, 20.00, '2021-11-29', '1'),
(48, 'CANAB CABDULLAHI ADAN', 15.00, 0.00, 15.00, '2021-11-30', '1'),
(49, 'ABUUKAR CUSMAN CUMAR', 18.00, 0.00, 18.00, '2021-11-30', '1'),
(51, 'MAHAD ABDULLAHI ABDIRAHMAN', 100.00, 50.00, 50.00, '2022-01-10', '1'),
(52, 'MAXAMED FAARAX MAXAMED', 20.00, 0.00, 20.00, '2022-01-13', '1'),
(54, 'Mahad Abdullahi', 0.00, 20.00, -20.00, '2022-01-20', '1');

-- --------------------------------------------------------

--
-- Table structure for table `taargo_tbl`
--

CREATE TABLE `taargo_tbl` (
  `ID` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taargo_tbl`
--

INSERT INTO `taargo_tbl` (`ID`, `Name`, `Phone`, `Photo`, `Date`, `user_id`) VALUES
(2, 1, '0615213440', '1_2022.01.20.11.42.23am_photo.png', '2022-01-18', 1),
(3, 2, '0613521137', '2_2022.01.19.05.24.56pm_photo.png', '2022-01-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`user_id`, `user_name`, `password`, `email`, `role`, `user_status`, `created_date`) VALUES
(1, 'bashka', '*D67ABF400C6B9BC0DC45203A28BA715F29E86F01', 'bashka171@gmail.com', 'admin', 'Active', '2021-07-28'),
(2, 'mahad', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', 'mahadcad@gmail.com', 'admin', 'Active', '2021-07-28'),
(3, 'naqib', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 'naqib@gmail.com', 'admin', 'Active', '2021-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_tbl`
--

CREATE TABLE `vehicle_tbl` (
  `ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Plate_no` varchar(50) NOT NULL,
  `Chassis_no` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Cylinder` varchar(10) NOT NULL,
  `Amount` float(20,2) NOT NULL,
  `Ref` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `supplier_1` int(11) NOT NULL,
  `supplier_2` int(11) DEFAULT NULL,
  `witness_1` int(11) NOT NULL,
  `witness_2` int(11) DEFAULT NULL,
  `Registration_date` date NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_tbl`
--

INSERT INTO `vehicle_tbl` (`ID`, `Type`, `Plate_no`, `Chassis_no`, `Model`, `Color`, `Cylinder`, `Amount`, `Ref`, `owner_id`, `supplier_1`, `supplier_2`, `witness_1`, `witness_2`, `Registration_date`, `Date`, `user_id`) VALUES
(9, 'Toyota Noah', 'AH-9535', 'SR50-965412', '1990', 'White', '4', 1200.00, 'B90/320120', 1, 1, 0, 1, 2, '2022-01-01', '2022-01-31', '3'),
(10, 'Besa', 'AB1010', '123', '25', 'white', '4', 1500.00, 'RV001/P1/012', 1, 1, 2, 1, 2, '2022-02-16', '2022-02-16', '3'),
(13, 'Besa', 'AB1010', '123', '250', 'white', '4', 1500.00, 'RV001/P1/012', 2, 1, NULL, 2, NULL, '2022-02-16', '2022-02-16', '3');

-- --------------------------------------------------------

--
-- Table structure for table `wakaalad_tbl`
--

CREATE TABLE `wakaalad_tbl` (
  `ID` int(11) NOT NULL,
  `Provider` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Receiving` varchar(50) NOT NULL,
  `Mobile` varchar(50) NOT NULL,
  `Ref` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wakaalad_tbl`
--

INSERT INTO `wakaalad_tbl` (`ID`, `Provider`, `Phone`, `Description`, `Receiving`, `Mobile`, `Ref`, `Date`, `user_id`) VALUES
(10, 'BASHIIR MOHAMED HUSSEIN', '0615556988', 'WAKALAD GAARI', 'MAHAD ABDULAHI ABDIRAHMAN', '0617785522', 'B190/895221', '2022-01-20', '1');

-- --------------------------------------------------------

--
-- Table structure for table `witness_tbl`
--

CREATE TABLE `witness_tbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `witness_tbl`
--

INSERT INTO `witness_tbl` (`ID`, `Name`, `Phone`, `user_id`) VALUES
(1, 'Mahad Abdullahi Abdirahman', 615984120, '1'),
(2, 'Bashiir Mohamed Hussein', 66177055, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `phone` (`Phone`),
  ADD KEY `created_user` (`user_id`);

--
-- Indexes for table `document_tbl`
--
ALTER TABLE `document_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Ref` (`Ref`);

--
-- Indexes for table `expense_tbl`
--
ALTER TABLE `expense_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `income_tbl`
--
ALTER TABLE `income_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `owners_tbl`
--
ALTER TABLE `owners_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `taargo_tbl`
--
ALTER TABLE `taargo_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customer_name` (`Name`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicle_tbl`
--
ALTER TABLE `vehicle_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `supplier_1` (`supplier_1`),
  ADD KEY `witess_1` (`witness_1`),
  ADD KEY `witness_2` (`witness_2`),
  ADD KEY `owner_customer` (`owner_id`);

--
-- Indexes for table `wakaalad_tbl`
--
ALTER TABLE `wakaalad_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Ref` (`Ref`);

--
-- Indexes for table `witness_tbl`
--
ALTER TABLE `witness_tbl`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `document_tbl`
--
ALTER TABLE `document_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `expense_tbl`
--
ALTER TABLE `expense_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `income_tbl`
--
ALTER TABLE `income_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `owners_tbl`
--
ALTER TABLE `owners_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `taargo_tbl`
--
ALTER TABLE `taargo_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicle_tbl`
--
ALTER TABLE `vehicle_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wakaalad_tbl`
--
ALTER TABLE `wakaalad_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `witness_tbl`
--
ALTER TABLE `witness_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `taargo_tbl`
--
ALTER TABLE `taargo_tbl`
  ADD CONSTRAINT `customer_name` FOREIGN KEY (`Name`) REFERENCES `customer_tbl` (`ID`);

--
-- Constraints for table `vehicle_tbl`
--
ALTER TABLE `vehicle_tbl`
  ADD CONSTRAINT `owner_customer` FOREIGN KEY (`owner_id`) REFERENCES `owners_tbl` (`ID`),
  ADD CONSTRAINT `supplier_1` FOREIGN KEY (`supplier_1`) REFERENCES `customer_tbl` (`ID`),
  ADD CONSTRAINT `witess_1` FOREIGN KEY (`witness_1`) REFERENCES `witness_tbl` (`ID`),
  ADD CONSTRAINT `witness_2` FOREIGN KEY (`witness_2`) REFERENCES `witness_tbl` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

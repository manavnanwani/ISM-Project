-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 12:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountmaster`
--

CREATE TABLE `accountmaster` (
  `accounttype` varchar(25) NOT NULL,
  `prefix` varchar(11) NOT NULL,
  `minbalance` double(12,2) NOT NULL,
  `interest` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountmaster`
--

INSERT INTO `accountmaster` (`accounttype`, `prefix`, `minbalance`, `interest`) VALUES
('Current', 'cur', 6000.00, 600.00),
('Salary account', 'sal', 0.00, 10.00),
('Savings', 'sv', 4000.00, 500.00),
('Student', 'stu', 500.00, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accno` varchar(25) NOT NULL,
  `customerid` int(10) NOT NULL,
  `accstatus` varchar(25) NOT NULL,
  `accopendate` date NOT NULL,
  `accounttype` varchar(25) NOT NULL,
  `accountbalance` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accno`, `customerid`, `accstatus`, `accopendate`, `accounttype`, `accountbalance`) VALUES
('415236', 98682, 'active', '2022-02-02', 'Savings', 94320.00),
('516267', 98680, 'active', '2022-02-02', 'Current', 1000000.00),
('78312', 98683, 'active', '2022-02-10', 'Savings', 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `ifsccode` varchar(25) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `branchaddress` text NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`ifsccode`, `branchname`, `city`, `branchaddress`, `state`, `country`, `pincode`) VALUES
('GUR2345', 'Head office', 'Gurgaon', 'National Highway 8, 67 KM Milestone', 'Haryana', 'India', 122413),
('HYD1234', 'Hyderabad branch', 'hyderabad', 'Balaji nagar, Kukatpally, JNTU', 'Telangana', 'India', 155200);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerid` int(10) NOT NULL,
  `ifsccode` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `accpassword` varchar(50) NOT NULL,
  `transpassword` varchar(50) NOT NULL,
  `accstatus` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `accopendate` date NOT NULL,
  `lastlogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `ifsccode`, `firstname`, `lastname`, `loginid`, `accpassword`, `transpassword`, `accstatus`, `city`, `state`, `country`, `accopendate`, `lastlogin`) VALUES
(98680, 'BOGC2345', 'Tom', 'Cruise', 'MI5', 'agent', 'dash', 'ACTIVE', 'Bangalore', 'KARNATAKA', 'INDIA', '2013-02-02', '2013-07-06 06:23:03'),
(98682, 'IB1232', 'Brad', 'Pitt', 'Cool', '12345', '123456', 'ACTIVE', 'London', 'EDGBASTON', 'ENGLAND', '2013-02-02', '2013-07-03 05:54:11'),
(98683, 'WB6357', 'Al', 'Pacino', 'Goldy', 'old', 'gold', 'ACTIVE', 'New York', 'MICHIGAN', 'USA', '2013-02-09', '2013-07-04 08:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `empid` int(10) NOT NULL,
  `employee_name` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contactno` varchar(30) NOT NULL,
  `createdat` date NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`empid`, `employee_name`, `loginid`, `password`, `emailid`, `contactno`, `createdat`, `last_login`) VALUES
(313786, 'John', '445545', '125487', 'john@yahoo.com', '9535543313', '2022-02-04', '2012-12-03 11:27:00'),
(313787, 'Manav', 'manav', 'qwert', 'manav@gmail.com', '98478872783', '2022-02-04', '0000-00-00 00:00:00'),
(313788, 'Aayush', '353535', '3636', 'aayush@hotmail.com', '95425422424', '2022-02-04', '0000-00-00 00:00:00'),
(313791, 'admin', 'admin', 'admin', 'admin', '8100496433', '2022-02-04', '2013-01-12 00:00:00'),
(313798, 'Priyanshu', 'priyanshu', '123456', 'priyanshu@gmail.com', '9874563210', '2022-02-04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loanid` int(10) NOT NULL,
  `loantype` varchar(25) NOT NULL,
  `loanamt` varchar(25) NOT NULL,
  `customerid` int(12) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `startdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loanpayment`
--

CREATE TABLE `loanpayment` (
  `paymentid` int(10) NOT NULL,
  `date` date NOT NULL,
  `paidamt` float(10,2) NOT NULL,
  `principleamt` float(10,2) NOT NULL,
  `interestamt` float(10,2) NOT NULL,
  `balance` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loanpayment`
--

INSERT INTO `loanpayment` (`paymentid`, `date`, `paidamt`, `principleamt`, `interestamt`, `balance`) VALUES
(2147483647, '2022-02-04', 50000.00, 25000.00, 2500.50, 250000.00);

-- --------------------------------------------------------

--
-- Table structure for table `loantype`
--

CREATE TABLE `loantype` (
  `loantype` varchar(25) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `maximumamt` float(10,2) NOT NULL,
  `minimumamt` float(10,2) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loantype`
--

INSERT INTO `loantype` (`loantype`, `prefix`, `maximumamt`, `minimumamt`, `interest`, `status`) VALUES
('CAR', 'cr', 100000000.00, 100000.00, 8.00, ''),
('current', 'sb', 70000.00, 50000.00, 3000.00, 'active'),
('homeloan', 'hl', 1000000.00, 50000.00, 65.09, 'active'),
('sb', 'fd', 7000.00, 5000.00, 400.00, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `id` int(11) NOT NULL,
  `IpAddress` varchar(15) NOT NULL,
  `TryTime` int(20) NOT NULL,
  `TimeofLogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`id`, `IpAddress`, `TryTime`, `TimeofLogin`) VALUES
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313484, '2022-04-19 01:54:44'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313485, '2022-04-19 01:54:45'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46'),
(0, '127.0.0.1', 1650313486, '2022-04-19 01:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `registered_payee`
--

CREATE TABLE `registered_payee` (
  `slno` int(11) NOT NULL,
  `payeename` varchar(25) NOT NULL,
  `accountnumber` varchar(25) NOT NULL,
  `accounttype` varchar(25) NOT NULL,
  `bankname` varchar(25) NOT NULL,
  `ifsccode` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_payee`
--

INSERT INTO `registered_payee` (`slno`, `payeename`, `accountnumber`, `accounttype`, `bankname`, `ifsccode`) VALUES
(67543, 'arpitha', '26548', 'saving', 'canarabank', 'KARB0000404'),
(67544, 'aastha', '123458', 'CURRENT ACCOUNT', 'Canara Bank', '1254333');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionid` int(11) NOT NULL,
  `paymentdate` datetime NOT NULL,
  `payeeid` int(11) NOT NULL,
  `receiveid` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentstat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionid`, `paymentdate`, `payeeid`, `receiveid`, `amount`, `paymentstat`) VALUES
(1, '2013-07-03 12:16:15', 4666, 67543, 1, 'active'),
(2, '2013-07-03 05:40:33', 98683, 67543, 2, 'active'),
(3, '2013-07-03 07:45:13', 98683, 67543, 10, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountmaster`
--
ALTER TABLE `accountmaster`
  ADD PRIMARY KEY (`accounttype`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accno`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`ifsccode`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loanid`);

--
-- Indexes for table `loanpayment`
--
ALTER TABLE `loanpayment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `loantype`
--
ALTER TABLE `loantype`
  ADD UNIQUE KEY `loantype` (`loantype`);

--
-- Indexes for table `registered_payee`
--
ALTER TABLE `registered_payee`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98684;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `empid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313800;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loanid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loanpayment`
--
ALTER TABLE `loanpayment`
  MODIFY `paymentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `registered_payee`
--
ALTER TABLE `registered_payee`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67545;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

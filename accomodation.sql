/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`accommodation` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `accommodation`;

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
    `locationId` int(11) NOT NULL,
    `location_short_name` varchar(40) NOT NULL,
    `location_manager` varchar(50) NOT NULL,
    PRIMARY KEY (`locationId`)
    );

/*
Enter data here
*/
DROP TABLE IF EXISTS `ref_unit_types`;
CREATE TABLE `ref_unit_types` (
    `unit_type_code` int(11) NOT NULL,
    `unit_description` varchar(50) NOT NULL,
    PRIMARY KEY (`unit_type_code`)
    );

/* 
Enter the data here
*/

DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
    `unit_id` int(11) NOT NULL,
    `locationId` int(11) NOT NULL,
    `unit_type_code` int(11) NOT NULL,
    `unit_number` int(11) NOT NULL,
    `bedroom_count` int(11) NOT NULL,
    PRIMARY KEY(`unit_id`),
    KEY `locationId` (`locationId`),
    KEY `unit_type_code` (`unit_type_code`),
    CONSTRAINT `units_ibfk_1` FOREIGN KEY (`locationId`) REFERENCES `location` (`locationId`),
    CONSTRAINT `units_ibfk_2` FOREIGN KEY (`unit_type_code`) REFERENCES `ref_unit_types` (`unit_type_code`)
    );

/* 
Enter the data here
*/

DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
    `guest_id` int(11) NOT NULL,
    `gender` varchar(20) NOT NULL,
    `guest_first_name` varchar(30) NOT NULL,
    `guest_last_name` varchar(30) NOT NULL,
    `date_of_birth` varchar(50) NOT NULL,
    PRIMARY KEY (`guest_id`)
    );

/* 
Enter the data here
*/

DROP TABLE IF EXISTS `ref_booking_status`;
CREATE TABLE `ref_booking_status` (
    `booking_status_code` varchar(50) NOT NULL,
    PRIMARY KEY (`booking_status_code`)
    );

/*
Enter the data here
*/


DROP TABLE IF EXISTS `unit_bookings`;
CREATE TABLE `unit_bookings` (
    `unit_booking_id` int(11) NOT NULL,
    `unit_id` int(11) NOT NULL,
    `guest_id` int(11) NOT NULL,
    `booking_status_code` varchar(50) NOT NULL,
    `start_date` varchar(50) NOT NULL,
    `end_date` varchar(50) NOT NULL,
    PRIMARY KEY (`unit_booking_id`),
    KEY `unit_id` (`unit_id`),
    KEY `guest_id` (`guest_id`),
    KEY `booking_status_code` (`booking_status_code`),
    CONSTRAINT `unit_bookings_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`),
    CONSTRAINT `unit_bookings_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
    CONSTRAINT `unit_bookings_ibfk_3` FOREIGN KEY (`booking_status_code`) REFERENCES `ref_booking_status` (`booking_status_code`)
    );

/*
Enter the data here
*/

DROP TABLE IF EXISTS `view_unit_status`;
CREATE TABLE `view_unit_status` (
    `unit_id` int(11) NOT NULL,
    `status_date` varchar(50) NOT NULL,
    `unit_booking_id` int(11) NOT NULL,
    PRIMARY KEY (`status_date`),
    KEY `unit_id` (`unit_id`),
    KEY `unit_booking_id` (`unit_booking_id`),
    CONSTRAINT `view_unit_status_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`),
    CONSTRAINT `view_unit_status_ibfk_2` FOREIGN KEY (`unit_booking_id`) REFERENCES `unit_bookings` (`unit_booking_id`)
    );

/*
Enter the data here
*/

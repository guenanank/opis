-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `dawenkmotor`;
CREATE DATABASE `dawenkmotor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dawenkmotor`;

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE `applicants` (
  `id` int(31) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(127) NOT NULL,
  `phone` int(15) unsigned NOT NULL,
  `domicile` text NOT NULL,
  `home_status` char(15) NOT NULL,
  `work` varchar(63) NOT NULL,
  `work_experience` varchar(63) NOT NULL,
  `income` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `sub_from` int(7) DEFAULT NULL,
  `type` char(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `sub_from` (`sub_from`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

INSERT INTO `brands` (`id`, `name`, `sub_from`, `type`, `created_at`, `updated_at`) VALUES
(1,	'Honda',	NULL,	'motor',	'2018-06-12 19:50:01',	'2018-06-13 19:33:19'),
(2,	'Yamaha',	NULL,	'motor',	'2018-06-12 19:50:12',	'2018-06-12 19:50:12'),
(3,	'Suzuki',	NULL,	'motor',	'2018-06-12 19:50:21',	'2018-06-12 19:50:21'),
(4,	'Kawasaki',	NULL,	'motor',	'2018-06-12 19:50:36',	'2018-06-12 19:50:36'),
(6,	'Vespa',	NULL,	'motor',	'2018-06-15 13:55:58',	'0000-00-00 00:00:00'),
(7,	'Bajaj Pulsar',	NULL,	'motor',	'2018-06-15 13:56:16',	'0000-00-00 00:00:00'),
(8,	'Minerva',	NULL,	'motor',	'2018-06-15 13:56:27',	'0000-00-00 00:00:00'),
(9,	'Aprilia',	0,	'motor',	'2018-06-15 13:56:36',	'2018-06-21 07:41:55'),
(10,	'KTM',	NULL,	'motor',	'2018-06-15 13:56:43',	'0000-00-00 00:00:00'),
(11,	'Ducati',	NULL,	'motor',	'2018-06-15 13:56:51',	'0000-00-00 00:00:00'),
(12,	'BMW',	NULL,	'mobil',	'2018-06-15 13:57:02',	'2018-06-15 16:26:59'),
(13,	'Toyota',	NULL,	'mobil',	'2018-06-15 13:57:16',	'0000-00-00 00:00:00'),
(14,	'Daihatsu',	NULL,	'mobil',	'2018-06-15 13:57:24',	'0000-00-00 00:00:00'),
(15,	'Hyundai',	NULL,	'mobil',	'2018-06-15 13:57:45',	'0000-00-00 00:00:00'),
(16,	'Vario',	1,	'motor',	'2018-06-21 11:46:35',	'2018-06-21 11:46:35'),
(17,	'BeAT FI',	1,	'motor',	'2018-06-21 07:50:27',	'0000-00-00 00:00:00'),
(18,	'Satria FU',	5,	'motor',	'2018-06-21 07:51:58',	'0000-00-00 00:00:00');

DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(225) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `configs` (`id`, `key`, `value`) VALUES
(1,	'SITE_NAME',	'Dawenk Motor'),
(2,	'SITE_DESC',	'Dawenk Motor, Jual Beli Motor Baru Dan Bekas'),
(3,	'SITE_KEYWORDS',	'jual motor, beli motor, beli motor bekas'),
(4,	'CREDENTIAL',	'{\'username\':\'dawenkmotor\',\'babacoi\':\'dawenkmotor\',\'name\': \'Dawenk\'}');

DROP TABLE IF EXISTS `credits`;
CREATE TABLE `credits` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `lease_id` int(3) unsigned NOT NULL,
  `down_payment` decimal(7,2) NOT NULL,
  `tenor` int(3) NOT NULL,
  `percentage` decimal(7,2) NOT NULL,
  `tax` decimal(7,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lease_id` (`lease_id`),
  CONSTRAINT `credits_ibfk_2` FOREIGN KEY (`lease_id`) REFERENCES `leases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `credits` (`id`, `lease_id`, `down_payment`, `tenor`, `percentage`, `tax`, `created_at`, `updated_at`) VALUES
(1,	1,	10.00,	11,	20.00,	2.50,	'2018-06-13 20:00:11',	'2018-06-13 20:00:11'),
(2,	1,	11.60,	11,	20.00,	2.50,	'2018-06-15 16:10:55',	'0000-00-00 00:00:00'),
(3,	1,	12.90,	11,	20.00,	2.50,	'2018-06-15 16:11:21',	'0000-00-00 00:00:00'),
(4,	1,	14.30,	11,	20.00,	2.50,	'2018-06-15 16:12:24',	'0000-00-00 00:00:00'),
(5,	1,	15.60,	11,	20.00,	2.50,	'2018-06-15 16:12:46',	'0000-00-00 00:00:00'),
(6,	1,	17.00,	11,	20.00,	2.50,	'2018-06-15 16:13:40',	'0000-00-00 00:00:00'),
(7,	1,	18.40,	11,	20.00,	2.50,	'2018-06-15 16:14:04',	'0000-00-00 00:00:00'),
(8,	1,	19.70,	11,	20.00,	2.50,	'2018-06-15 16:14:30',	'0000-00-00 00:00:00'),
(9,	1,	21.10,	11,	20.00,	2.50,	'2018-06-15 16:14:53',	'0000-00-00 00:00:00'),
(10,	1,	22.40,	11,	20.00,	2.50,	'2018-06-15 16:15:15',	'0000-00-00 00:00:00'),
(11,	1,	23.80,	11,	20.00,	2.50,	'2018-06-15 16:15:36',	'0000-00-00 00:00:00'),
(12,	1,	25.20,	11,	20.00,	2.50,	'2018-06-15 16:16:03',	'0000-00-00 00:00:00');

DROP TABLE IF EXISTS `leases`;
CREATE TABLE `leases` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `leases` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'PT. Mandiri Utama Finance (MUF)',	'',	'2018-06-13 19:56:15',	'2018-06-21 07:40:36'),
(2,	'Mandiri Tunas Finance (MTF)',	'',	'2018-06-14 00:39:17',	'2018-06-21 07:40:28'),
(3,	'Bussan Auto Finance (BAF)',	NULL,	'2018-06-14 00:40:13',	'2018-06-14 00:40:13');

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(127) NOT NULL,
  `content` text NOT NULL,
  `tags` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(31) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(7) unsigned NOT NULL,
  `description` text NOT NULL,
  `condition` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,2) unsigned NOT NULL,
  `negotiable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sold` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `photos` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `products` (`id`, `brand_id`, `description`, `condition`, `price`, `negotiable`, `sold`, `photos`, `created_at`, `updated_at`) VALUES
(1,	17,	'',	0,	7600000.00,	1,	0,	'',	'2018-06-14 19:10:26',	'2018-06-14 19:10:26');

DROP TABLE IF EXISTS `product_credits`;
CREATE TABLE `product_credits` (
  `product_id` int(31) unsigned NOT NULL,
  `credit_id` int(15) unsigned NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `credit_id` (`credit_id`),
  CONSTRAINT `product_credits_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_credits_ibfk_2` FOREIGN KEY (`credit_id`) REFERENCES `credits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `submissions`;
CREATE TABLE `submissions` (
  `applicant_id` int(31) unsigned NOT NULL,
  `product_id` int(31) unsigned NOT NULL,
  `survey_schedule` varchar(127) NOT NULL,
  `reference` varchar(63) NOT NULL,
  `notes` text NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  KEY `applicant_id` (`applicant_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submissions_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2018-06-21 09:12:48
-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `username`, `password`, `fname`, `photo`, `created_on`) VALUES
(1,	'admin',	'$2y$10$nBOk9yJGLKv1BBhWvdzvtefzI.wVbty40eBOjRwV.xLtoAQok.ttG',	'Admin',	'profile.jpg',	'2021-02-24');

DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `max_vote` int NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `polls` (`id`, `description`, `max_vote`, `priority`) VALUES
(1,	'poll 1',	1,	1);

DROP TABLE IF EXISTS `voters`;
CREATE TABLE `voters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voters_id` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `voters` (`id`, `voters_id`, `password`, `fname`, `photo`) VALUES
(1,	'l2UdhGuEJFOkfrw',	'$2y$10$er/4Fc0WYz2uRtSWIxcEn.ZQRyI8tJhnYLCOKr5vfGT8UvHW1t/4G',	'voter 1',	'');


DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poll_id` int NOT NULL,
  `fname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(150) NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `options` (`id`, `poll_id`, `fname`, `photo`, `description`) VALUES
(1,	1,	'op1',	'',	'teste');

DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voters_id` int NOT NULL,
  `options_id` int NOT NULL,
  `poll_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voters_id` (`voters_id`),
  KEY `options_id` (`options_id`),
  KEY `poll_id` (`poll_id`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`voters_id`) REFERENCES `voters` (`id`),
  CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`options_id`) REFERENCES `options` (`id`),
  CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- 2021-03-10 14:51:42

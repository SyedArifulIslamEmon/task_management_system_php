SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `categories` (
  `catId` int(9) NOT NULL AUTO_INCREMENT,
  `userId` int(5) NOT NULL DEFAULT '0',
  `catName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `catDesc` longtext CHARACTER SET utf8,
  `catDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isActive` int(1) NOT NULL DEFAULT '0',
  `lastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`catId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `events` (
  `eventId` int(5) NOT NULL AUTO_INCREMENT,
  `userId` int(5) NOT NULL DEFAULT '0',
  `startDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `eventTitle` varchar(50) CHARACTER SET utf8 NOT NULL,
  `eventDesc` longtext CHARACTER SET utf8,
  `eventColor` varchar(7) CHARACTER SET utf8 NOT NULL DEFAULT '#87b633',
  `isTask` int(1) NOT NULL DEFAULT '0',
  `lastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`eventId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `sitesettings` (
  `installUrl` varchar(100) COLLATE utf8_bin NOT NULL,
  `localization` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'en',
  `siteName` varchar(255) COLLATE utf8_bin NOT NULL,
  `siteEmail` varchar(255) COLLATE utf8_bin NOT NULL,
  `allowRegistrations` int(1) NOT NULL DEFAULT '1',
  `enableWeather` int(1) NOT NULL DEFAULT '1',
  `enableCalendar` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`installUrl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `tasknotes` (
  `noteId` int(5) NOT NULL AUTO_INCREMENT,
  `taskId` int(5) NOT NULL DEFAULT '0',
  `catId` int(5) NOT NULL DEFAULT '0',
  `userId` int(5) NOT NULL,
  `taskNote` longtext CHARACTER SET utf8,
  `noteDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`noteId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tasks` (
  `taskId` int(5) NOT NULL AUTO_INCREMENT,
  `catId` int(5) NOT NULL DEFAULT '0',
  `userId` int(5) NOT NULL,
  `taskTitle` varchar(255) CHARACTER SET utf8 NOT NULL,
  `taskDesc` longtext CHARACTER SET utf8,
  `taskPriority` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Normal',
  `taskStatus` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'New',
  `taskPercent` int(3) NOT NULL DEFAULT '0',
  `taskStart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taskDue` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isClosed` int(1) NOT NULL DEFAULT '0',
  `dateClosed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`taskId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(9) NOT NULL AUTO_INCREMENT,
  `isAdmin` int(1) NOT NULL DEFAULT '0',
  `userEmail` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `userFirst` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userLast` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `joinDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `weatherLoc` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Washington, DC',
  `recEmails` int(1) NOT NULL DEFAULT '0',
  `userNotes` text COLLATE utf8_bin,
  `isActive` int(1) NOT NULL DEFAULT '0',
  `hash` varchar(32) COLLATE utf8_bin NOT NULL,
  `lastVisited` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;
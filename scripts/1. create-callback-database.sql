
CREATE DATABASE IF NOT EXISTS `callback-db`

USE `callback-db`;

DROP TABLE IF EXISTS `callback`;

CREATE TABLE `callback` (
  `CallBackID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `DID` varchar(20) NOT NULL,
  `CID` varchar(20) NOT NULL,
  `Number` varchar(20) NOT NULL,
  `Confirmed` int(1) DEFAULT '0',
  `Language` text NOT NULL,
  `Prefix` text NOT NULL,
  `isExtracted` int(1) DEFAULT '0',
  PRIMARY KEY (`CallBackID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18018 DEFAULT CHARSET=latin1;
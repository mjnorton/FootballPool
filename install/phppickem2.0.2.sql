/*
 Navicat MySQL Data Transfer

 Source Server         : _localhost
 Source Server Type    : MySQL
 Source Server Version : 50534
 Source Host           : localhost
 Source Database       : nflpickem

 Target Server Type    : MySQL
 Target Server Version : 50534
 File Encoding         : utf-8

 Date: 08/05/2015 23:35:16 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `nflp_comments`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_comments`;
CREATE TABLE `nflp_comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `postDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `nflp_divisions`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_divisions`;
CREATE TABLE `nflp_divisions` (
  `divisionID` int(11) NOT NULL AUTO_INCREMENT,
  `conference` varchar(10) NOT NULL,
  `division` varchar(32) NOT NULL,
  PRIMARY KEY (`divisionID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `nflp_divisions`
-- ----------------------------
BEGIN;
INSERT INTO `nflp_divisions` VALUES ('1', 'AFC', 'North'), ('2', 'AFC', 'South'), ('3', 'AFC', 'East'), ('4', 'AFC', 'West'), ('5', 'NFC', 'North'), ('6', 'NFC', 'South'), ('7', 'NFC', 'East'), ('8', 'NFC', 'West');
COMMIT;

-- ----------------------------
--  Table structure for `nflp_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_email_templates`;
CREATE TABLE `nflp_email_templates` (
  `email_template_key` varchar(255) NOT NULL,
  `email_template_title` varchar(255) NOT NULL,
  `default_subject` varchar(255) DEFAULT NULL,
  `default_message` text,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`email_template_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `nflp_email_templates`
-- ----------------------------
BEGIN;
INSERT INTO `nflp_email_templates` VALUES ('WEEKLY_PICKS_REMINDER', 'Weekly Picks Reminder', 'NFL Pick \'Em Week {week} Reminder', 'Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}.&nbsp; This is your reminder.&nbsp; The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />', 'NFL Pick \'Em Week {week} Reminder', 'Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}.&nbsp; This is your reminder.&nbsp; The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />'), ('WEEKLY_RESULTS_REMINDER', 'Last Week Results/Reminder', 'NFL Pick \'Em Week {previousWeek} Standings/Reminder', 'Congratulations this week go to {winners} for winning week {previousWeek}.  The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />*Reminder* - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />', 'NFL Pick \'Em Week {previousWeek} Standings/Reminder', 'Congratulations this week go to {winners} for winning week {previousWeek}.  The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />*Reminder* - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />'), ('FINAL_RESULTS', 'Final Results', 'NFL Pick \'Em 2015 Final Results', 'Congratulations this week go to {winners} for winning week\r\n{previousWeek}. The winner(s) had {winningScore} out of {possibleScore}\r\npicks correct.<br /><br /><span style=\"font-weight: bold;\">Congratulations to {final_winner}</span> for winning NFL Pick \'Em 2015!&nbsp; {final_winner} had {final_winningScore} wins and had a pick ratio of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for NFL Pick \'Em 2012!', 'NFL Pick \'Em 2015 Final Results', 'Congratulations this week go to {winners} for winning week\r\n{previousWeek}. The winner(s) had {winningScore} out of {possibleScore}\r\npicks correct.<br /><br /><span style=\"font-weight: bold;\">Congratulations to {final_winner}</span> for winning NFL Pick \'Em 2015!&nbsp; {final_winner} had {final_winningScore} wins and had a pick ratio of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for NFL Pick \'Em 2012!');
COMMIT;

-- ----------------------------
--  Table structure for `nflp_picks`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_picks`;
CREATE TABLE `nflp_picks` (
  `userID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `pickID` varchar(10) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`,`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `nflp_picksummary`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_picksummary`;
CREATE TABLE `nflp_picksummary` (
  `weekNum` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `tieBreakerPoints` int(11) NOT NULL,
  `showPicks` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`weekNum`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
--  Table structure for `nflp_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_schedule`;
CREATE TABLE `nflp_schedule` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `weekNum` int(11) NOT NULL,
  `gameTimeEastern` datetime DEFAULT NULL,
  `homeID` varchar(10) NOT NULL,
  `homeScore` int(11) DEFAULT NULL,
  `visitorID` varchar(10) NOT NULL,
  `visitorScore` int(11) DEFAULT NULL,
  `overtime` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gameID`),
  KEY `GameID` (`gameID`),
  KEY `HomeID` (`homeID`),
  KEY `VisitorID` (`visitorID`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `nflp_schedule`
-- ----------------------------
BEGIN;
INSERT INTO `nflp_schedule` VALUES ('1', '1', '2015-09-10 20:30:00', 'NE', null, 'PIT', null, '0'), ('2', '1', '2015-09-13 13:00:00', 'CHI', null, 'GB', null, '0'), ('3', '1', '2015-09-13 13:00:00', 'HOU', null, 'KC', null, '0'), ('4', '1', '2015-09-13 13:00:00', 'NYJ', null, 'CLE', null, '0'), ('5', '1', '2015-09-13 13:00:00', 'BUF', null, 'IND', null, '0'), ('6', '1', '2015-09-13 13:00:00', 'WSH', null, 'MIA', null, '0'), ('7', '1', '2015-09-13 13:00:00', 'JAX', null, 'CAR', null, '0'), ('8', '1', '2015-09-13 13:00:00', 'STL', null, 'SEA', null, '0'), ('9', '1', '2015-09-13 16:05:00', 'ARI', null, 'NO', null, '0'), ('10', '1', '2015-09-13 16:05:00', 'SD', null, 'DET', null, '0'), ('11', '1', '2015-09-13 16:25:00', 'TB', null, 'TEN', null, '0'), ('12', '1', '2015-09-13 16:25:00', 'OAK', null, 'CIN', null, '0'), ('13', '1', '2015-09-13 16:25:00', 'DEN', null, 'BAL', null, '0'), ('14', '1', '2015-09-13 20:30:00', 'DAL', null, 'NYG', null, '0'), ('15', '1', '2015-09-14 19:10:00', 'ATL', null, 'PHI', null, '0'), ('16', '1', '2015-09-14 22:20:00', 'SF', null, 'MIN', null, '0'), ('17', '2', '2015-09-17 20:25:00', 'KC', null, 'DEN', null, '0'), ('18', '2', '2015-09-20 13:00:00', 'CAR', null, 'HOU', null, '0'), ('19', '2', '2015-09-20 13:00:00', 'PIT', null, 'SF', null, '0'), ('20', '2', '2015-09-20 13:00:00', 'NO', null, 'TB', null, '0'), ('21', '2', '2015-09-20 13:00:00', 'MIN', null, 'DET', null, '0'), ('22', '2', '2015-09-20 13:00:00', 'CHI', null, 'ARI', null, '0'), ('23', '2', '2015-09-20 13:00:00', 'BUF', null, 'NE', null, '0'), ('24', '2', '2015-09-20 13:00:00', 'CIN', null, 'SD', null, '0'), ('25', '2', '2015-09-20 13:00:00', 'CLE', null, 'TEN', null, '0'), ('26', '2', '2015-09-20 13:00:00', 'NYG', null, 'ATL', null, '0'), ('27', '2', '2015-09-20 13:00:00', 'WSH', null, 'STL', null, '0'), ('28', '2', '2015-09-20 16:05:00', 'JAX', null, 'MIA', null, '0'), ('29', '2', '2015-09-20 16:05:00', 'OAK', null, 'BAL', null, '0'), ('30', '2', '2015-09-20 16:25:00', 'PHI', null, 'DAL', null, '0'), ('31', '2', '2015-09-20 20:30:00', 'GB', null, 'SEA', null, '0'), ('32', '2', '2015-09-21 20:30:00', 'IND', null, 'NYJ', null, '0'), ('33', '3', '2015-09-24 20:25:00', 'NYG', null, 'WSH', null, '0'), ('34', '3', '2015-09-27 13:00:00', 'DAL', null, 'ATL', null, '0'), ('35', '3', '2015-09-27 13:00:00', 'TEN', null, 'IND', null, '0'), ('36', '3', '2015-09-27 13:00:00', 'CLE', null, 'OAK', null, '0'), ('37', '3', '2015-09-27 13:00:00', 'BAL', null, 'CIN', null, '0'), ('38', '3', '2015-09-27 13:00:00', 'NE', null, 'JAX', null, '0'), ('39', '3', '2015-09-27 13:00:00', 'CAR', null, 'NO', null, '0'), ('40', '3', '2015-09-27 13:00:00', 'NYJ', null, 'PHI', null, '0'), ('41', '3', '2015-09-27 13:00:00', 'HOU', null, 'TB', null, '0'), ('42', '3', '2015-09-27 13:00:00', 'MIN', null, 'SD', null, '0'), ('43', '3', '2015-09-27 13:00:00', 'STL', null, 'PIT', null, '0'), ('44', '3', '2015-09-27 16:05:00', 'ARI', null, 'SF', null, '0'), ('45', '3', '2015-09-27 16:25:00', 'MIA', null, 'BUF', null, '0'), ('46', '3', '2015-09-27 16:25:00', 'SEA', null, 'CHI', null, '0'), ('47', '3', '2015-09-27 20:30:00', 'DET', null, 'DEN', null, '0'), ('48', '3', '2015-09-28 20:30:00', 'GB', null, 'KC', null, '0'), ('49', '4', '2015-10-01 20:25:00', 'PIT', null, 'BAL', null, '0'), ('50', '4', '2015-10-04 09:30:00', 'MIA', null, 'NYJ', null, '0'), ('51', '4', '2015-10-04 13:00:00', 'IND', null, 'JAX', null, '0'), ('52', '4', '2015-10-04 13:00:00', 'BUF', null, 'NYG', null, '0'), ('53', '4', '2015-10-04 13:00:00', 'TB', null, 'CAR', null, '0'), ('54', '4', '2015-10-04 13:00:00', 'WSH', null, 'PHI', null, '0'), ('55', '4', '2015-10-04 13:00:00', 'CHI', null, 'OAK', null, '0'), ('56', '4', '2015-10-04 13:00:00', 'ATL', null, 'HOU', null, '0'), ('57', '4', '2015-10-04 13:00:00', 'CIN', null, 'KC', null, '0'), ('58', '4', '2015-10-04 16:05:00', 'SD', null, 'CLE', null, '0'), ('59', '4', '2015-10-04 16:25:00', 'SF', null, 'GB', null, '0'), ('60', '4', '2015-10-04 16:25:00', 'ARI', null, 'STL', null, '0'), ('61', '4', '2015-10-04 16:25:00', 'DEN', null, 'MIN', null, '0'), ('62', '4', '2015-10-04 20:30:00', 'NO', null, 'DAL', null, '0'), ('63', '4', '2015-10-05 20:30:00', 'SEA', null, 'DET', null, '0'), ('64', '5', '2015-10-08 20:25:00', 'HOU', null, 'IND', null, '0'), ('65', '5', '2015-10-11 13:00:00', 'KC', null, 'CHI', null, '0'), ('66', '5', '2015-10-11 13:00:00', 'CIN', null, 'SEA', null, '0'), ('67', '5', '2015-10-11 13:00:00', 'ATL', null, 'WSH', null, '0'), ('68', '5', '2015-10-11 13:00:00', 'TB', null, 'JAX', null, '0'), ('69', '5', '2015-10-11 13:00:00', 'PHI', null, 'NO', null, '0'), ('70', '5', '2015-10-11 13:00:00', 'BAL', null, 'CLE', null, '0'), ('71', '5', '2015-10-11 13:00:00', 'GB', null, 'STL', null, '0'), ('72', '5', '2015-10-11 13:00:00', 'TEN', null, 'BUF', null, '0'), ('73', '5', '2015-10-11 16:05:00', 'DET', null, 'ARI', null, '0'), ('74', '5', '2015-10-11 16:25:00', 'DAL', null, 'NE', null, '0'), ('75', '5', '2015-10-11 16:25:00', 'OAK', null, 'DEN', null, '0'), ('76', '5', '2015-10-11 20:30:00', 'NYG', null, 'SF', null, '0'), ('77', '5', '2015-10-12 20:30:00', 'SD', null, 'PIT', null, '0'), ('78', '6', '2015-10-15 20:25:00', 'NO', null, 'ATL', null, '0'), ('79', '6', '2015-10-18 13:00:00', 'NYJ', null, 'WSH', null, '0'), ('80', '6', '2015-10-18 13:00:00', 'PIT', null, 'ARI', null, '0'), ('81', '6', '2015-10-18 13:00:00', 'MIN', null, 'KC', null, '0'), ('82', '6', '2015-10-18 13:00:00', 'BUF', null, 'CIN', null, '0'), ('83', '6', '2015-10-18 13:00:00', 'DET', null, 'CHI', null, '0'), ('84', '6', '2015-10-18 13:00:00', 'CLE', null, 'DEN', null, '0'), ('85', '6', '2015-10-18 13:00:00', 'JAX', null, 'HOU', null, '0'), ('86', '6', '2015-10-18 13:00:00', 'TEN', null, 'MIA', null, '0'), ('87', '6', '2015-10-18 16:05:00', 'SEA', null, 'CAR', null, '0'), ('88', '6', '2015-10-18 16:25:00', 'GB', null, 'SD', null, '0'), ('89', '6', '2015-10-18 16:25:00', 'SF', null, 'BAL', null, '0'), ('90', '6', '2015-10-18 20:30:00', 'IND', null, 'NE', null, '0'), ('91', '6', '2015-10-19 20:30:00', 'PHI', null, 'NYG', null, '0'), ('92', '7', '2015-10-22 20:25:00', 'SF', null, 'SEA', null, '0'), ('93', '7', '2015-10-25 09:30:00', 'JAX', null, 'BUF', null, '0'), ('94', '7', '2015-10-25 13:00:00', 'WSH', null, 'TB', null, '0'), ('95', '7', '2015-10-25 13:00:00', 'TEN', null, 'ATL', null, '0'), ('96', '7', '2015-10-25 13:00:00', 'IND', null, 'NO', null, '0'), ('97', '7', '2015-10-25 13:00:00', 'DET', null, 'MIN', null, '0'), ('98', '7', '2015-10-25 13:00:00', 'KC', null, 'PIT', null, '0'), ('99', '7', '2015-10-25 13:00:00', 'STL', null, 'CLE', null, '0'), ('100', '7', '2015-10-25 13:00:00', 'MIA', null, 'HOU', null, '0'), ('101', '7', '2015-10-25 13:00:00', 'NE', null, 'NYJ', null, '0'), ('102', '7', '2015-10-25 16:05:00', 'SD', null, 'OAK', null, '0'), ('103', '7', '2015-10-25 16:25:00', 'NYG', null, 'DAL', null, '0'), ('104', '7', '2015-10-25 20:30:00', 'CAR', null, 'PHI', null, '0'), ('105', '7', '2015-10-26 20:30:00', 'ARI', null, 'BAL', null, '0'), ('106', '8', '2015-10-29 20:25:00', 'NE', null, 'MIA', null, '0'), ('107', '8', '2015-11-01 09:30:00', 'KC', null, 'DET', null, '0'), ('108', '8', '2015-11-01 13:00:00', 'ATL', null, 'TB', null, '0'), ('109', '8', '2015-11-01 13:00:00', 'CLE', null, 'ARI', null, '0'), ('110', '8', '2015-11-01 13:00:00', 'STL', null, 'SF', null, '0'), ('111', '8', '2015-11-01 13:00:00', 'NO', null, 'NYG', null, '0'), ('112', '8', '2015-11-01 13:00:00', 'CHI', null, 'MIN', null, '0'), ('113', '8', '2015-11-01 13:00:00', 'BAL', null, 'SD', null, '0'), ('114', '8', '2015-11-01 13:00:00', 'PIT', null, 'CIN', null, '0'), ('115', '8', '2015-11-01 13:00:00', 'HOU', null, 'TEN', null, '0'), ('116', '8', '2015-11-01 16:05:00', 'OAK', null, 'NYJ', null, '0'), ('117', '8', '2015-11-01 16:25:00', 'DAL', null, 'SEA', null, '0'), ('118', '8', '2015-11-01 20:30:00', 'DEN', null, 'GB', null, '0'), ('119', '8', '2015-11-02 20:30:00', 'CAR', null, 'IND', null, '0'), ('120', '9', '2015-11-05 20:25:00', 'CIN', null, 'CLE', null, '0'), ('121', '9', '2015-11-08 13:00:00', 'CAR', null, 'GB', null, '0'), ('122', '9', '2015-11-08 13:00:00', 'NE', null, 'WSH', null, '0'), ('123', '9', '2015-11-08 13:00:00', 'NO', null, 'TEN', null, '0'), ('124', '9', '2015-11-08 13:00:00', 'BUF', null, 'MIA', null, '0'), ('125', '9', '2015-11-08 13:00:00', 'MIN', null, 'STL', null, '0'), ('126', '9', '2015-11-08 13:00:00', 'NYJ', null, 'JAX', null, '0'), ('127', '9', '2015-11-08 13:00:00', 'PIT', null, 'OAK', null, '0'), ('128', '9', '2015-11-08 16:05:00', 'TB', null, 'NYG', null, '0'), ('129', '9', '2015-11-08 16:05:00', 'SF', null, 'ATL', null, '0'), ('130', '9', '2015-11-08 16:25:00', 'IND', null, 'DEN', null, '0'), ('131', '9', '2015-11-08 20:30:00', 'DAL', null, 'PHI', null, '0'), ('132', '9', '2015-11-09 20:30:00', 'SD', null, 'CHI', null, '0'), ('133', '10', '2015-11-12 20:25:00', 'NYJ', null, 'BUF', null, '0'), ('134', '10', '2015-11-15 13:00:00', 'GB', null, 'DET', null, '0'), ('135', '10', '2015-11-15 13:00:00', 'TB', null, 'DAL', null, '0'), ('136', '10', '2015-11-15 13:00:00', 'TEN', null, 'CAR', null, '0'), ('137', '10', '2015-11-15 13:00:00', 'STL', null, 'CHI', null, '0'), ('138', '10', '2015-11-15 13:00:00', 'WSH', null, 'NO', null, '0'), ('139', '10', '2015-11-15 13:00:00', 'PHI', null, 'MIA', null, '0'), ('140', '10', '2015-11-15 13:00:00', 'PIT', null, 'CLE', null, '0'), ('141', '10', '2015-11-15 13:00:00', 'BAL', null, 'JAX', null, '0'), ('142', '10', '2015-11-15 16:05:00', 'OAK', null, 'MIN', null, '0'), ('143', '10', '2015-11-15 16:25:00', 'NYG', null, 'NE', null, '0'), ('144', '10', '2015-11-15 16:25:00', 'DEN', null, 'KC', null, '0'), ('145', '10', '2015-11-15 20:30:00', 'SEA', null, 'ARI', null, '0'), ('146', '10', '2015-11-16 20:30:00', 'CIN', null, 'HOU', null, '0'), ('147', '11', '2015-11-19 20:25:00', 'JAX', null, 'TEN', null, '0'), ('148', '11', '2015-11-22 13:00:00', 'DET', null, 'OAK', null, '0'), ('149', '11', '2015-11-22 13:00:00', 'ATL', null, 'IND', null, '0'), ('150', '11', '2015-11-22 13:00:00', 'HOU', null, 'NYJ', null, '0'), ('151', '11', '2015-11-22 13:00:00', 'PHI', null, 'TB', null, '0'), ('152', '11', '2015-11-22 13:00:00', 'CHI', null, 'DEN', null, '0'), ('153', '11', '2015-11-22 13:00:00', 'MIN', null, 'GB', null, '0'), ('154', '11', '2015-11-22 13:00:00', 'BAL', null, 'STL', null, '0'), ('155', '11', '2015-11-22 13:00:00', 'MIA', null, 'DAL', null, '0'), ('156', '11', '2015-11-22 13:00:00', 'CAR', null, 'WSH', null, '0'), ('157', '11', '2015-11-22 16:05:00', 'ARI', null, 'CIN', null, '0'), ('158', '11', '2015-11-22 16:25:00', 'SEA', null, 'SF', null, '0'), ('159', '11', '2015-11-22 20:30:00', 'SD', null, 'KC', null, '0'), ('160', '11', '2015-11-23 20:30:00', 'NE', null, 'BUF', null, '0'), ('161', '12', '2015-11-26 12:30:00', 'DET', null, 'PHI', null, '0'), ('162', '12', '2015-11-26 16:30:00', 'DAL', null, 'CAR', null, '0'), ('163', '12', '2015-11-26 20:30:00', 'GB', null, 'CHI', null, '0'), ('164', '12', '2015-11-29 13:00:00', 'TEN', null, 'OAK', null, '0'), ('165', '12', '2015-11-29 13:00:00', 'KC', null, 'BUF', null, '0'), ('166', '12', '2015-11-29 13:00:00', 'IND', null, 'TB', null, '0'), ('167', '12', '2015-11-29 13:00:00', 'WSH', null, 'NYG', null, '0'), ('168', '12', '2015-11-29 13:00:00', 'HOU', null, 'NO', null, '0'), ('169', '12', '2015-11-29 13:00:00', 'ATL', null, 'MIN', null, '0'), ('170', '12', '2015-11-29 13:00:00', 'CIN', null, 'STL', null, '0'), ('171', '12', '2015-11-29 13:00:00', 'JAX', null, 'SD', null, '0'), ('172', '12', '2015-11-29 13:00:00', 'NYJ', null, 'MIA', null, '0'), ('173', '12', '2015-11-29 16:05:00', 'SF', null, 'ARI', null, '0'), ('174', '12', '2015-11-29 16:25:00', 'SEA', null, 'PIT', null, '0'), ('175', '12', '2015-11-29 20:30:00', 'DEN', null, 'NE', null, '0'), ('176', '12', '2015-11-30 20:30:00', 'CLE', null, 'BAL', null, '0'), ('177', '13', '2015-12-03 20:25:00', 'DET', null, 'GB', null, '0'), ('178', '13', '2015-12-06 13:00:00', 'NYG', null, 'NYJ', null, '0'), ('179', '13', '2015-12-06 13:00:00', 'STL', null, 'ARI', null, '0'), ('180', '13', '2015-12-06 13:00:00', 'TB', null, 'ATL', null, '0'), ('181', '13', '2015-12-06 13:00:00', 'NO', null, 'CAR', null, '0'), ('182', '13', '2015-12-06 13:00:00', 'MIN', null, 'SEA', null, '0'), ('183', '13', '2015-12-06 13:00:00', 'BUF', null, 'HOU', null, '0'), ('184', '13', '2015-12-06 13:00:00', 'MIA', null, 'BAL', null, '0'), ('185', '13', '2015-12-06 13:00:00', 'CLE', null, 'CIN', null, '0'), ('186', '13', '2015-12-06 13:00:00', 'TEN', null, 'JAX', null, '0'), ('187', '13', '2015-12-06 13:00:00', 'CHI', null, 'SF', null, '0'), ('188', '13', '2015-12-06 16:05:00', 'SD', null, 'DEN', null, '0'), ('189', '13', '2015-12-06 16:05:00', 'OAK', null, 'KC', null, '0'), ('190', '13', '2015-12-06 16:25:00', 'NE', null, 'PHI', null, '0'), ('191', '13', '2015-12-06 20:30:00', 'PIT', null, 'IND', null, '0'), ('192', '13', '2015-12-07 20:30:00', 'WSH', null, 'DAL', null, '0'), ('193', '14', '2015-12-10 20:25:00', 'ARI', null, 'MIN', null, '0'), ('194', '14', '2015-12-13 13:00:00', 'PHI', null, 'BUF', null, '0'), ('195', '14', '2015-12-13 13:00:00', 'CLE', null, 'SF', null, '0'), ('196', '14', '2015-12-13 13:00:00', 'STL', null, 'DET', null, '0'), ('197', '14', '2015-12-13 13:00:00', 'TB', null, 'NO', null, '0'), ('198', '14', '2015-12-13 13:00:00', 'NYJ', null, 'TEN', null, '0'), ('199', '14', '2015-12-13 13:00:00', 'CIN', null, 'PIT', null, '0'), ('200', '14', '2015-12-13 13:00:00', 'HOU', null, 'NE', null, '0'), ('201', '14', '2015-12-13 13:00:00', 'JAX', null, 'IND', null, '0'), ('202', '14', '2015-12-13 13:00:00', 'KC', null, 'SD', null, '0'), ('203', '14', '2015-12-13 13:00:00', 'CHI', null, 'WSH', null, '0'), ('204', '14', '2015-12-13 13:00:00', 'CAR', null, 'ATL', null, '0'), ('205', '14', '2015-12-13 16:05:00', 'DEN', null, 'OAK', null, '0'), ('206', '14', '2015-12-13 16:25:00', 'GB', null, 'DAL', null, '0'), ('207', '14', '2015-12-13 20:30:00', 'BAL', null, 'SEA', null, '0'), ('208', '14', '2015-12-14 20:30:00', 'MIA', null, 'NYG', null, '0'), ('209', '15', '2015-12-17 20:25:00', 'STL', null, 'TB', null, '0'), ('210', '15', '2015-12-19 20:25:00', 'DAL', null, 'NYJ', null, '0'), ('211', '15', '2015-12-20 13:00:00', 'MIN', null, 'CHI', null, '0'), ('212', '15', '2015-12-20 13:00:00', 'JAX', null, 'ATL', null, '0'), ('213', '15', '2015-12-20 13:00:00', 'IND', null, 'HOU', null, '0'), ('214', '15', '2015-12-20 13:00:00', 'PHI', null, 'ARI', null, '0'), ('215', '15', '2015-12-20 13:00:00', 'NYG', null, 'CAR', null, '0'), ('216', '15', '2015-12-20 13:00:00', 'NE', null, 'TEN', null, '0'), ('217', '15', '2015-12-20 13:00:00', 'WSH', null, 'BUF', null, '0'), ('218', '15', '2015-12-20 13:00:00', 'BAL', null, 'KC', null, '0'), ('219', '15', '2015-12-20 16:05:00', 'SEA', null, 'CLE', null, '0'), ('220', '15', '2015-12-20 16:05:00', 'OAK', null, 'GB', null, '0'), ('221', '15', '2015-12-20 16:25:00', 'PIT', null, 'DEN', null, '0'), ('222', '15', '2015-12-20 16:25:00', 'SD', null, 'MIA', null, '0'), ('223', '15', '2015-12-20 20:30:00', 'SF', null, 'CIN', null, '0'), ('224', '15', '2015-12-21 20:30:00', 'NO', null, 'DET', null, '0'), ('225', '16', '2015-12-24 20:25:00', 'OAK', null, 'SD', null, '0'), ('226', '16', '2015-12-26 20:25:00', 'PHI', null, 'WSH', null, '0'), ('227', '16', '2015-12-27 13:00:00', 'NYJ', null, 'NE', null, '0'), ('228', '16', '2015-12-27 13:00:00', 'TEN', null, 'HOU', null, '0'), ('229', '16', '2015-12-27 13:00:00', 'KC', null, 'CLE', null, '0'), ('230', '16', '2015-12-27 13:00:00', 'MIA', null, 'IND', null, '0'), ('231', '16', '2015-12-27 13:00:00', 'NO', null, 'JAX', null, '0'), ('232', '16', '2015-12-27 13:00:00', 'DET', null, 'SF', null, '0'), ('233', '16', '2015-12-27 13:00:00', 'BUF', null, 'DAL', null, '0'), ('234', '16', '2015-12-27 13:00:00', 'TB', null, 'CHI', null, '0'), ('235', '16', '2015-12-27 13:00:00', 'ATL', null, 'CAR', null, '0'), ('236', '16', '2015-12-27 13:00:00', 'MIN', null, 'NYG', null, '0'), ('237', '16', '2015-12-27 16:25:00', 'SEA', null, 'STL', null, '0'), ('238', '16', '2015-12-27 16:25:00', 'ARI', null, 'GB', null, '0'), ('239', '16', '2015-12-27 20:30:00', 'BAL', null, 'PIT', null, '0'), ('240', '16', '2015-12-28 20:30:00', 'DEN', null, 'CIN', null, '0'), ('241', '17', '2016-01-03 13:00:00', 'BUF', null, 'NYJ', null, '0'), ('242', '17', '2016-01-03 13:00:00', 'MIA', null, 'NE', null, '0'), ('243', '17', '2016-01-03 13:00:00', 'CAR', null, 'TB', null, '0'), ('244', '17', '2016-01-03 13:00:00', 'ATL', null, 'NO', null, '0'), ('245', '17', '2016-01-03 13:00:00', 'CIN', null, 'BAL', null, '0'), ('246', '17', '2016-01-03 13:00:00', 'CLE', null, 'PIT', null, '0'), ('247', '17', '2016-01-03 13:00:00', 'HOU', null, 'JAX', null, '0'), ('248', '17', '2016-01-03 13:00:00', 'IND', null, 'TEN', null, '0'), ('249', '17', '2016-01-03 13:00:00', 'KC', null, 'OAK', null, '0'), ('250', '17', '2016-01-03 13:00:00', 'DAL', null, 'WSH', null, '0'), ('251', '17', '2016-01-03 13:00:00', 'NYG', null, 'PHI', null, '0'), ('252', '17', '2016-01-03 13:00:00', 'CHI', null, 'DET', null, '0'), ('253', '17', '2016-01-03 13:00:00', 'GB', null, 'MIN', null, '0'), ('254', '17', '2016-01-03 16:25:00', 'DEN', null, 'SD', null, '0'), ('255', '17', '2016-01-03 16:25:00', 'ARI', null, 'SEA', null, '0'), ('256', '17', '2016-01-03 16:25:00', 'SF', null, 'STL', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `nflp_teams`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_teams`;
CREATE TABLE `nflp_teams` (
  `teamID` varchar(10) NOT NULL,
  `divisionID` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `team` varchar(50) DEFAULT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teamID`),
  KEY `ID` (`teamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `nflp_teams`
-- ----------------------------
BEGIN;
INSERT INTO `nflp_teams` VALUES ('ARI', '8', 'Arizona', 'Cardinals', null), ('ATL', '6', 'Atlanta', 'Falcons', null), ('BAL', '1', 'Baltimore', 'Ravens', null), ('BUF', '3', 'Buffalo', 'Bills', null), ('CAR', '6', 'Carolina', 'Panthers', null), ('CHI', '5', 'Chicago', 'Bears', null), ('CIN', '1', 'Cincinnati', 'Bengals', null), ('CLE', '1', 'Cleveland', 'Browns', null), ('DAL', '7', 'Dallas', 'Cowboys', null), ('DEN', '4', 'Denver', 'Broncos', null), ('DET', '5', 'Detroit', 'Lions', null), ('GB', '5', 'Green Bay', 'Packers', null), ('HOU', '2', 'Houston', 'Texans', null), ('IND', '2', 'Indianapolis', 'Colts', null), ('JAX', '2', 'Jacksonville', 'Jaguars', null), ('KC', '4', 'Kansas City', 'Chiefs', null), ('MIA', '3', 'Miami', 'Dolphins', null), ('MIN', '5', 'Minnesota', 'Vikings', null), ('NE', '3', 'New England', 'Patriots', null), ('NO', '6', 'New Orleans', 'Saints', null), ('NYG', '7', 'New York', 'Giants', 'NY Giants'), ('NYJ', '3', 'New York', 'Jets', 'NY Jets'), ('OAK', '4', 'Oakland', 'Raiders', null), ('PHI', '7', 'Philadelphia', 'Eagles', null), ('PIT', '1', 'Pittsburgh', 'Steelers', null), ('SD', '4', 'San Diego', 'Chargers', null), ('SEA', '8', 'Seattle', 'Seahawks', null), ('SF', '8', 'San Francisco', '49ers', null), ('STL', '8', 'St. Louis', 'Rams', null), ('TB', '6', 'Tampa Bay', 'Buccaneers', null), ('TEN', '2', 'Tennessee', 'Titans', null), ('WAS', '7', 'Washington', 'Redskins', null);
COMMIT;

-- ----------------------------
--  Table structure for `nflp_users`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_users`;
CREATE TABLE `nflp_users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `nflp_users`
-- ----------------------------
BEGIN;
INSERT INTO `nflp_users` VALUES ('1', 'admin', 'jl7LZ1B7ZNUq/RnVqnFmuwRXvMkO/DD5', 'Cb8Jjj0OPy', 'Admin', 'Admin', 'admin@yourdomain.com', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

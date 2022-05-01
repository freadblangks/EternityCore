/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.7.37-log : Database - eternity_auth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eternity_auth` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eternity_auth`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `battlenet_account` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `project_member_id` int(30) unsigned NOT NULL DEFAULT '0',
  `rank` int(5) DEFAULT NULL,
  `staff_id` int(5) DEFAULT NULL,
  `vp` int(5) DEFAULT NULL,
  `dp` int(10) NOT NULL DEFAULT '0',
  `isactive` varchar(50) DEFAULT NULL,
  `activation` varchar(256) DEFAULT NULL,
  `invited_by` varchar(32) NOT NULL DEFAULT '',
  `inv_friend_acc` varchar(32) NOT NULL DEFAULT '',
  `rewarded` int(4) NOT NULL DEFAULT '0',
  `flags` int(5) NOT NULL DEFAULT '0',
  `gmlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active_realm_id` int(11) unsigned NOT NULL DEFAULT '0',
  `online_mute_timer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `active_mute_id` int(11) unsigned NOT NULL DEFAULT '0',
  `project_verified` tinyint(1) NOT NULL DEFAULT '0',
  `cash` int(10) NOT NULL DEFAULT '0',
  `project_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `project_is_temp` tinyint(1) NOT NULL DEFAULT '0',
  `project_unban_count` tinyint(4) NOT NULL DEFAULT '0',
  `project_antierror` int(10) unsigned DEFAULT NULL,
  `project_attached` int(10) unsigned DEFAULT NULL,
  `project_passchange` int(10) unsigned NOT NULL DEFAULT '0',
  `project_vote_time` bigint(20) NOT NULL DEFAULT '0',
  `project_hwid` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_sha` (`sha_pass_hash`) USING BTREE,
  KEY `idx_session` (`sessionkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `account` */

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`RealmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `account_access` */

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `realm` int(11) NOT NULL,
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `account_banned` */

/*Table structure for table `account_boost` */

DROP TABLE IF EXISTS `account_boost`;

CREATE TABLE `account_boost` (
  `id` int(11) NOT NULL DEFAULT '0',
  `realmid` int(11) unsigned NOT NULL DEFAULT '1',
  `counter` int(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `account_boost` */

/*Table structure for table `account_muted` */

DROP TABLE IF EXISTS `account_muted`;

CREATE TABLE `account_muted` (
  `id` int(10) NOT NULL,
  `realmid` int(3) NOT NULL DEFAULT '0',
  `acc_id` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `mute_acc` varchar(32) COLLATE utf8_bin NOT NULL,
  `mute_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `mute_date` bigint(40) NOT NULL,
  `muted_by` varchar(50) COLLATE utf8_bin NOT NULL,
  `mute_time` bigint(20) NOT NULL,
  `mute_reason` varchar(255) COLLATE utf8_bin NOT NULL,
  `public_channels_only` tinyint(3) NOT NULL,
  PRIMARY KEY (`realmid`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `account_muted` */

/*Table structure for table `account_premium` */

DROP TABLE IF EXISTS `account_premium`;

CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Accounts';

/*Data for the table `account_premium` */

/*Table structure for table `account_premium_panda` */

DROP TABLE IF EXISTS `account_premium_panda`;

CREATE TABLE `account_premium_panda` (
  `id` int(11) NOT NULL DEFAULT '0',
  `pveMode` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `account_premium_panda` */

/*Table structure for table `arena_game_id` */

DROP TABLE IF EXISTS `arena_game_id`;

CREATE TABLE `arena_game_id` (
  `game_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realm_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `arena_game_id` */

/*Table structure for table `arena_games` */

DROP TABLE IF EXISTS `arena_games`;

CREATE TABLE `arena_games` (
  `gameid` bigint(20) NOT NULL DEFAULT '0',
  `teamid` bigint(20) NOT NULL DEFAULT '0',
  `guid` bigint(20) NOT NULL DEFAULT '0',
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `matchMakerRating` smallint(5) unsigned DEFAULT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `damageAbsorbed` int(11) unsigned NOT NULL,
  `timeControlled` int(11) unsigned NOT NULL,
  `aurasDispelled` int(11) unsigned NOT NULL,
  `aurasStolen` int(11) unsigned NOT NULL,
  `highLatencyTimes` int(11) unsigned NOT NULL,
  `spellsPrecast` int(11) unsigned NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `class` tinyint(3) unsigned DEFAULT NULL,
  `season` smallint(5) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `realmid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`gameid`,`teamid`,`guid`) USING BTREE,
  KEY `idx__teamid` (`teamid`) USING BTREE,
  KEY `idx__season__class__type` (`season`,`class`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='WoWArmory Game Chart';

/*Data for the table `arena_games` */

/*Table structure for table `arena_match_stat` */

DROP TABLE IF EXISTS `arena_match_stat`;

CREATE TABLE `arena_match_stat` (
  `realm` tinyint(3) unsigned NOT NULL,
  `teamGuid` int(10) unsigned NOT NULL,
  `teamName` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `teamRating` smallint(5) unsigned NOT NULL,
  `player` int(10) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `mapID` smallint(5) unsigned NOT NULL,
  `instanceID` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`teamGuid`,`realm`,`player`,`instanceID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `arena_match_stat` */

/*Table structure for table `arena_team` */

DROP TABLE IF EXISTS `arena_team`;

CREATE TABLE `arena_team` (
  `arenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `captainGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `realmNumber` int(10) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `matchMakerRating` smallint(5) unsigned NOT NULL DEFAULT '1500',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borderColor` int(10) unsigned NOT NULL DEFAULT '0',
  `season` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` int(10) unsigned NOT NULL DEFAULT '0',
  `realmid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`arenaTeamId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `arena_team` */

/*Table structure for table `arena_team_member` */

DROP TABLE IF EXISTS `arena_team_member`;

CREATE TABLE `arena_team_member` (
  `arenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `realmid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `personalRating` smallint(5) NOT NULL DEFAULT '0',
  `matchMakerRating` smallint(5) unsigned NOT NULL DEFAULT '1500',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(12) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `joined` int(10) unsigned NOT NULL DEFAULT '0',
  `removed` int(10) unsigned NOT NULL DEFAULT '0',
  `itemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lastILvlCheck` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`guid`,`realmid`) USING BTREE,
  KEY `guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `arena_team_member` */

/*Table structure for table `armory_game_chart` */

DROP TABLE IF EXISTS `armory_game_chart`;

CREATE TABLE `armory_game_chart` (
  `gameid` int(11) NOT NULL,
  `realmid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `class` tinyint(3) unsigned DEFAULT NULL,
  `season` smallint(5) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `armory_game_chart` */

/*Table structure for table `autobroadcast` */

DROP TABLE IF EXISTS `autobroadcast`;

CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `autobroadcast` */

insert  into `autobroadcast`(`realmid`,`id`,`weight`,`text`) values 
(1,1,1,'Welcome EternityCore !');

/*Table structure for table `battleground_games` */

DROP TABLE IF EXISTS `battleground_games`;

CREATE TABLE `battleground_games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season` int(10) unsigned NOT NULL,
  `realm_id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  `instance_id` int(10) unsigned NOT NULL,
  `is_random_bg` tinyint(3) unsigned NOT NULL,
  `winner` enum('H','A','N') NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `realm_id` (`realm_id`) USING BTREE,
  KEY `map_id` (`map_id`) USING BTREE,
  KEY `season` (`season`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battleground_games` */

/*Table structure for table `battleground_ladder_criteria` */

DROP TABLE IF EXISTS `battleground_ladder_criteria`;

CREATE TABLE `battleground_ladder_criteria` (
  `criteria` enum('Win','Loss','FastWin','Kills','ObjectiveCaptures','ObjectiveDefenses','DailyWins','DailyKills','SeasonKills','SeasonWinsAV','SeasonWinsWG','SeasonWinsAB','SeasonWinsEotS','SeasonWinsSotA','SeasonWinsIoC','TotalWins','TotalDraws','TotalLosses','TotalKills','TotalLeavesBeforeGame','TotalLeavesDuringGame') NOT NULL COMMENT 'Name of the column in `battleground_ladder_progress` if `type` is ''Daily'', ''Season'' or ''Statistic''',
  `type` enum('Statistic','Season','Daily','Alterac Valley','Warsong Gulch','Arathi Basin','Eye of the Storm','Strand of the Ancients','Isle of Conquest') NOT NULL COMMENT 'If not set - affects all battlegrounds, if set - overrides global setting only for the specified battleground. Only valid for battleground-specific `type`s',
  `param` int(11) NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `cap` int(10) unsigned NOT NULL COMMENT 'Maximum count of progress units a player can get',
  `ladder_points_per_progress` int(11) NOT NULL DEFAULT '0' COMMENT 'Repeatable ladder points reward for each unit of progress in this criteria',
  `ladder_points_for_cap` int(11) NOT NULL DEFAULT '0' COMMENT 'One-time ladder points reward for reaching progress cap in this criteria',
  `group_penalty_size` int(11) unsigned NOT NULL DEFAULT '3' COMMENT 'Count of group members at which ladder points penalty from `group_penalty_percent` kicks in',
  `group_penalty_percent` int(11) NOT NULL DEFAULT '0' COMMENT 'Percentage modifier of ladder points for each player in the group above or equal to `group_penalty_size`',
  PRIMARY KEY (`criteria`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battleground_ladder_criteria` */

/*Table structure for table `battleground_ladder_rewards` */

DROP TABLE IF EXISTS `battleground_ladder_rewards`;

CREATE TABLE `battleground_ladder_rewards` (
  `season` int(10) unsigned NOT NULL COMMENT 'Battleground season ID',
  `id` int(10) unsigned NOT NULL COMMENT 'Incrementing number identifying this reward set',
  `top` float unsigned NOT NULL COMMENT 'How many players will receive the reward. Depends on `type`',
  `type` enum('Players','Percents') NOT NULL DEFAULT 'Players' COMMENT 'Determines whether the `top` number or `top` percentage of players will receive the reward',
  `money_reward` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Amount in copper',
  `item_reward` tinytext NOT NULL COMMENT 'Format: itemid:count itemid:count ...',
  `loyalty_reward` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of Orbs of Loyalty',
  `premium_reward` tinytext NOT NULL COMMENT 'Duration in timestring format (e.g. "30d5h42m10s")',
  `title_reward` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Title ID',
  `mail_subject` tinytext NOT NULL,
  `mail_text` text NOT NULL,
  PRIMARY KEY (`season`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battleground_ladder_rewards` */

/*Table structure for table `battleground_scores` */

DROP TABLE IF EXISTS `battleground_scores`;

CREATE TABLE `battleground_scores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for each player that participated in the battleground',
  `game_id` int(10) unsigned NOT NULL,
  `team` tinyint(3) unsigned NOT NULL,
  `guid` int(10) unsigned NOT NULL,
  `realm_id` int(10) unsigned NOT NULL,
  `group_index` int(10) unsigned NOT NULL,
  `ladder_points` int(10) NOT NULL,
  `killing_blows` int(10) unsigned NOT NULL,
  `deaths` int(10) unsigned NOT NULL,
  `honorable_kills` int(10) unsigned NOT NULL,
  `damage_done` int(10) unsigned NOT NULL,
  `healing_done` int(10) unsigned NOT NULL,
  `damage_taken` int(10) unsigned NOT NULL,
  `healing_taken` int(10) unsigned NOT NULL,
  `bonus_honor` int(10) unsigned NOT NULL,
  `graveyards_assaulted` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `graveyards_defended` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `towers_assaulted` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `towers_defended` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `mines_captured` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `leaders_killed` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `secondary_objective` int(10) unsigned DEFAULT NULL COMMENT 'Alterac Valley',
  `flag_captures` int(10) unsigned DEFAULT NULL COMMENT 'Warsong Gulch, Eye of the Storm',
  `flag_returns` int(10) unsigned DEFAULT NULL COMMENT 'Warsong Gulch',
  `bases_assaulted` int(10) unsigned DEFAULT NULL COMMENT 'Arathi Basin, Isle of Conquest',
  `bases_defended` int(10) unsigned DEFAULT NULL COMMENT 'Arathi Basin, Isle of Conquest',
  `demolishers_destroyed` int(10) unsigned DEFAULT NULL COMMENT 'Strand of the Ancients',
  `gates_destroyed` int(10) unsigned DEFAULT NULL COMMENT 'Strand of the Ancients',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `game_id` (`game_id`) USING BTREE,
  KEY `guid` (`guid`) USING BTREE,
  KEY `realm_id` (`realm_id`) USING BTREE,
  CONSTRAINT `FK_battleground_scores_battleground_games` FOREIGN KEY (`game_id`) REFERENCES `battleground_games` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battleground_scores` */

/*Table structure for table `battleground_seasons` */

DROP TABLE IF EXISTS `battleground_seasons`;

CREATE TABLE `battleground_seasons` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `begin` int(10) unsigned NOT NULL,
  `end` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battleground_seasons` */

/*Table structure for table `battlenet_account_bans` */

DROP TABLE IF EXISTS `battlenet_account_bans`;

CREATE TABLE `battlenet_account_bans` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`bandate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `battlenet_account_bans` */

/*Table structure for table `battlenet_accounts` */

DROP TABLE IF EXISTS `battlenet_accounts`;

CREATE TABLE `battlenet_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(320) NOT NULL,
  `sha_pass_hash` varchar(64) NOT NULL DEFAULT '',
  `v` varchar(256) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `sessionKey` varchar(128) NOT NULL DEFAULT '',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `project_member_id` int(10) unsigned DEFAULT NULL,
  `project_is_temp` tinyint(1) DEFAULT '0' COMMENT 'nighthold',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `battlenet_accounts` */

/*Table structure for table `battlepay_log` */

DROP TABLE IF EXISTS `battlepay_log`;

CREATE TABLE `battlepay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountId` int(11) unsigned NOT NULL,
  `characterGuid` int(10) NOT NULL DEFAULT '0',
  `realm` int(5) unsigned NOT NULL,
  `item` int(10) NOT NULL DEFAULT '0',
  `price` int(5) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `battlepay_log` */

insert  into `battlepay_log`(`id`,`accountId`,`characterGuid`,`realm`,`item`,`price`,`date`) values 
(1,3,6,1,110009,100000,'2022-03-24 15:42:37'),
(2,3,6,1,110009,100000,'2022-03-24 15:42:58'),
(3,3,6,1,110019,202500,'2022-03-24 15:44:57'),
(4,3,6,1,110004,130000,'2022-03-24 16:22:35'),
(5,4,19,1,86574,10000,'2022-03-24 20:48:25'),
(6,4,19,1,110100,100000,'2022-03-24 20:48:51'),
(7,6,37,1,110014,2000000,'2022-03-24 20:49:08'),
(8,3,6,1,110014,2000000,'2022-03-24 22:37:22'),
(9,3,6,1,110007,20000,'2022-03-24 22:37:41'),
(10,3,37,1,32768,180000,'2022-03-24 22:39:46'),
(11,3,37,1,110015,950000,'2022-03-24 22:40:09'),
(12,3,37,1,110001,20000,'2022-03-24 22:41:08'),
(13,3,6,1,87038,70000,'2022-03-24 22:42:48'),
(14,3,6,1,86574,10000,'2022-03-24 22:46:31'),
(15,3,6,1,86574,10000,'2022-03-24 22:50:23'),
(16,3,0,1,17,2232500,'2022-03-24 23:45:14'),
(17,3,11,1,86574,10000,'2022-03-25 03:10:32'),
(18,3,38,1,86574,10000,'2022-03-25 03:11:43'),
(19,3,6,1,87029,70000,'2022-03-25 04:42:03'),
(20,3,38,1,32861,90000,'2022-03-25 16:48:22'),
(21,3,38,1,86574,10000,'2022-03-25 17:03:28'),
(22,3,38,1,60218,80000,'2022-03-25 17:17:38'),
(23,3,38,1,23162,120000,'2022-03-25 17:20:56'),
(24,3,38,1,82446,90000,'2022-03-25 17:21:18'),
(25,3,38,1,38050,200000,'2022-03-25 17:33:39'),
(26,3,38,1,49646,200000,'2022-03-25 17:35:08'),
(27,6,23,1,86574,10000,'2022-03-25 18:29:57'),
(28,6,0,1,17,2232500,'2022-03-25 19:27:27'),
(29,7,24,1,110009,100000,'2022-03-25 22:16:01'),
(30,13,42,1,86574,10000,'2022-03-25 22:59:56'),
(31,13,42,1,86574,10000,'2022-03-25 23:00:07'),
(32,13,42,1,110009,100000,'2022-03-25 23:00:27'),
(33,13,42,1,86574,10000,'2022-03-25 23:02:38'),
(34,13,42,1,86574,10000,'2022-03-25 23:02:42'),
(35,13,42,1,86574,10000,'2022-03-25 23:02:47'),
(36,3,33,1,65891,50000,'2022-03-26 00:01:51'),
(37,3,33,1,49284,200000,'2022-03-26 00:03:03'),
(38,7,0,1,17,2232500,'2022-03-26 00:05:35'),
(39,11,36,1,110009,100000,'2022-03-26 02:16:51'),
(40,11,36,1,86574,10000,'2022-03-26 02:16:57'),
(41,3,6,1,83086,300000,'2022-03-26 02:22:11'),
(42,13,42,1,23162,120000,'2022-03-26 03:01:55'),
(43,13,42,1,65891,50000,'2022-03-26 03:02:14'),
(44,13,42,1,95341,300000,'2022-03-26 03:02:23'),
(45,13,42,1,23162,120000,'2022-03-26 03:03:13'),
(46,13,42,1,110009,100000,'2022-03-26 03:04:25'),
(47,13,42,1,110009,100000,'2022-03-26 03:04:31'),
(48,13,42,1,86574,10000,'2022-03-26 03:04:36'),
(49,3,6,1,23162,120000,'2022-03-26 04:16:34'),
(50,3,6,1,23162,120000,'2022-03-26 04:16:38'),
(51,3,6,1,23162,120000,'2022-03-26 04:16:43'),
(52,3,6,1,23162,120000,'2022-03-26 04:16:47'),
(53,13,42,1,110012,900000,'2022-03-26 05:02:19'),
(54,11,36,1,86574,10000,'2022-03-26 16:13:11'),
(55,11,36,1,86574,10000,'2022-03-26 17:11:13'),
(56,11,36,1,86574,10000,'2022-03-26 17:17:42'),
(57,3,0,1,17,2232500,'2022-03-26 20:19:05'),
(58,3,54,1,86574,10000,'2022-03-26 21:38:33'),
(59,11,36,1,86574,10000,'2022-03-26 22:49:37'),
(60,4,19,1,65891,50000,'2022-03-27 00:38:23'),
(61,4,19,1,65891,50000,'2022-03-27 00:38:36'),
(62,4,19,1,44413,40000,'2022-03-27 00:38:45'),
(63,4,19,1,104011,300000,'2022-03-27 00:39:08'),
(64,13,42,1,110006,20000,'2022-03-27 03:18:30'),
(65,13,42,1,110006,20000,'2022-03-27 03:18:39'),
(66,13,42,1,110006,20000,'2022-03-27 03:18:45'),
(67,13,42,1,110006,20000,'2022-03-27 03:18:50'),
(68,13,42,1,110006,20000,'2022-03-27 03:18:54'),
(69,13,42,1,110006,20000,'2022-03-27 03:18:59'),
(70,13,42,1,110006,20000,'2022-03-27 03:19:41'),
(71,13,42,1,110006,20000,'2022-03-27 03:19:47'),
(72,13,42,1,110006,20000,'2022-03-27 03:19:55'),
(73,13,42,1,110006,20000,'2022-03-27 03:20:01'),
(74,13,42,1,110006,20000,'2022-03-27 03:20:07'),
(75,13,42,1,110006,20000,'2022-03-27 03:20:12'),
(76,13,42,1,110006,20000,'2022-03-27 03:20:20'),
(77,13,42,1,110006,20000,'2022-03-27 03:20:28'),
(78,13,42,1,110006,20000,'2022-03-27 03:20:38'),
(79,13,42,1,110006,20000,'2022-03-27 03:20:46'),
(80,13,42,1,110006,20000,'2022-03-27 03:21:23'),
(81,13,42,1,110006,20000,'2022-03-27 03:21:29'),
(82,13,42,1,110006,20000,'2022-03-27 03:21:35'),
(83,13,42,1,110006,20000,'2022-03-27 03:21:40'),
(84,13,42,1,110006,20000,'2022-03-27 03:21:45'),
(85,13,42,1,110006,20000,'2022-03-27 03:21:50'),
(86,13,42,1,110006,20000,'2022-03-27 03:21:56'),
(87,13,42,1,110006,20000,'2022-03-27 03:22:06'),
(88,13,42,1,110006,20000,'2022-03-27 03:22:13'),
(89,13,42,1,110006,20000,'2022-03-27 03:22:18'),
(90,13,42,1,110006,20000,'2022-03-27 03:22:44'),
(91,13,42,1,110006,20000,'2022-03-27 03:22:49'),
(92,13,42,1,110006,20000,'2022-03-27 03:22:53'),
(93,13,42,1,110006,20000,'2022-03-27 03:22:57'),
(94,13,42,1,110006,20000,'2022-03-27 03:23:09'),
(95,13,42,1,110006,20000,'2022-03-27 03:23:13'),
(96,13,42,1,110006,20000,'2022-03-27 03:23:21'),
(97,13,42,1,110006,20000,'2022-03-27 03:23:27'),
(98,13,42,1,110006,20000,'2022-03-27 03:23:31'),
(99,13,42,1,110006,20000,'2022-03-27 03:23:36'),
(100,13,42,1,110006,20000,'2022-03-27 03:23:41'),
(101,13,42,1,110006,20000,'2022-03-27 03:24:13'),
(102,13,42,1,110006,20000,'2022-03-27 03:24:18'),
(103,13,42,1,110006,20000,'2022-03-27 03:24:22'),
(104,13,42,1,110006,20000,'2022-03-27 03:24:27'),
(105,13,42,1,110006,20000,'2022-03-27 03:24:33'),
(106,13,42,1,110006,20000,'2022-03-27 03:25:31'),
(107,13,42,1,110006,20000,'2022-03-27 03:25:39'),
(108,13,42,1,110006,20000,'2022-03-27 03:25:43'),
(109,13,42,1,110006,20000,'2022-03-27 03:25:48'),
(110,13,42,1,110006,20000,'2022-03-27 03:25:54'),
(111,13,42,1,110006,20000,'2022-03-27 03:25:59'),
(112,13,42,1,110006,20000,'2022-03-27 03:26:03'),
(113,13,42,1,110006,20000,'2022-03-27 03:26:07'),
(114,13,42,1,110006,20000,'2022-03-27 03:26:11'),
(115,13,42,1,110006,20000,'2022-03-27 03:26:45'),
(116,13,42,1,110006,20000,'2022-03-27 03:26:54'),
(117,13,42,1,110006,20000,'2022-03-27 03:26:59'),
(118,13,42,1,110006,20000,'2022-03-27 03:27:22'),
(119,13,42,1,110006,20000,'2022-03-27 03:27:26'),
(120,13,42,1,110006,20000,'2022-03-27 03:27:31'),
(121,13,42,1,110006,20000,'2022-03-27 03:27:36'),
(122,13,42,1,110006,20000,'2022-03-27 03:27:41'),
(123,13,42,1,110006,20000,'2022-03-27 03:27:45'),
(124,13,42,1,110006,20000,'2022-03-27 03:27:50'),
(125,13,42,1,110006,20000,'2022-03-27 03:27:54'),
(126,13,42,1,110006,20000,'2022-03-27 03:27:58'),
(127,13,42,1,110006,20000,'2022-03-27 03:28:03'),
(128,13,42,1,110006,20000,'2022-03-27 03:28:07'),
(129,13,42,1,110006,20000,'2022-03-27 03:29:04'),
(130,13,42,1,110006,20000,'2022-03-27 03:29:15'),
(131,13,42,1,110006,20000,'2022-03-27 03:29:19'),
(132,13,42,1,110006,20000,'2022-03-27 03:29:24'),
(133,13,42,1,110006,20000,'2022-03-27 03:29:31'),
(134,13,42,1,110006,20000,'2022-03-27 03:29:36'),
(135,13,42,1,110006,20000,'2022-03-27 03:29:41'),
(136,13,42,1,110006,20000,'2022-03-27 03:29:47'),
(137,13,42,1,110006,20000,'2022-03-27 03:29:51'),
(138,13,42,1,110006,20000,'2022-03-27 03:29:55'),
(139,13,42,1,110006,20000,'2022-03-27 03:30:00'),
(140,13,42,1,110006,20000,'2022-03-27 03:30:37'),
(141,13,42,1,110006,20000,'2022-03-27 03:30:41'),
(142,13,42,1,110006,20000,'2022-03-27 03:30:46'),
(143,13,42,1,110006,20000,'2022-03-27 03:30:49'),
(144,13,42,1,110006,20000,'2022-03-27 03:30:53'),
(145,13,42,1,110006,20000,'2022-03-27 03:30:57'),
(146,13,42,1,110006,20000,'2022-03-27 03:31:01'),
(147,13,42,1,110006,20000,'2022-03-27 03:31:05'),
(148,13,42,1,110006,20000,'2022-03-27 03:31:10'),
(149,13,42,1,110006,20000,'2022-03-27 03:31:14'),
(150,13,42,1,110006,20000,'2022-03-27 03:31:18'),
(151,13,42,1,110006,20000,'2022-03-27 03:31:25'),
(152,13,42,1,110006,20000,'2022-03-27 03:31:29'),
(153,13,42,1,110006,20000,'2022-03-27 03:31:32'),
(154,13,42,1,110006,20000,'2022-03-27 03:31:36'),
(155,13,42,1,110006,20000,'2022-03-27 03:31:39'),
(156,13,42,1,110006,20000,'2022-03-27 03:31:42'),
(157,13,42,1,110006,20000,'2022-03-27 03:31:45'),
(158,13,42,1,110006,20000,'2022-03-27 03:31:49'),
(159,13,42,1,110006,20000,'2022-03-27 03:31:54'),
(160,13,42,1,110006,20000,'2022-03-27 03:31:57'),
(161,13,42,1,110006,20000,'2022-03-27 03:32:01'),
(162,13,42,1,110006,20000,'2022-03-27 03:32:08'),
(163,13,42,1,110006,20000,'2022-03-27 03:32:11'),
(164,13,42,1,110006,20000,'2022-03-27 03:33:14'),
(165,13,42,1,110006,20000,'2022-03-27 03:33:17'),
(166,13,42,1,110006,20000,'2022-03-27 03:33:46'),
(167,13,42,1,110006,20000,'2022-03-27 03:33:51'),
(168,13,42,1,110006,20000,'2022-03-27 03:34:17'),
(169,13,42,1,110006,20000,'2022-03-27 03:34:23'),
(170,13,42,1,110006,20000,'2022-03-27 03:34:53'),
(171,13,42,1,110006,20000,'2022-03-27 03:34:57'),
(172,13,42,1,110006,20000,'2022-03-27 03:35:29'),
(173,13,42,1,110006,20000,'2022-03-27 03:35:32'),
(174,13,42,1,110006,20000,'2022-03-27 03:35:35'),
(175,13,42,1,110006,20000,'2022-03-27 03:35:39'),
(176,13,42,1,110006,20000,'2022-03-27 03:35:42'),
(177,13,42,1,110006,20000,'2022-03-27 03:35:45'),
(178,13,42,1,110006,20000,'2022-03-27 03:35:49'),
(179,13,42,1,23162,120000,'2022-03-27 03:43:04'),
(180,13,42,1,23162,120000,'2022-03-27 03:43:10'),
(181,13,42,1,23162,120000,'2022-03-27 03:43:21'),
(182,13,42,1,23162,120000,'2022-03-27 03:43:24'),
(183,13,42,1,23162,120000,'2022-03-27 03:43:28'),
(184,13,59,1,82446,90000,'2022-03-27 04:00:12'),
(185,13,59,1,86574,10000,'2022-03-27 05:10:15'),
(186,13,59,1,23162,120000,'2022-03-27 16:34:19'),
(187,13,59,1,23162,120000,'2022-03-27 16:34:25'),
(188,13,59,1,23162,120000,'2022-03-27 16:34:28'),
(189,13,59,1,23162,120000,'2022-03-27 16:34:31'),
(190,3,6,1,110009,100000,'2022-03-27 21:34:15'),
(191,3,6,1,110001,20000,'2022-03-27 21:34:27'),
(192,3,6,1,110004,130000,'2022-03-27 21:35:13'),
(193,3,6,1,110001,20000,'2022-03-27 21:35:45'),
(194,3,6,1,110014,2000000,'2022-03-27 21:37:19'),
(195,4,19,1,110001,20000,'2022-03-27 22:38:25'),
(196,3,0,1,17,2232500,'2022-03-28 00:18:31'),
(197,3,38,1,110017,450000,'2022-03-28 00:27:01'),
(198,3,38,1,110007,20000,'2022-03-28 00:39:51'),
(199,3,38,1,110007,20000,'2022-03-28 00:39:55'),
(200,3,38,1,110007,20000,'2022-03-28 00:40:24'),
(201,3,38,1,110007,20000,'2022-03-28 00:40:29'),
(202,3,38,1,110007,20000,'2022-03-28 00:40:33'),
(203,3,38,1,110007,20000,'2022-03-28 00:40:37'),
(204,3,38,1,110007,20000,'2022-03-28 00:40:41'),
(205,3,38,1,110007,20000,'2022-03-28 00:40:44'),
(206,3,38,1,110007,20000,'2022-03-28 00:40:47'),
(207,3,38,1,110007,20000,'2022-03-28 00:40:51'),
(208,3,38,1,110007,20000,'2022-03-28 00:43:30'),
(209,3,38,1,110007,20000,'2022-03-28 00:43:40'),
(210,3,38,1,110007,20000,'2022-03-28 00:43:44'),
(211,3,38,1,110007,20000,'2022-03-28 00:43:48'),
(212,3,38,1,23162,120000,'2022-03-28 01:07:45'),
(213,3,38,1,23162,120000,'2022-03-28 01:08:06'),
(214,3,38,1,23162,120000,'2022-03-28 01:08:11'),
(215,3,38,1,98618,300000,'2022-03-28 01:19:30'),
(216,3,38,1,112326,300000,'2022-03-28 01:19:41'),
(217,3,38,1,32768,180000,'2022-03-28 01:19:53'),
(218,3,54,1,110015,950000,'2022-03-28 01:43:24'),
(219,3,54,1,110015,950000,'2022-03-28 01:44:09'),
(220,13,0,1,17,2232500,'2022-03-28 03:08:28'),
(221,3,0,1,17,2232500,'2022-03-28 03:09:04'),
(222,13,74,1,12354,10000,'2022-03-28 05:41:44'),
(223,13,74,1,13329,10000,'2022-03-28 05:42:13'),
(224,13,74,1,12302,10000,'2022-03-28 05:42:33'),
(225,3,6,2,86574,10000,'2022-03-28 15:35:23'),
(226,3,6,2,110001,20000,'2022-03-28 15:37:16'),
(227,5,0,1,17,1187500,'2022-03-28 19:13:26'),
(228,5,90,1,110015,950000,'2022-03-28 19:30:59'),
(229,5,90,1,110015,950000,'2022-03-28 19:32:08'),
(230,3,38,1,110009,100000,'2022-03-29 23:37:22'),
(231,3,38,1,85870,550000,'2022-03-29 23:38:10'),
(232,13,102,1,69230,170000,'2022-03-30 04:03:51'),
(233,23,52,1,110007,20000,'2022-03-31 06:30:07'),
(234,23,52,1,110007,20000,'2022-03-31 06:32:07'),
(235,23,52,1,110007,20000,'2022-03-31 06:32:11'),
(236,23,52,1,110007,20000,'2022-03-31 06:32:17'),
(237,23,52,1,110007,20000,'2022-03-31 06:32:22'),
(238,23,52,1,110007,20000,'2022-03-31 06:34:04'),
(239,23,52,1,110007,20000,'2022-03-31 06:34:09'),
(240,23,52,1,110007,20000,'2022-03-31 06:34:14'),
(241,23,52,1,110007,20000,'2022-03-31 06:34:18'),
(242,23,52,1,110007,20000,'2022-03-31 06:34:24'),
(243,23,52,1,110005,20000,'2022-03-31 17:02:34'),
(244,23,52,1,110005,20000,'2022-03-31 17:03:04'),
(245,23,52,1,110005,20000,'2022-03-31 17:03:08'),
(246,23,52,1,110005,20000,'2022-03-31 17:03:13'),
(247,23,52,1,110005,20000,'2022-03-31 17:03:19'),
(248,23,52,1,110005,20000,'2022-03-31 17:05:41'),
(249,23,52,1,110005,20000,'2022-03-31 17:05:45'),
(250,23,52,1,110005,20000,'2022-03-31 17:07:08'),
(251,23,52,1,110008,20000,'2022-03-31 17:08:22'),
(252,23,52,1,110008,20000,'2022-03-31 17:08:29'),
(253,23,52,1,110008,20000,'2022-03-31 17:08:53'),
(254,23,52,1,110008,20000,'2022-03-31 17:08:57'),
(255,23,52,1,110008,20000,'2022-03-31 17:09:01'),
(256,23,52,1,110008,20000,'2022-03-31 17:09:06'),
(257,23,52,1,110008,20000,'2022-03-31 17:09:10'),
(258,13,102,1,63040,200000,'2022-03-31 17:26:12'),
(259,13,102,1,51955,200000,'2022-03-31 17:26:38'),
(260,13,59,1,110007,20000,'2022-04-01 01:41:27'),
(261,13,59,1,110006,20000,'2022-04-01 01:42:46'),
(262,13,59,1,110006,20000,'2022-04-01 01:42:50'),
(263,13,59,1,110006,20000,'2022-04-01 01:42:54'),
(264,13,59,1,110006,20000,'2022-04-01 01:43:41'),
(265,13,59,1,110006,20000,'2022-04-01 01:43:46'),
(266,13,59,1,110006,20000,'2022-04-01 01:43:51'),
(267,13,59,1,110006,20000,'2022-04-01 01:45:04'),
(268,13,59,1,110006,20000,'2022-04-01 01:45:08'),
(269,13,59,1,110006,20000,'2022-04-01 01:45:12'),
(270,13,59,1,110006,20000,'2022-04-01 01:46:10'),
(271,13,59,1,110006,20000,'2022-04-01 01:46:14'),
(272,13,59,1,110006,20000,'2022-04-01 01:46:19'),
(273,13,59,1,110006,20000,'2022-04-01 01:46:45'),
(274,13,59,1,110006,20000,'2022-04-01 01:46:49'),
(275,13,59,1,110006,20000,'2022-04-01 01:46:53'),
(276,13,59,1,110006,20000,'2022-04-01 01:48:40'),
(277,13,59,1,110006,20000,'2022-04-01 01:49:00'),
(278,13,59,1,110006,20000,'2022-04-01 01:49:06'),
(279,3,105,1,86574,10000,'2022-04-01 02:43:32'),
(280,3,105,1,23162,120000,'2022-04-01 02:54:16'),
(281,3,105,1,23162,120000,'2022-04-01 02:54:20'),
(282,3,105,1,23162,120000,'2022-04-01 02:54:23'),
(283,3,105,1,23162,120000,'2022-04-01 02:54:26'),
(284,3,105,1,86574,10000,'2022-04-01 03:05:16'),
(285,3,105,1,110006,20000,'2022-04-01 03:43:38'),
(286,23,52,1,110008,20000,'2022-04-02 08:47:07'),
(287,23,52,1,110008,20000,'2022-04-02 08:47:12'),
(288,23,52,1,110008,20000,'2022-04-02 08:47:19'),
(289,23,52,1,110008,20000,'2022-04-02 08:47:23'),
(290,23,52,1,110008,20000,'2022-04-02 08:47:27'),
(291,23,52,1,110008,20000,'2022-04-02 08:47:33'),
(292,23,52,1,110008,20000,'2022-04-02 08:47:37'),
(293,23,52,1,110008,20000,'2022-04-02 08:47:40'),
(294,23,52,1,110008,20000,'2022-04-02 08:47:44'),
(295,23,52,1,110008,20000,'2022-04-02 08:50:20'),
(296,23,52,1,110008,20000,'2022-04-02 08:50:24'),
(297,23,52,1,110008,20000,'2022-04-02 08:50:29'),
(298,23,52,1,110008,20000,'2022-04-02 08:50:33'),
(299,23,52,1,110008,20000,'2022-04-02 08:50:37'),
(300,23,52,1,110008,20000,'2022-04-02 08:50:40'),
(301,23,52,1,110008,20000,'2022-04-02 08:53:04'),
(302,23,52,1,110008,20000,'2022-04-02 08:53:07'),
(303,23,52,1,110008,20000,'2022-04-02 08:53:11'),
(304,23,52,1,35516,50000,'2022-04-02 08:55:26'),
(305,13,59,1,110011,500000,'2022-04-02 12:44:33'),
(306,38,117,1,23162,120000,'2022-04-03 01:05:53'),
(307,38,117,1,110012,900000,'2022-04-03 01:18:40'),
(308,38,117,1,86574,10000,'2022-04-03 01:39:00'),
(309,3,116,1,110001,20000,'2022-04-03 02:14:15'),
(310,23,52,1,110100,100000,'2022-04-03 10:05:00'),
(311,23,52,1,110100,100000,'2022-04-03 10:05:15'),
(312,23,52,1,23162,120000,'2022-04-03 16:16:59'),
(313,23,52,1,23162,120000,'2022-04-03 16:18:01'),
(314,23,52,1,23162,120000,'2022-04-03 16:19:29'),
(315,38,118,1,86574,10000,'2022-04-03 16:42:34'),
(316,38,118,1,86574,10000,'2022-04-03 16:42:37'),
(317,38,118,1,86574,10000,'2022-04-03 16:42:41'),
(318,38,118,1,110101,20000,'2022-04-03 16:49:55'),
(319,38,118,1,44168,50000,'2022-04-03 16:51:42'),
(320,38,117,1,86574,10000,'2022-04-03 20:00:54'),
(321,38,117,1,86574,10000,'2022-04-03 20:00:57'),
(322,13,59,1,110014,2000000,'2022-04-03 20:26:05'),
(323,13,59,1,110014,2000000,'2022-04-03 20:26:08'),
(324,13,59,1,110014,2000000,'2022-04-03 20:26:11'),
(325,3,6,1,110001,20000,'2022-04-03 23:15:19'),
(326,13,74,1,13335,70000,'2022-04-04 00:53:11'),
(327,13,74,1,29228,70000,'2022-04-04 00:54:05'),
(328,13,74,1,28915,70000,'2022-04-04 00:54:11'),
(329,13,74,1,69747,70000,'2022-04-04 00:54:17'),
(330,13,74,1,44168,50000,'2022-04-04 00:54:41'),
(331,13,74,1,44707,50000,'2022-04-04 00:55:21'),
(332,13,74,1,44413,40000,'2022-04-04 00:55:28'),
(333,13,74,1,41508,40000,'2022-04-04 00:55:35'),
(334,13,74,1,43962,40000,'2022-04-04 00:55:47'),
(335,13,74,1,46102,40000,'2022-04-04 00:56:36'),
(336,13,74,1,49284,200000,'2022-04-04 00:56:58'),
(337,13,74,1,12353,10000,'2022-04-04 00:57:06'),
(338,13,74,1,13328,10000,'2022-04-04 00:57:25'),
(339,13,74,1,12351,10000,'2022-04-04 00:57:33'),
(340,3,105,1,86574,10000,'2022-04-04 01:46:09'),
(341,3,6,1,63042,200000,'2022-04-04 05:48:28'),
(342,3,6,1,62900,200000,'2022-04-04 05:48:43'),
(343,51,139,1,65891,50000,'2022-04-04 07:17:22'),
(344,13,101,1,23162,120000,'2022-04-04 07:42:56'),
(345,13,101,1,23162,120000,'2022-04-04 07:43:01'),
(346,13,101,1,23162,120000,'2022-04-04 07:43:06'),
(347,13,101,1,23162,120000,'2022-04-04 07:43:10'),
(348,52,140,1,69230,170000,'2022-04-04 10:09:58'),
(349,51,139,1,69230,170000,'2022-04-04 10:33:47'),
(350,23,144,1,86574,10000,'2022-04-04 17:28:51'),
(351,23,144,1,86574,10000,'2022-04-04 17:29:01'),
(352,38,118,1,86574,10000,'2022-04-04 19:27:09'),
(353,38,117,1,86574,10000,'2022-04-04 20:42:47'),
(354,38,117,1,86574,10000,'2022-04-04 20:55:59'),
(355,38,117,1,86574,10000,'2022-04-04 21:57:11'),
(356,38,117,1,86574,10000,'2022-04-04 22:07:13'),
(357,6,23,1,110015,950000,'2022-04-05 00:20:06'),
(358,6,23,1,110016,200000,'2022-04-05 00:20:40'),
(359,3,6,1,110016,200000,'2022-04-05 00:22:19'),
(360,3,148,1,110015,950000,'2022-04-05 01:42:31'),
(361,23,144,1,86574,10000,'2022-04-05 06:00:34'),
(362,13,51,1,23162,120000,'2022-04-05 16:13:42'),
(363,13,51,1,23162,120000,'2022-04-05 16:13:45'),
(364,13,51,1,23162,120000,'2022-04-05 16:13:49'),
(365,13,51,1,23162,120000,'2022-04-05 16:13:55'),
(366,38,118,1,86574,10000,'2022-04-05 17:10:28'),
(367,38,118,1,110100,100000,'2022-04-05 19:05:48'),
(368,38,118,1,110100,100000,'2022-04-05 19:21:15'),
(369,3,151,1,86574,10000,'2022-04-05 19:24:50'),
(370,3,151,1,110015,950000,'2022-04-05 19:53:51'),
(371,3,151,1,76755,300000,'2022-04-05 20:03:15'),
(372,3,152,1,76755,300000,'2022-04-05 20:04:12'),
(373,3,151,1,104011,300000,'2022-04-05 20:06:26'),
(374,3,151,1,51954,200000,'2022-04-05 20:06:42'),
(375,3,151,1,51955,200000,'2022-04-05 20:06:49'),
(376,3,155,1,86574,10000,'2022-04-05 23:43:50'),
(377,38,118,1,23162,120000,'2022-04-06 22:48:44'),
(378,38,118,1,23162,120000,'2022-04-06 22:48:47'),
(379,13,51,1,110101,20000,'2022-04-08 06:15:08'),
(380,13,51,1,110100,100000,'2022-04-08 06:16:06'),
(381,51,156,1,86574,10000,'2022-04-08 22:09:23'),
(382,51,156,1,86574,10000,'2022-04-08 22:09:29'),
(383,51,156,1,86574,10000,'2022-04-08 22:09:33'),
(384,51,156,1,86574,10000,'2022-04-08 22:09:36'),
(385,51,156,1,86574,10000,'2022-04-08 22:09:42'),
(386,51,156,1,110100,100000,'2022-04-08 22:10:19'),
(387,51,156,1,110101,20000,'2022-04-08 22:11:46'),
(388,38,118,1,110100,100000,'2022-04-08 23:56:00'),
(389,38,118,1,110100,100000,'2022-04-08 23:57:48'),
(390,38,118,1,110100,100000,'2022-04-08 23:57:51'),
(391,38,118,1,110018,250000,'2022-04-08 23:58:00'),
(392,38,118,1,110100,100000,'2022-04-09 00:32:42'),
(393,51,156,1,86574,10000,'2022-04-09 01:50:20'),
(394,51,156,1,110101,20000,'2022-04-09 01:51:05'),
(395,51,156,1,23162,120000,'2022-04-09 02:01:48'),
(396,51,156,1,86574,10000,'2022-04-09 04:31:19'),
(397,51,156,1,86574,10000,'2022-04-09 04:31:24'),
(398,51,156,1,86574,10000,'2022-04-09 04:31:30'),
(399,51,156,1,86574,10000,'2022-04-09 04:31:47'),
(400,51,156,1,86574,10000,'2022-04-09 04:31:58'),
(401,51,156,1,86574,10000,'2022-04-09 04:32:04'),
(402,23,52,1,110100,100000,'2022-04-09 10:40:31'),
(403,23,144,1,110100,100000,'2022-04-09 10:50:40'),
(404,23,144,1,110100,100000,'2022-04-09 10:55:30'),
(405,63,167,1,110100,100000,'2022-04-09 12:08:13'),
(406,63,167,1,110100,100000,'2022-04-09 12:11:11'),
(407,63,167,1,65891,50000,'2022-04-09 17:05:46'),
(408,63,167,1,69230,170000,'2022-04-09 17:09:04'),
(409,63,167,1,44413,40000,'2022-04-09 17:09:40'),
(410,63,167,1,41508,40000,'2022-04-09 17:11:57'),
(411,51,156,1,23162,120000,'2022-04-09 22:52:57'),
(412,38,118,1,110014,2000000,'2022-04-10 14:42:42'),
(413,38,199,1,86574,10000,'2022-04-12 00:07:54'),
(414,38,199,1,86574,10000,'2022-04-12 00:08:04'),
(415,38,199,1,23162,120000,'2022-04-12 00:18:18'),
(416,38,199,1,23162,120000,'2022-04-12 00:18:29'),
(417,51,156,1,23162,120000,'2022-04-12 00:29:09'),
(418,50,138,1,110100,100000,'2022-04-12 21:24:10'),
(419,50,138,1,110100,100000,'2022-04-12 21:26:08'),
(420,64,158,1,86574,10000,'2022-04-12 21:28:28'),
(421,52,176,1,110100,100000,'2022-04-13 01:10:25'),
(422,52,140,1,110100,100000,'2022-04-13 01:12:03'),
(423,51,156,1,44168,50000,'2022-04-13 03:23:00'),
(424,51,156,1,49284,200000,'2022-04-13 03:28:37'),
(425,64,158,1,110009,100000,'2022-04-13 09:40:30'),
(426,52,176,1,23162,120000,'2022-04-13 10:17:47'),
(427,52,176,1,23162,120000,'2022-04-13 10:18:35'),
(428,52,176,1,23162,120000,'2022-04-13 10:19:19'),
(429,52,176,1,23162,120000,'2022-04-13 10:20:24'),
(430,64,219,1,23162,120000,'2022-04-13 14:08:39'),
(431,64,219,1,23162,120000,'2022-04-13 14:08:58'),
(432,64,219,1,23162,120000,'2022-04-13 14:09:02'),
(433,64,219,1,23162,120000,'2022-04-13 14:09:07'),
(434,64,219,1,65891,50000,'2022-04-13 14:10:08'),
(435,64,219,1,51955,200000,'2022-04-13 14:11:10'),
(436,38,199,1,86574,10000,'2022-04-13 14:12:27'),
(437,3,6,1,86574,10000,'2022-04-13 14:18:00'),
(438,38,199,1,65891,50000,'2022-04-13 14:24:05'),
(439,64,219,1,110101,20000,'2022-04-13 17:56:58'),
(440,64,219,1,110100,100000,'2022-04-13 17:57:05'),
(441,64,219,1,86574,10000,'2022-04-13 18:04:45'),
(442,64,219,1,86574,10000,'2022-04-13 19:03:19'),
(443,64,219,1,86574,10000,'2022-04-13 19:03:26'),
(444,64,219,1,86574,10000,'2022-04-13 19:03:30'),
(445,38,199,1,38050,200000,'2022-04-13 19:37:28'),
(446,38,199,1,110100,100000,'2022-04-13 22:39:49'),
(447,38,199,1,110100,100000,'2022-04-13 22:40:29'),
(448,52,140,1,110101,20000,'2022-04-13 22:57:47'),
(449,52,140,1,110101,20000,'2022-04-13 23:00:11'),
(450,52,140,1,86574,10000,'2022-04-14 01:17:40'),
(451,50,138,1,23162,120000,'2022-04-14 18:33:43'),
(452,38,118,1,110100,100000,'2022-04-15 01:03:18'),
(453,109,222,1,110010,400000,'2022-04-15 14:06:10'),
(454,51,153,1,23162,120000,'2022-04-15 21:09:46'),
(455,51,153,1,86574,10000,'2022-04-15 21:14:03'),
(456,51,153,1,86574,10000,'2022-04-15 21:14:07'),
(457,51,153,1,86574,10000,'2022-04-15 21:14:13'),
(458,109,222,1,44707,50000,'2022-04-15 23:41:41'),
(459,109,222,1,65891,50000,'2022-04-15 23:41:54'),
(460,109,222,1,86574,10000,'2022-04-15 23:43:27'),
(461,109,222,1,86574,10000,'2022-04-16 00:44:18'),
(462,109,222,1,110010,400000,'2022-04-16 01:10:30'),
(463,50,0,1,17,1187500,'2022-04-16 08:07:54'),
(464,109,222,1,86574,10000,'2022-04-16 11:42:10'),
(465,109,222,1,86574,10000,'2022-04-16 12:41:18'),
(466,109,222,1,86574,10000,'2022-04-16 15:59:50'),
(467,51,139,1,110100,100000,'2022-04-17 16:53:19'),
(468,51,153,1,23162,120000,'2022-04-17 20:30:36'),
(469,51,153,1,86574,10000,'2022-04-17 20:31:32'),
(470,51,153,1,86574,10000,'2022-04-17 20:31:37'),
(471,51,153,1,86574,10000,'2022-04-17 20:31:43'),
(472,51,153,1,86574,10000,'2022-04-17 20:31:48'),
(473,38,117,1,110100,100000,'2022-04-17 22:46:48'),
(474,38,0,1,17,1187500,'2022-04-17 22:57:13'),
(475,38,146,1,110100,100000,'2022-04-17 22:59:39'),
(476,38,146,1,110100,100000,'2022-04-17 23:00:09'),
(477,38,146,1,110100,100000,'2022-04-17 23:19:56'),
(478,51,153,1,110100,100000,'2022-04-18 02:23:41'),
(479,52,149,1,110100,100000,'2022-04-18 05:56:52'),
(480,52,149,1,110100,100000,'2022-04-18 05:56:59'),
(481,52,149,1,23162,120000,'2022-04-18 05:57:10'),
(482,51,153,1,110100,100000,'2022-04-18 07:46:58'),
(483,50,241,1,110101,20000,'2022-04-18 11:24:25'),
(484,50,241,1,110100,100000,'2022-04-18 11:25:10'),
(485,50,241,1,110100,100000,'2022-04-18 11:41:41'),
(486,38,118,1,110014,2000000,'2022-04-18 16:28:15'),
(487,51,283,1,23162,120000,'2022-04-19 02:19:12'),
(488,51,139,1,110100,100000,'2022-04-19 08:43:50'),
(489,51,283,1,86574,10000,'2022-04-19 11:03:26'),
(490,51,283,1,86574,10000,'2022-04-19 11:03:30'),
(491,51,283,1,86574,10000,'2022-04-19 11:03:37'),
(492,51,283,1,86574,10000,'2022-04-19 11:03:45'),
(493,51,0,1,17,1187500,'2022-04-19 13:53:01'),
(494,51,283,1,104208,200000,'2022-04-19 21:43:45'),
(495,38,118,1,22488,50000,'2022-04-19 21:44:36'),
(496,38,118,1,22489,50000,'2022-04-19 21:45:13'),
(497,38,118,1,22490,50000,'2022-04-19 21:45:23'),
(498,38,118,1,22494,50000,'2022-04-19 21:45:33'),
(499,38,118,1,22491,50000,'2022-04-19 21:49:51'),
(500,38,118,1,40497,300000,'2022-04-19 21:51:25'),
(501,3,281,1,23162,120000,'2022-04-19 23:08:26'),
(502,3,281,1,110014,2000000,'2022-04-19 23:12:36'),
(503,51,153,1,71665,200000,'2022-04-20 00:47:04'),
(504,51,153,1,104269,700000,'2022-04-20 00:49:49'),
(505,3,105,1,104269,700000,'2022-04-20 02:38:31'),
(506,3,295,1,86574,10000,'2022-04-20 03:52:10'),
(507,11,285,1,86574,10000,'2022-04-20 10:40:00'),
(508,11,285,1,23162,120000,'2022-04-20 11:08:29'),
(509,11,285,1,110009,100000,'2022-04-20 11:24:14'),
(510,11,285,1,43962,40000,'2022-04-20 11:25:38'),
(511,11,285,1,71665,200000,'2022-04-20 11:25:48'),
(512,11,285,1,13317,10000,'2022-04-20 11:26:01'),
(513,11,285,1,8586,10000,'2022-04-20 11:26:06'),
(514,11,285,1,12303,10000,'2022-04-20 11:26:10'),
(515,11,285,1,12302,10000,'2022-04-20 11:26:14'),
(516,11,285,1,32768,180000,'2022-04-20 11:26:24'),
(517,11,285,1,68823,150000,'2022-04-20 11:26:29'),
(518,11,285,1,44164,170000,'2022-04-20 11:26:34'),
(519,11,285,1,104208,200000,'2022-04-20 11:26:54'),
(520,11,285,1,29344,200000,'2022-04-20 11:53:37'),
(521,11,285,1,86574,10000,'2022-04-20 12:16:39'),
(522,11,285,1,110100,100000,'2022-04-20 12:24:26'),
(523,11,285,1,110009,100000,'2022-04-20 12:26:26'),
(524,11,285,1,110100,100000,'2022-04-20 12:27:34'),
(525,11,285,1,86574,10000,'2022-04-20 13:29:30'),
(526,11,285,1,110010,400000,'2022-04-20 13:46:14'),
(527,11,285,1,32837,700000,'2022-04-20 13:46:51'),
(528,145,0,1,17,2850000,'2022-04-20 16:07:38'),
(529,52,249,1,104269,700000,'2022-04-20 16:35:30'),
(530,145,299,1,23162,120000,'2022-04-20 16:49:34'),
(531,144,300,1,86574,10000,'2022-04-20 17:48:44'),
(532,144,300,1,86574,10000,'2022-04-20 18:16:13'),
(533,144,300,1,110009,100000,'2022-04-20 18:41:28'),
(534,144,300,1,86574,10000,'2022-04-20 18:43:44'),
(535,51,283,1,110100,100000,'2022-04-20 23:20:04'),
(536,11,285,1,86574,10000,'2022-04-21 00:41:43'),
(537,3,38,1,32837,700000,'2022-04-21 06:26:58'),
(538,3,6,1,36942,1900000,'2022-04-21 07:25:16'),
(539,3,6,1,49623,1800000,'2022-04-21 07:26:02'),
(540,3,6,1,29344,200000,'2022-04-21 07:44:07'),
(541,11,168,1,69747,70000,'2022-04-21 07:44:24'),
(542,11,168,1,13335,70000,'2022-04-21 07:52:38'),
(543,11,168,1,44707,50000,'2022-04-21 07:52:48'),
(544,11,168,1,109013,300000,'2022-04-21 07:53:05'),
(545,11,168,1,104011,300000,'2022-04-21 07:54:49'),
(546,11,168,1,63040,200000,'2022-04-21 07:55:00'),
(547,11,168,1,62901,200000,'2022-04-21 07:55:06'),
(548,11,168,1,51955,200000,'2022-04-21 07:55:37'),
(549,144,300,1,86574,10000,'2022-04-21 14:16:25'),
(550,11,168,1,97989,300000,'2022-04-21 14:37:08'),
(551,11,168,1,69230,170000,'2022-04-21 14:39:55'),
(552,11,168,1,44151,170000,'2022-04-21 14:40:01'),
(553,11,168,1,44175,170000,'2022-04-21 14:40:04'),
(554,11,168,1,95426,500000,'2022-04-21 14:45:12'),
(555,11,315,1,23162,120000,'2022-04-21 15:02:51'),
(556,11,315,1,23162,120000,'2022-04-21 15:02:55'),
(557,11,315,1,34334,800000,'2022-04-21 15:03:10'),
(558,11,315,1,86574,10000,'2022-04-21 15:03:41'),
(559,11,168,1,36942,1900000,'2022-04-21 19:06:14'),
(560,11,168,1,16908,40000,'2022-04-21 19:08:29'),
(561,11,168,1,16832,40000,'2022-04-21 19:08:33'),
(562,11,168,1,16905,40000,'2022-04-21 19:08:37'),
(563,11,168,1,16907,40000,'2022-04-21 19:08:41'),
(564,11,168,1,16909,40000,'2022-04-21 19:08:46'),
(565,11,168,1,16910,40000,'2022-04-21 19:08:49'),
(566,11,168,1,16906,40000,'2022-04-21 19:08:52'),
(567,6,23,1,23162,120000,'2022-04-22 02:49:51'),
(568,6,23,1,23162,120000,'2022-04-22 02:50:10'),
(569,6,23,1,23162,120000,'2022-04-22 02:50:36'),
(570,6,23,1,23162,120000,'2022-04-22 02:50:40'),
(571,6,23,1,23162,120000,'2022-04-22 02:51:13'),
(572,6,23,1,86574,10000,'2022-04-22 02:52:05'),
(573,3,341,1,86574,10000,'2022-04-22 03:00:14'),
(574,52,249,1,54811,300000,'2022-04-22 09:30:53'),
(575,11,92,1,110100,100000,'2022-04-22 11:45:50'),
(576,11,92,1,110100,100000,'2022-04-22 11:46:14'),
(577,11,36,1,110100,100000,'2022-04-22 11:55:42'),
(578,11,68,1,110100,100000,'2022-04-22 12:42:50'),
(579,23,52,1,63040,200000,'2022-04-22 17:46:21'),
(580,144,300,1,110100,100000,'2022-04-22 19:07:46'),
(581,144,300,1,110100,100000,'2022-04-22 19:13:22'),
(582,178,0,1,17,2850000,'2022-04-23 11:51:52'),
(583,178,360,1,110011,500000,'2022-04-23 11:52:29'),
(584,178,360,1,110009,100000,'2022-04-23 11:55:41'),
(585,178,360,1,110009,100000,'2022-04-23 11:55:47'),
(586,52,249,1,110100,100000,'2022-04-23 18:04:18'),
(587,52,249,1,110100,100000,'2022-04-23 18:04:23'),
(588,52,249,1,110101,20000,'2022-04-23 19:33:43'),
(589,52,249,1,110101,20000,'2022-04-23 20:09:56'),
(590,41,120,1,110101,20000,'2022-04-24 12:50:37'),
(591,41,120,1,110100,100000,'2022-04-24 13:04:53'),
(592,41,120,1,110100,100000,'2022-04-24 13:05:05'),
(593,41,120,1,38050,200000,'2022-04-24 13:22:52'),
(594,41,120,1,23162,120000,'2022-04-24 13:23:09'),
(595,41,120,1,23162,120000,'2022-04-24 13:23:13'),
(596,41,120,1,23162,120000,'2022-04-24 13:23:17'),
(597,41,120,1,23162,120000,'2022-04-24 13:23:20'),
(598,4,19,1,110100,100000,'2022-04-24 13:57:38'),
(599,4,19,1,32837,700000,'2022-04-24 14:03:58'),
(600,41,120,1,65891,50000,'2022-04-24 15:08:38'),
(601,41,120,1,112326,300000,'2022-04-24 15:09:12'),
(602,41,120,1,104208,200000,'2022-04-24 15:09:48'),
(603,41,225,1,110100,100000,'2022-04-24 16:28:19'),
(604,41,225,1,110100,100000,'2022-04-24 16:28:23'),
(605,38,393,1,86574,10000,'2022-04-24 19:02:00'),
(606,38,393,1,86574,10000,'2022-04-24 19:02:03'),
(607,38,393,1,86574,10000,'2022-04-24 19:02:11'),
(608,38,393,1,86574,10000,'2022-04-24 19:02:16'),
(609,38,393,1,86574,10000,'2022-04-24 21:02:36'),
(610,51,283,1,13327,10000,'2022-04-25 02:36:00'),
(611,51,283,1,12351,10000,'2022-04-25 02:36:57'),
(612,51,283,1,12330,10000,'2022-04-25 02:37:18'),
(613,51,283,1,15293,10000,'2022-04-25 02:37:27'),
(614,51,283,1,15292,10000,'2022-04-25 02:37:41'),
(615,51,283,1,12302,10000,'2022-04-25 02:38:07'),
(616,51,283,1,13317,10000,'2022-04-25 02:38:24'),
(617,51,283,1,8586,10000,'2022-04-25 02:38:32'),
(618,51,283,1,23162,120000,'2022-04-25 16:18:01'),
(619,41,225,1,36942,1900000,'2022-04-25 18:05:09'),
(620,41,225,1,44413,40000,'2022-04-25 18:15:41'),
(621,41,225,1,41508,40000,'2022-04-25 18:15:49'),
(622,41,225,1,104011,300000,'2022-04-25 18:22:03'),
(623,38,415,1,86574,10000,'2022-04-25 18:39:40'),
(624,38,415,1,86574,10000,'2022-04-25 18:39:42'),
(625,38,415,1,86574,10000,'2022-04-25 18:39:49'),
(626,50,138,1,110100,100000,'2022-04-26 14:10:39'),
(627,50,138,1,110100,100000,'2022-04-26 14:53:54'),
(628,38,415,1,86574,10000,'2022-04-26 18:05:09'),
(629,38,415,1,86574,10000,'2022-04-26 19:14:59'),
(630,38,393,1,110100,100000,'2022-04-26 21:44:06'),
(631,38,393,1,110100,100000,'2022-04-26 21:44:11'),
(632,38,415,1,86574,10000,'2022-04-26 22:10:52'),
(633,51,436,1,86574,10000,'2022-04-27 04:34:13'),
(634,51,436,1,86574,10000,'2022-04-27 04:34:20'),
(635,38,415,1,86574,10000,'2022-04-27 14:44:37'),
(636,38,415,1,110100,100000,'2022-04-27 16:58:24'),
(637,38,415,1,110100,100000,'2022-04-27 16:58:28'),
(638,38,415,1,110100,100000,'2022-04-27 16:58:34'),
(639,38,415,1,22476,50000,'2022-04-27 17:03:24'),
(640,38,415,1,22477,50000,'2022-04-27 17:03:45'),
(641,38,415,1,22481,50000,'2022-04-27 17:03:51'),
(642,38,415,1,22478,50000,'2022-04-27 17:04:02'),
(643,38,415,1,22479,50000,'2022-04-27 17:04:12'),
(644,38,415,1,22482,50000,'2022-04-27 17:04:24'),
(645,38,415,1,32837,700000,'2022-04-27 17:05:13'),
(646,38,415,1,22480,50000,'2022-04-27 17:06:27'),
(647,38,117,1,110100,100000,'2022-04-27 20:57:05'),
(648,4,19,1,84101,900000,'2022-04-27 23:20:16'),
(649,4,19,1,104208,200000,'2022-04-27 23:20:20'),
(650,51,455,1,86574,10000,'2022-04-28 00:02:55'),
(651,51,455,1,86574,10000,'2022-04-28 00:03:02'),
(652,51,455,1,86574,10000,'2022-04-28 00:03:12'),
(653,178,360,1,86574,10000,'2022-04-28 02:20:23'),
(654,51,283,1,86574,10000,'2022-04-28 04:01:14'),
(655,51,283,1,86574,10000,'2022-04-28 04:26:35'),
(656,51,283,1,86574,10000,'2022-04-28 04:26:40'),
(657,13,59,1,86574,10000,'2022-04-28 05:32:38'),
(658,13,59,1,86574,10000,'2022-04-28 06:33:54'),
(659,144,300,1,86574,10000,'2022-04-28 12:41:41'),
(660,144,300,1,86574,10000,'2022-04-28 12:59:44'),
(661,144,300,1,86574,10000,'2022-04-28 13:22:42'),
(662,144,300,1,86574,10000,'2022-04-28 14:24:36'),
(663,144,300,1,86574,10000,'2022-04-28 14:57:19'),
(664,198,397,1,49284,200000,'2022-04-28 17:10:34'),
(665,198,397,1,23162,120000,'2022-04-28 17:53:41'),
(666,198,397,1,23162,120000,'2022-04-28 17:54:25'),
(667,198,397,1,23162,120000,'2022-04-28 17:54:53'),
(668,198,397,1,23162,120000,'2022-04-28 17:55:50'),
(669,11,168,1,86574,10000,'2022-04-28 19:55:07'),
(670,11,168,1,44168,50000,'2022-04-28 20:02:17'),
(671,38,393,1,86574,10000,'2022-04-28 20:26:56'),
(672,38,393,1,86574,10000,'2022-04-28 20:27:07'),
(673,3,275,1,110016,200000,'2022-04-28 20:41:32'),
(674,38,393,1,86574,10000,'2022-04-28 21:37:59'),
(675,38,393,1,34334,800000,'2022-04-28 22:16:08'),
(676,38,393,1,22480,50000,'2022-04-28 22:16:51'),
(677,38,393,1,22477,50000,'2022-04-28 22:17:00'),
(678,38,393,1,22482,50000,'2022-04-28 22:17:04'),
(679,38,393,1,22481,50000,'2022-04-28 22:17:07'),
(680,38,393,1,22479,50000,'2022-04-28 22:17:14'),
(681,38,393,1,22478,50000,'2022-04-28 22:17:20'),
(682,38,393,1,22476,50000,'2022-04-28 22:18:45'),
(683,11,168,1,86574,10000,'2022-04-29 00:48:41'),
(684,38,393,1,86574,10000,'2022-04-29 13:15:26'),
(685,38,393,1,86574,10000,'2022-04-29 15:50:58'),
(686,178,417,1,86574,10000,'2022-04-29 16:11:01'),
(687,178,360,1,86574,10000,'2022-04-29 19:16:01'),
(688,178,360,1,86574,10000,'2022-04-29 21:28:01'),
(689,178,360,1,86574,10000,'2022-04-29 22:48:26'),
(690,178,360,1,86574,10000,'2022-04-30 00:26:46'),
(691,178,360,1,86574,10000,'2022-04-30 00:37:46'),
(692,178,360,1,86574,10000,'2022-04-30 00:38:11'),
(693,198,397,1,51955,200000,'2022-04-30 01:24:28'),
(694,178,360,1,86574,10000,'2022-04-30 03:56:21'),
(695,51,156,1,86574,10000,'2022-04-30 05:30:41'),
(696,51,156,1,86574,10000,'2022-04-30 05:32:33'),
(697,144,300,1,86574,10000,'2022-04-30 11:10:05'),
(698,144,300,1,86574,10000,'2022-04-30 11:11:06'),
(699,52,259,1,13329,10000,'2022-04-30 14:13:55'),
(700,52,259,1,15293,10000,'2022-04-30 14:14:23'),
(701,52,259,1,15292,10000,'2022-04-30 14:14:30'),
(702,52,259,1,13328,10000,'2022-04-30 14:15:18'),
(703,52,259,1,12351,10000,'2022-04-30 14:15:23'),
(704,52,259,1,12330,10000,'2022-04-30 14:15:32'),
(705,52,259,1,13327,10000,'2022-04-30 14:15:38'),
(706,52,259,1,13326,10000,'2022-04-30 14:15:43'),
(707,52,259,1,12302,10000,'2022-04-30 14:15:54'),
(708,52,259,1,12303,10000,'2022-04-30 14:15:59'),
(709,52,259,1,13317,10000,'2022-04-30 14:16:11'),
(710,52,259,1,8586,10000,'2022-04-30 14:16:15'),
(711,11,168,1,86574,10000,'2022-04-30 20:43:54'),
(712,11,168,1,86574,10000,'2022-04-30 23:47:59'),
(713,178,360,1,104269,700000,'2022-04-30 23:57:27'),
(714,178,360,1,86574,10000,'2022-05-01 00:24:33'),
(715,198,397,1,110012,900000,'2022-05-01 00:45:38'),
(716,3,6,1,16908,40000,'2022-05-01 03:40:33'),
(717,3,6,1,16832,40000,'2022-05-01 03:40:45'),
(718,3,6,1,16905,40000,'2022-05-01 03:40:55'),
(719,3,6,1,16911,40000,'2022-05-01 03:41:04'),
(720,3,6,1,16907,40000,'2022-05-01 03:41:09'),
(721,3,6,1,16910,40000,'2022-05-01 03:41:13'),
(722,3,6,1,16909,40000,'2022-05-01 03:41:17'),
(723,3,6,1,16906,40000,'2022-05-01 03:41:21'),
(724,51,283,1,44413,40000,'2022-05-01 05:56:27'),
(725,51,283,1,46102,40000,'2022-05-01 05:56:48'),
(726,51,283,1,41508,40000,'2022-05-01 05:57:29');

/*Table structure for table `bonus_rates` */

DROP TABLE IF EXISTS `bonus_rates`;

CREATE TABLE `bonus_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Autoincrementable ID',
  `realmid` int(11) NOT NULL DEFAULT '-1' COMMENT 'RealmID for which the rates would be active. -1 for all realms',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'If set to 0 - this bonus would not be loaded',
  `schedule` varchar(50) NOT NULL DEFAULT '* * * * *' COMMENT 'Cron-style schedule defining the time for the bonus rates period. Multiple periods can be specified with a semicolon separated list',
  `multiplier` float NOT NULL DEFAULT '2' COMMENT 'Rate multiplier (i.e. 2 would change the rates to be twice their usual value during the bonus rates period)',
  `rates` text NOT NULL COMMENT 'Space separated list of rate names as used in config (i.e. "Rate.XP.Kill Rate.Honor")',
  `start_announcement` tinytext COMMENT 'Announcement displayed in chat for all online players when the bonus rate period starts',
  `end_announcement` tinytext COMMENT 'Announcement displayed in chat for all online players when the bonus rate period ends',
  `active_announcement` tinytext COMMENT 'Announcement displayed in chat for all players logging in whenever the bonus rate period is active',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bonus_rates` */

/*Table structure for table `boost_promotion_executed` */

DROP TABLE IF EXISTS `boost_promotion_executed`;

CREATE TABLE `boost_promotion_executed` (
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `boost_promotion_executed` */

insert  into `boost_promotion_executed`(`member_id`) values 
(13),
(3),
(0);

/*Table structure for table `broadcast_strings` */

DROP TABLE IF EXISTS `broadcast_strings`;

CREATE TABLE `broadcast_strings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `next` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `broadcast_strings` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text,
  `default` text,
  `realmid` smallint(6) NOT NULL DEFAULT '-1',
  `description` text,
  `note` text,
  PRIMARY KEY (`name`,`realmid`) USING BTREE,
  KEY `option` (`name`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Here you can put the configs from the worldserver.conf file, so you can change without acessing the machine files.';

/*Data for the table `config` */

insert  into `config`(`category`,`name`,`value`,`default`,`realmid`,`description`,`note`) values 
('Players','AllowTwoSide.Interaction.Auction','0','0',1,'Merge all auction houses for players from different teams\nDefault: 0 (Not allowed)\n         1 (Allowed)',NULL),
('Players','AllowTwoSide.Interaction.Chat','0','0',-1,'Allow chat assembling between factions.\nDefault:     0',NULL),
('AntiCheat','Anticheat.DetectionsEnabled','27','31',1,'Anticheat hack',NULL),
('AntiCheat','Anticheat.ReportsForIngameWarnings','70','1',1,'Anticheat hack',NULL),
('Rate','BonusRoll.LootChance','31','31',1,'Bonus Roll',NULL),
('Dungeon Finder','DungeonFinder.CastDeserter','0','1',1,'Cast Deserter spell at players who leave DF-parties while the dungeons is in progress.\nDefault:     1',NULL),
('Dungeon Finder','DungeonFinder.DPSNeeded','1','1',1,'Specifies how many players have to select dps role in order for the party to be eligible for a dungeon.\nDefault:     1',NULL),
('Dungeon Finder','DungeonFinder.HealersNeeded','1','1',1,'Specifies how many players have to select healer role in order for the party to be eligible for a dungeon.\nDefault:     1',NULL),
('Dungeon Finder','DungeonFinder.KeepQueuesInDungeon','true','1',1,'Specifies how many players have to select healer role in order for the party to be eligible for a dungeon.\nDefault:     1',NULL),
('Dungeon Finder','DungeonFinder.OverrideRolesRequired','true','0',1,'If enabled all LFG role checks will use values from DungeonFinder.TanksNeeded, DungeonFinder.HealersNeeded and DungeonFinder.DPSNeeded to determine the number of players required in order for the party to be eligible for a dungeon. Overrides both group and raid dungeon values.\nDefault:     0',NULL),
('Dungeon Finder','DungeonFinder.ShortageCheckInterval','60','60',1,'Specifies the interval in seconds at which shortage roles for a queue should be updated.\nDefault:     5',NULL),
('Dungeon Finder','DungeonFinder.ShortagePercent','50','50',1,'Specifies at which percent of the ideal role representation ratio in a queue should it grant a Call to Arms reward\nDefault:     50',NULL),
('Dungeon Finder','DungeonFinder.TanksNeeded','1','1',1,'Specifies how many players have to select tank role in order for the party to be eligible for a dungeon.\nDefault:     1',NULL),
('LFR','LFR.LootChance','100','20',-1,'Chance to get personal loot from any boss',NULL),
('Rate','TargetPosRecalculateRange','5','5',1,'Range attack ',NULL),
('Misc','VengeanceMultipier','1','1',-1,NULL,NULL),
('Performance','Visibility.AINotifyDelay','1000','1000',1,'Description: delay (in milliseconds) between action and nearby AI reaction. Lower values may have\n             performance impact.\nDefault:     1000',NULL),
('Performance','Visibility.RelocationLowerLimit','10','20',1,'Description: distance in yards. unit should pass that distance to trigger visibility update.\nDefault:     10',NULL),
('Rate','XP.Gather.Difference','10','0',1,'',NULL),
('Rate','XP.Kill.Difference','10','0',1,'',NULL);

/*Table structure for table `icore_stat` */

DROP TABLE IF EXISTS `icore_stat`;

CREATE TABLE `icore_stat` (
  `online` smallint(5) unsigned NOT NULL DEFAULT '0',
  `diff` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revision` varchar(255) NOT NULL DEFAULT 'Skyfire',
  PRIMARY KEY (`online`,`diff`,`uptime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `icore_stat` */

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `logs` */

/*Table structure for table `mute_active` */

DROP TABLE IF EXISTS `mute_active`;

CREATE TABLE `mute_active` (
  `realmid` tinyint(3) NOT NULL,
  `account` int(11) NOT NULL,
  `mute_id` int(11) NOT NULL,
  `mute_timer` int(11) NOT NULL,
  PRIMARY KEY (`realmid`,`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mute_active` */

/*Table structure for table `pay_history` */

DROP TABLE IF EXISTS `pay_history`;

CREATE TABLE `pay_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(255) DEFAULT NULL,
  `synType` varchar(16) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `time` varchar(32) DEFAULT NULL,
  `cpparam` varchar(256) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='not used, don''t know how to make payment work.';

/*Data for the table `pay_history` */

/*Table structure for table `project_betatesters` */

DROP TABLE IF EXISTS `project_betatesters`;

CREATE TABLE `project_betatesters` (
  `id` int(11) NOT NULL,
  `betatest_id` int(11) NOT NULL,
  `member_id` mediumint(8) NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk__project_betatesters__members1_idx` (`member_id`) USING BTREE,
  KEY `fk__project_betatesters__account1_idx` (`account_id`) USING BTREE,
  KEY `fk__project_betatesters__project_betatests1_idx` (`betatest_id`) USING BTREE,
  KEY `fk__project_betatesters__project_betatest_accounts1_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='used for betatesting and allowing players with ids.';

/*Data for the table `project_betatesters` */

/*Table structure for table `project_member_premiums` */

DROP TABLE IF EXISTS `project_member_premiums`;

CREATE TABLE `project_member_premiums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) NOT NULL,
  `setdate` bigint(40) NOT NULL,
  `unsetdate` bigint(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk__nighthold_member_premium__members1_idx` (`member_id`) USING BTREE,
  KEY `fk__nighthold_member_premiums__nighthold_member_items1_idx` (`card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Members';

/*Data for the table `project_member_premiums` */

/*Table structure for table `project_member_rewards` */

DROP TABLE IF EXISTS `project_member_rewards`;

CREATE TABLE `project_member_rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `character_guid` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `realmid` int(10) unsigned NOT NULL,
  `source_type` tinyint(3) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  `reward_amount` int(10) unsigned NOT NULL,
  `reward_date` int(10) unsigned NOT NULL,
  `reward_day` int(10) unsigned NOT NULL COMMENT 'Used only for indexing purposes',
  `processed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `process_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id_reward_day_source_type` (`member_id`,`reward_day`,`source_type`) USING BTREE,
  KEY `idx__member_id` (`member_id`) USING BTREE,
  KEY `idx__processed` (`processed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Member Rewards';

/*Data for the table `project_member_rewards` */

/*Table structure for table `project_member_settings` */

DROP TABLE IF EXISTS `project_member_settings`;

CREATE TABLE `project_member_settings` (
  `member_id` int(10) unsigned NOT NULL,
  `setting` int(10) unsigned NOT NULL COMMENT 'nightholdMemberInfo::Setting in core',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`,`setting`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Member Settings';

/*Data for the table `project_member_settings` */

/*Table structure for table `promocodes` */

DROP TABLE IF EXISTS `promocodes`;

CREATE TABLE `promocodes` (
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Latin letters, digits and dash symbol are allowed, case insensitive',
  `realmid` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm the code can be redeemed on or -1 for any realm',
  `start_time` int(10) unsigned NOT NULL COMMENT 'Activation UNIX timestamp, 0 if always active',
  `end_time` int(10) unsigned NOT NULL COMMENT 'Expiration UNIX timestamp, 0 if never expires',
  `money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Copper',
  `items` tinytext NOT NULL COMMENT 'Format: itemid:count itemid:count ...',
  `premium` tinytext NOT NULL COMMENT 'Duration in timestring format (e.g. "30d5h42m10s")',
  `redeemed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 if the code was redeemed, 0 otherwise',
  `redeemer_guid` int(10) unsigned NOT NULL COMMENT 'Character GUID that redeemed the code',
  `redeemer_realmid` int(10) unsigned NOT NULL COMMENT 'Character''s realm',
  `redeemer_account` int(10) unsigned NOT NULL COMMENT 'Character''s account',
  `redeemer_member` int(10) unsigned NOT NULL COMMENT 'Character''s nighthold member',
  PRIMARY KEY (`code`) USING BTREE,
  KEY `realmid` (`realmid`) USING BTREE,
  KEY `redeemed` (`redeemed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='used for custom\r\ntodo: make this implement into blizzcms';

/*Data for the table `promocodes` */

/*Table structure for table `promotion_auras` */

DROP TABLE IF EXISTS `promotion_auras`;

CREATE TABLE `promotion_auras` (
  `entry` int(11) unsigned NOT NULL,
  `start_date` int(11) unsigned NOT NULL,
  `lenght` int(11) unsigned NOT NULL COMMENT 'Lenght in minutes',
  `active` tinyint(1) unsigned NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `promotion_auras` */

/*Table structure for table `rbac_account_groups` */

DROP TABLE IF EXISTS `rbac_account_groups`;

CREATE TABLE `rbac_account_groups` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `groupId` int(10) unsigned NOT NULL COMMENT 'Group id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`groupId`,`realmId`) USING BTREE,
  KEY `fk__rbac_account_groups__rbac_groups` (`groupId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Account-Group relation';

/*Data for the table `rbac_account_groups` */

/*Table structure for table `rbac_account_permissions` */

DROP TABLE IF EXISTS `rbac_account_permissions`;

CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`) USING BTREE,
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Account-Permission relation';

/*Data for the table `rbac_account_permissions` */

/*Table structure for table `realm_classes` */

DROP TABLE IF EXISTS `realm_classes`;

CREATE TABLE `realm_classes` (
  `realmId` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL COMMENT 'Class Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for class activation',
  PRIMARY KEY (`realmId`,`class`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `realm_classes` */

insert  into `realm_classes`(`realmId`,`class`,`expansion`) values 
(1,1,0),
(1,2,0),
(1,3,0),
(1,4,0),
(1,5,0),
(1,6,2),
(1,7,0),
(1,8,0),
(1,9,0),
(1,10,4),
(1,11,0);

/*Table structure for table `realm_diff_stats` */

DROP TABLE IF EXISTS `realm_diff_stats`;

CREATE TABLE `realm_diff_stats` (
  `realm_id` tinyint(3) unsigned NOT NULL,
  `diff` mediumint(8) unsigned DEFAULT NULL,
  `min` mediumint(8) unsigned DEFAULT NULL,
  `max` mediumint(8) unsigned DEFAULT NULL,
  `unixtime` int(10) NOT NULL,
  PRIMARY KEY (`realm_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `realm_diff_stats` */

insert  into `realm_diff_stats`(`realm_id`,`diff`,`min`,`max`,`unixtime`) values 
(1,25,1,435,1651377448),
(2,25,1,242,1649002769),
(3,25,3,187,1648434843);

/*Table structure for table `realm_races` */

DROP TABLE IF EXISTS `realm_races`;

CREATE TABLE `realm_races` (
  `realmId` int(11) NOT NULL,
  `race` tinyint(4) NOT NULL COMMENT 'Race Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for race activation',
  PRIMARY KEY (`realmId`,`race`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `realm_races` */

insert  into `realm_races`(`realmId`,`race`,`expansion`) values 
(1,1,0),
(1,2,0),
(1,3,0),
(1,4,0),
(1,5,0),
(1,6,0),
(1,7,0),
(1,8,0),
(1,9,3),
(1,10,1),
(1,11,1),
(1,22,3),
(1,24,4),
(1,25,4),
(1,26,4);

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`) USING BTREE,
  KEY `acctid` (`acctid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='How many characters accounts have';

/*Data for the table `realmcharacters` */

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `project_shortname` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `color` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(11) unsigned NOT NULL DEFAULT '12340',
  `flag` int(11) DEFAULT NULL,
  `project_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `project_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `project_dbname` varchar(32) NOT NULL,
  `project_dbworld` varchar(32) NOT NULL,
  `project_dbarchive` varchar(32) NOT NULL,
  `project_rates_min` tinyint(4) NOT NULL COMMENT 'project',
  `project_rates_max` tinyint(4) NOT NULL COMMENT 'project',
  `project_transfer_level_max` tinyint(4) NOT NULL DEFAULT '80',
  `project_transfer_items` enum('IGNORE','IMPORT','REPLACE','SELECT') NOT NULL DEFAULT 'IGNORE',
  `project_transfer_skills_spells` enum('IGNORE','IMPORT','REPLACE','SELECT') NOT NULL DEFAULT 'IGNORE',
  `project_transfer_glyphs` enum('IGNORE','IMPORT') NOT NULL DEFAULT 'IGNORE',
  `project_transfer_achievements` enum('IGNORE','IMPORT') NOT NULL DEFAULT 'IGNORE',
  `project_server_same` tinyint(1) NOT NULL DEFAULT '0',
  `project_server_settings` varchar(32) NOT NULL,
  `project_server_remote_path` varchar(255) NOT NULL,
  `project_accounts_detach` tinyint(1) NOT NULL DEFAULT '1',
  `project_setskills_value_max` smallint(6) NOT NULL DEFAULT '0',
  `project_chat_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `project_statistics_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';

/*Data for the table `realmlist` */

insert  into `realmlist`(`id`,`name`,`project_shortname`,`address`,`port`,`icon`,`color`,`timezone`,`allowedSecurityLevel`,`population`,`gamebuild`,`flag`,`project_hidden`,`project_enabled`,`project_dbname`,`project_dbworld`,`project_dbarchive`,`project_rates_min`,`project_rates_max`,`project_transfer_level_max`,`project_transfer_items`,`project_transfer_skills_spells`,`project_transfer_glyphs`,`project_transfer_achievements`,`project_server_same`,`project_server_settings`,`project_server_remote_path`,`project_accounts_detach`,`project_setskills_value_max`,`project_chat_enabled`,`project_statistics_enabled`) values 
(1,'Eternity Server','EternityCore','127.0.0.1',8085,0,2,10,0,0,18414,32,0,1,'eternity_chars','eternity_world','eternity_archive',0,0,80,'IGNORE','IGNORE','IGNORE','IGNORE',0,'0','0',1,0,0,0);

/*Table structure for table `realmlist_proxy` */

DROP TABLE IF EXISTS `realmlist_proxy`;

CREATE TABLE `realmlist_proxy` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Must be different from `realmlist`.`name`, otherwise will override original realm''s address and port',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `realmlist_proxy` */

/*Table structure for table `sql_update` */

DROP TABLE IF EXISTS `sql_update`;

CREATE TABLE `sql_update` (
  `file` varchar(50) CHARACTER SET latin1 NOT NULL,
  `realmid` tinyint(4) NOT NULL DEFAULT '-1',
  `date` datetime DEFAULT NULL,
  `result` longtext,
  PRIMARY KEY (`file`,`realmid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sql_update` */

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'SkyFire',
  PRIMARY KEY (`realmid`,`starttime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

/*Data for the table `uptime` */

insert  into `uptime`(`realmid`,`starttime`,`uptime`,`maxplayers`,`revision`) values 
(1,1647557652,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647561353,1200,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647595452,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647595589,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647603285,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647708553,1203,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647791288,2402,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647794187,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647804660,602,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647806320,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647820797,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647877190,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647877400,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647877783,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647878465,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647879230,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647879353,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647881048,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647882306,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1647883033,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: Archive (Win64, little-endian)'),
(1,1647885646,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: Archive (Win64, little-endian)'),
(1,1648074445,8400,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648082899,3600,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648086699,15601,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648102844,29402,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648132818,3001,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648136358,1200,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648137844,14401,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648153189,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648154861,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648155101,600,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648155969,1200,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648157710,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648158328,13800,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648172659,601,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648173795,601,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648174881,601,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648175775,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648176101,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648176657,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648176748,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648176913,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648177125,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648177432,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648177628,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648177893,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648178078,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648178368,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648178701,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648179102,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648179255,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648179620,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648180758,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648180911,6001,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648187274,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648187854,42602,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648230749,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648231109,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648231267,87006,7,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648319326,602,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648320649,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648321015,9601,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648330940,1802,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648333332,7801,6,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648342722,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648343285,4801,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648348663,600,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648349792,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648350242,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648350769,1200,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648352216,1200,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648353685,3001,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648357229,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648357877,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648358586,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648358909,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648359348,601,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648360289,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648360428,48003,9,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648409485,1802,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648411911,22803,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648435047,65403,8,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648500891,16203,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648518346,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648518798,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648519431,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648519679,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648519883,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648520030,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648520621,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648520729,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648520805,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648521130,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648521255,2400,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648523758,5400,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529370,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529655,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529727,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529797,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529881,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529936,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648529993,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648530138,601,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648531073,43203,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648574885,13203,6,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648588589,23404,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648612461,70806,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648683593,1803,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648696928,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648697520,67803,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648765966,4803,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648770979,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648771065,1801,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648773502,79204,6,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648855007,12004,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648867476,39602,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648907777,52206,7,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1648960583,45006,10,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649006344,37204,10,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649044028,69006,9,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649114636,1201,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649115929,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649116107,1201,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649117887,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649118042,71461,11,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649192107,67201,8,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649260070,25801,14,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649292860,76801,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649377988,63602,10,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649444432,55202,10,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649502858,24602,14,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649530157,18001,9,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649548558,67201,10,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649620021,5403,6,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649626316,78002,13,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649711313,73802,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649788672,57010,9,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649849050,85202,16,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649936091,24001,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1649970271,56408,7,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650032150,103230,16,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650144281,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650144462,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650144996,7201,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650152556,4800,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650157786,85804,13,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650244164,3004,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650248416,147010,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650395680,603,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650396715,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650396874,10801,8,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650408081,2400,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650410796,1800,2,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650412912,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650413288,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650413501,2401,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650416690,1200,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650418501,600,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650419397,38401,8,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650458316,43805,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650503734,1803,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650506004,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650506552,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650506729,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650507111,6601,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650515131,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650515586,2400,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650518226,67203,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650586381,603,4,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650587523,4200,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650592155,3001,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650596062,212409,17,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650809055,43204,18,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650852463,601,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650853222,1200,3,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650854508,72604,12,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1650928447,9003,5,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1650937825,111005,15,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1651050963,27604,8,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1651078868,0,0,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1651079160,0,0,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1651079237,28202,13,'Pandaria 5.4.8 Rev: 0 RelWithDebInfo Hash: DreamEternity (Win64, little-endian)'),
(1,1651108883,1202,5,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651110469,76207,17,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651186940,15003,8,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651202493,63605,13,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651269071,9604,9,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651279305,66603,17,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(1,1651346246,31202,14,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648435152,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648435207,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648435381,1801,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648473080,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648474264,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648513938,3000,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648527125,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648527587,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648527747,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1648527894,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649001295,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649001434,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649001627,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649001929,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649002126,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(2,1649002229,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648426171,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648426307,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648426490,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648427383,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648428286,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648430373,600,1,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648431752,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648432402,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648432802,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648432928,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648433262,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648433629,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648434665,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)'),
(3,1648434723,0,0,'Pandaria 5.4.8 Rev: 0 Release Hash: DreamEternity (Win64, little-endian)');

/*Table structure for table `wow_token` */

DROP TABLE IF EXISTS `wow_token`;

CREATE TABLE `wow_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountId` int(11) unsigned NOT NULL,
  `characterGuid` int(10) NOT NULL DEFAULT '0',
  `realm` int(5) unsigned NOT NULL,
  `coins` int(5) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wow_token` */

insert  into `wow_token`(`id`,`accountId`,`characterGuid`,`realm`,`coins`,`date`) values 
(4,3,6,1,10,'2022-03-24 16:22:39'),
(5,3,37,1,1,'2022-03-24 22:41:12'),
(6,3,6,1,1,'2022-03-27 21:34:43'),
(7,3,6,1,10,'2022-03-27 21:35:17'),
(8,3,6,1,1,'2022-03-27 21:35:51'),
(9,4,19,1,1,'2022-03-27 22:38:32'),
(10,3,6,2,1,'2022-03-28 15:37:22'),
(11,3,116,1,1,'2022-04-03 02:14:40'),
(12,3,6,1,1,'2022-04-03 23:16:05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

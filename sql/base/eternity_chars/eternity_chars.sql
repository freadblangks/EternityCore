/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.7.37-log : Database - eternity_chars
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eternity_chars` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eternity_chars`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_achievement
-- ----------------------------
DROP TABLE IF EXISTS `account_achievement`;
CREATE TABLE `account_achievement`  (
  `account` int(10) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NOT NULL,
  `achievement` smallint(5) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `account_achievement_progress`;
CREATE TABLE `account_achievement_progress`  (
  `account` int(10) UNSIGNED NOT NULL,
  `criteria` smallint(5) UNSIGNED NOT NULL,
  `counter` bigint(20) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `criteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_battle_pet
-- ----------------------------
DROP TABLE IF EXISTS `account_battle_pet`;
CREATE TABLE `account_battle_pet`  (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `species` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `xp` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `health` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `maxHealth` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `power` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `speed` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `quality` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `breed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_battle_pet_slots
-- ----------------------------
DROP TABLE IF EXISTS `account_battle_pet_slots`;
CREATE TABLE `account_battle_pet_slots`  (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot1` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `slot2` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `slot3` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_instance_times
-- ----------------------------
DROP TABLE IF EXISTS `account_instance_times`;
CREATE TABLE `account_instance_times`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `releaseTime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`, `instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_spell
-- ----------------------------
DROP TABLE IF EXISTS `account_spell`;
CREATE TABLE `account_spell`  (
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_tutorial
-- ----------------------------
DROP TABLE IF EXISTS `account_tutorial`;
CREATE TABLE `account_tutorial`  (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `tut0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for addons
-- ----------------------------
DROP TABLE IF EXISTS `addons`;
CREATE TABLE `addons`  (
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `crc` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Addons' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for armory_character_stats
-- ----------------------------
DROP TABLE IF EXISTS `armory_character_stats`;
CREATE TABLE `armory_character_stats`  (
  `guid` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `gear_score` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `achievement_points` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `save_date` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'World of Warcraft Armory table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auctionhouse
-- ----------------------------
DROP TABLE IF EXISTS `auctionhouse`;
CREATE TABLE `auctionhouse`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auctioneerguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemowner` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buyoutprice` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buyguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastbid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `startbid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deposit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_guid`(`itemguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banned_addons
-- ----------------------------
DROP TABLE IF EXISTS `banned_addons`;
CREATE TABLE `banned_addons`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `idx_name_ver`(`Name`, `Version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blackmarket_auctions
-- ----------------------------
DROP TABLE IF EXISTS `blackmarket_auctions`;
CREATE TABLE `blackmarket_auctions`  (
  `auctionId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `templateId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `startTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentBidder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentBid` bigint(10) UNSIGNED NOT NULL DEFAULT 0,
  `minIncrement` bigint(10) UNSIGNED NOT NULL DEFAULT 0,
  `numBids` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`auctionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bugreport
-- ----------------------------
DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE `bugreport`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Debug System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for calendar_events
-- ----------------------------
DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE `calendar_events`  (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `creator` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 4,
  `dungeon` int(10) NOT NULL DEFAULT -1,
  `eventtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for calendar_invites
-- ----------------------------
DROP TABLE IF EXISTS `calendar_invites`;
CREATE TABLE `calendar_invites`  (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `event` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `invitee` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `statustime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team` int(10) UNSIGNED NOT NULL,
  `announce` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `ownership` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bannedList` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lastUsed` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`name`, `team`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Channel System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_account_data
-- ----------------------------
DROP TABLE IF EXISTS `character_account_data`;
CREATE TABLE `character_account_data`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_achievement
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement`;
CREATE TABLE `character_achievement`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `achievement` smallint(5) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement_progress`;
CREATE TABLE `character_achievement_progress`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `criteria` smallint(5) UNSIGNED NOT NULL,
  `counter` bigint(20) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `criteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_action
-- ----------------------------
DROP TABLE IF EXISTS `character_action`;
CREATE TABLE `character_action`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `button` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `action` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spec`, `button`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_arena_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_arena_stats`;
CREATE TABLE `character_arena_stats`  (
  `guid` int(10) NOT NULL,
  `slot` tinyint(3) NOT NULL,
  `matchMakerRating` smallint(5) NOT NULL,
  PRIMARY KEY (`guid`, `slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_aura
-- ----------------------------
DROP TABLE IF EXISTS `character_aura`;
CREATE TABLE `character_aura`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `caster_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Full Global Unique Identifier',
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `effect_mask` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recalculate_mask` int(10) UNSIGNED NULL DEFAULT 0,
  `stackcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `remaincharges` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `caster_guid`, `item_guid`, `spell`, `effect_mask`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_aura_effect
-- ----------------------------
DROP TABLE IF EXISTS `character_aura_effect`;
CREATE TABLE `character_aura_effect`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `effect` tinyint(3) UNSIGNED NOT NULL,
  `base_amount` int(10) NOT NULL DEFAULT 0,
  `amount` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `slot`, `effect`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_banned
-- ----------------------------
DROP TABLE IF EXISTS `character_banned`;
CREATE TABLE `character_banned`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`guid`, `bandate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ban List' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_battleground_data
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_data`;
CREATE TABLE `character_battleground_data`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `instanceId` int(10) UNSIGNED NOT NULL COMMENT 'Instance Identifier',
  `team` smallint(5) UNSIGNED NOT NULL,
  `joinX` float NOT NULL DEFAULT 0,
  `joinY` float NOT NULL DEFAULT 0,
  `joinZ` float NOT NULL DEFAULT 0,
  `joinO` float NOT NULL DEFAULT 0,
  `joinMapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `taxiStart` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taxiEnd` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taxiPathPoint` smallint(5) UNSIGNED NOT NULL,
  `mountSpell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_battleground_random
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_battleground_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_stats`;
CREATE TABLE `character_battleground_stats`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `total_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_wins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_battleground_weekend
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_weekend`;
CREATE TABLE `character_battleground_weekend`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_bonus_roll
-- ----------------------------
DROP TABLE IF EXISTS `character_bonus_roll`;
CREATE TABLE `character_bonus_roll`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `bonus_chance` float NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_completed_challenges
-- ----------------------------
DROP TABLE IF EXISTS `character_completed_challenges`;
CREATE TABLE `character_completed_challenges`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `map` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `best_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `best_medal` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `best_medal_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `map`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_cuf_profiles
-- ----------------------------
DROP TABLE IF EXISTS `character_cuf_profiles`;
CREATE TABLE `character_cuf_profiles`  (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'Character Guid',
  `id` tinyint(3) UNSIGNED NOT NULL COMMENT 'Profile Id (0-4)',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Profile Name',
  `frameHeight` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Frame Height',
  `frameWidth` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Frame Width',
  `sortBy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Frame Sort By',
  `healthText` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Frame Health Text',
  `boolOptions` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Many Configurable Bool Options',
  `unk146` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8',
  `unk147` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8',
  `unk148` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8',
  `unk150` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16',
  `unk152` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16',
  `unk154` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16',
  PRIMARY KEY (`guid`, `id`) USING BTREE,
  INDEX `index`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_currency
-- ----------------------------
DROP TABLE IF EXISTS `character_currency`;
CREATE TABLE `character_currency`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `currency` smallint(5) UNSIGNED NOT NULL,
  `total_count` int(10) UNSIGNED NOT NULL,
  `week_count` int(10) UNSIGNED NOT NULL,
  `season_count` int(10) UNSIGNED NOT NULL,
  `flags` int(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `currency`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_declinedname
-- ----------------------------
DROP TABLE IF EXISTS `character_declinedname`;
CREATE TABLE `character_declinedname`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dative` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accusative` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `instrumental` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `prepositional` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_deserter
-- ----------------------------
DROP TABLE IF EXISTS `character_deserter`;
CREATE TABLE `character_deserter`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deserter_mod` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `last_deserter_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_equipmentsets
-- ----------------------------
DROP TABLE IF EXISTS `character_equipmentsets`;
CREATE TABLE `character_equipmentsets`  (
  `guid` int(10) NOT NULL DEFAULT 0,
  `setguid` bigint(20) NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iconname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ignore_mask` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item0` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item13` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item14` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item15` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item16` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item17` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `item18` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`setguid`) USING BTREE,
  UNIQUE INDEX `idx_set`(`guid`, `setguid`, `setindex`) USING BTREE,
  INDEX `Idx_setindex`(`setindex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_gifts
-- ----------------------------
DROP TABLE IF EXISTS `character_gifts`;
CREATE TABLE `character_gifts`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_glyphs
-- ----------------------------
DROP TABLE IF EXISTS `character_glyphs`;
CREATE TABLE `character_glyphs`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `glyph1` smallint(5) UNSIGNED NULL DEFAULT 0,
  `glyph2` smallint(5) UNSIGNED NULL DEFAULT 0,
  `glyph3` smallint(5) UNSIGNED NULL DEFAULT 0,
  `glyph4` smallint(5) UNSIGNED NULL DEFAULT 0,
  `glyph5` smallint(5) UNSIGNED NULL DEFAULT 0,
  `glyph6` smallint(5) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spec`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_homebind
-- ----------------------------
DROP TABLE IF EXISTS `character_homebind`;
CREATE TABLE `character_homebind`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `zoneId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_instance
-- ----------------------------
DROP TABLE IF EXISTS `character_instance`;
CREATE TABLE `character_instance`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `instance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `instance`) USING BTREE,
  INDEX `instance`(`instance`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_inventory
-- ----------------------------
DROP TABLE IF EXISTS `character_inventory`;
CREATE TABLE `character_inventory`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `bag` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `item` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`) USING BTREE,
  UNIQUE INDEX `guid`(`guid`, `bag`, `slot`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_loot_lockout
-- ----------------------------
DROP TABLE IF EXISTS `character_loot_lockout`;
CREATE TABLE `character_loot_lockout`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character GUID',
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Looted object entry',
  `difficulty` int(10) UNSIGNED NOT NULL DEFAULT 7,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for character_pet
-- ----------------------------
DROP TABLE IF EXISTS `character_pet`;
CREATE TABLE `character_pet`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modelid` int(10) UNSIGNED NULL DEFAULT 0,
  `CreatedBySpell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `PetType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Reactstate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Pet',
  `renamed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `curhealth` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `curmana` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `savetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `abdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `specialization` smallint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner`) USING BTREE,
  INDEX `idx_slot`(`slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pet System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_pet_current
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_current`;
CREATE TABLE `character_pet_current`  (
  `owner` int(10) UNSIGNED NOT NULL,
  `pet_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_pet_declinedname
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_declinedname`;
CREATE TABLE `character_pet_declinedname`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `genitive` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_key`(`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus`;
CREATE TABLE `character_queststatus`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `explored` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `timer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_daily
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_daily`;
CREATE TABLE `character_queststatus_daily`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_monthly
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_monthly`;
CREATE TABLE `character_queststatus_monthly`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_objective
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_objective`;
CREATE TABLE `character_queststatus_objective`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `objectiveId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`objectiveId`, `guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_rewarded
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_rewarded`;
CREATE TABLE `character_queststatus_rewarded`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `active` tinyint(10) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`guid`, `quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_seasonal
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_seasonal`;
CREATE TABLE `character_queststatus_seasonal`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `event` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_queststatus_weekly
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_weekly`;
CREATE TABLE `character_queststatus_weekly`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_reputation
-- ----------------------------
DROP TABLE IF EXISTS `character_reputation`;
CREATE TABLE `character_reputation`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `standing` float NOT NULL DEFAULT 0,
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `faction`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_research_digsites
-- ----------------------------
DROP TABLE IF EXISTS `character_research_digsites`;
CREATE TABLE `character_research_digsites`  (
  `guid` int(11) NOT NULL COMMENT 'Global Unique Identifier',
  `digsiteId` int(11) NOT NULL,
  `currentFindGUID` int(11) NOT NULL DEFAULT 0,
  `remainingFindCount` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `digsiteId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_research_history
-- ----------------------------
DROP TABLE IF EXISTS `character_research_history`;
CREATE TABLE `character_research_history`  (
  `guid` int(11) NOT NULL COMMENT 'Global Unique Identifier',
  `projectId` int(11) NOT NULL,
  `researchCount` int(11) NOT NULL,
  `firstResearchTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`guid`, `projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_research_projects
-- ----------------------------
DROP TABLE IF EXISTS `character_research_projects`;
CREATE TABLE `character_research_projects`  (
  `guid` int(11) NOT NULL COMMENT 'Global Unique Identifier',
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`guid`, `projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_service
-- ----------------------------
DROP TABLE IF EXISTS `character_service`;
CREATE TABLE `character_service`  (
  `id` int(11) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `service` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creation_date` int(11) UNSIGNED NOT NULL,
  `execution_date` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills`  (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint(5) UNSIGNED NOT NULL,
  `value` smallint(5) UNSIGNED NOT NULL,
  `max` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `skill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_social
-- ----------------------------
DROP TABLE IF EXISTS `character_social`;
CREATE TABLE `character_social`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `friend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Friend Flags',
  `note` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`, `friend`, `flags`) USING BTREE,
  INDEX `friend`(`friend`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_spell
-- ----------------------------
DROP TABLE IF EXISTS `character_spell`;
CREATE TABLE `character_spell`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_spell_charges
-- ----------------------------
DROP TABLE IF EXISTS `character_spell_charges`;
CREATE TABLE `character_spell_charges`  (
  `guid` int(11) UNSIGNED NOT NULL,
  `category` int(11) UNSIGNED NOT NULL,
  `reset_time` bigint(20) UNSIGNED NOT NULL,
  `used_charges` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_spell_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `character_spell_cooldown`;
CREATE TABLE `character_spell_cooldown`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `item` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Item Identifier',
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_end` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE `character_stats`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `strength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agility` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stamina` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `intellect` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spirit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `armor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resHoly` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resFire` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resNature` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resFrost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resShadow` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resArcane` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `blockPct` float UNSIGNED NOT NULL DEFAULT 0,
  `dodgePct` float UNSIGNED NOT NULL DEFAULT 0,
  `parryPct` float UNSIGNED NOT NULL DEFAULT 0,
  `critPct` float UNSIGNED NOT NULL DEFAULT 0,
  `rangedCritPct` float UNSIGNED NOT NULL DEFAULT 0,
  `spellCritPct` float UNSIGNED NOT NULL DEFAULT 0,
  `attackPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rangedAttackPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spellPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resilience` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_talent
-- ----------------------------
DROP TABLE IF EXISTS `character_talent`;
CREATE TABLE `character_talent`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `spell` mediumint(8) UNSIGNED NOT NULL,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`, `spec`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_void_storage
-- ----------------------------
DROP TABLE IF EXISTS `character_void_storage`;
CREATE TABLE `character_void_storage`  (
  `itemId` bigint(20) UNSIGNED NOT NULL,
  `playerGuid` int(10) UNSIGNED NOT NULL,
  `itemEntry` mediumint(8) UNSIGNED NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `creatorGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `randomProperty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suffixFactor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `upgradeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemId`) USING BTREE,
  UNIQUE INDEX `idx_player_slot`(`playerGuid`, `slot`) USING BTREE,
  INDEX `idx_player`(`playerGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `playerBytes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerBytes2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerFlags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `instance_mode_mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `taximask` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `cinematic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `totaltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `leveltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `logout_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_logout_resting` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rest_bonus` float NOT NULL DEFAULT 0,
  `resettalents_cost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resettalents_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `talentTree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0 0',
  `trans_x` float NOT NULL DEFAULT 0,
  `trans_y` float NOT NULL DEFAULT 0,
  `trans_z` float NOT NULL DEFAULT 0,
  `trans_o` float NOT NULL DEFAULT 0,
  `transguid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `extra_flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `stable_slots` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `at_login` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `zone` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `death_expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taxi_path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `totalKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `todayKills` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `yesterdayKills` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `chosenTitle` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `watchedFaction` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `drunk` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `health` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `power1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `power2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `power3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `power4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `power5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `latency` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `speccount` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `activespec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `exploredZones` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `equipmentCache` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `knownTitles` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `actionBars` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `grantableLevels` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deleteInfos_Account` int(10) UNSIGNED NULL DEFAULT NULL,
  `deleteInfos_Name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleteDate` int(10) UNSIGNED NULL DEFAULT NULL,
  `lootspec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `project_transfer` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_original_cloned` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_original_migrated` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_original_realm_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_original_guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_clone_created` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_clone_realm_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_clone_guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_migrant_created` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_migrant_realm_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `project_migrant_guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `last_login` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `taxi_path_point` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_online`(`online`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for corpse
-- ----------------------------
DROP TABLE IF EXISTS `corpse`;
CREATE TABLE `corpse`  (
  `corpseGuid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `phaseMask` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `displayId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemCache` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bytes1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bytes2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dynFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `corpseType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`corpseGuid`) USING BTREE,
  INDEX `idx_type`(`corpseType`) USING BTREE,
  INDEX `idx_instance`(`instanceId`) USING BTREE,
  INDEX `idx_player`(`guid`) USING BTREE,
  INDEX `idx_time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Death System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for creature_respawn
-- ----------------------------
DROP TABLE IF EXISTS `creature_respawn`;
CREATE TABLE `creature_respawn`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `respawnTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`, `instanceId`) USING BTREE,
  INDEX `idx_instance`(`instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Grid Loading System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_solocraft_character_stats
-- ----------------------------
DROP TABLE IF EXISTS `custom_solocraft_character_stats`;
CREATE TABLE `custom_solocraft_character_stats`  (
  `GUID` int(10) UNSIGNED NOT NULL,
  `Difficulty` float NOT NULL,
  `GroupSize` int(11) NOT NULL,
  `SpellPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Stats` float NOT NULL DEFAULT 100,
  PRIMARY KEY (`GUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_transmogrification
-- ----------------------------
DROP TABLE IF EXISTS `custom_transmogrification`;
CREATE TABLE `custom_transmogrification`  (
  `GUID` int(10) UNSIGNED NOT NULL COMMENT 'Item guidLow',
  `FakeEntry` int(10) UNSIGNED NOT NULL COMMENT 'Item entry',
  `Owner` int(10) UNSIGNED NOT NULL COMMENT 'Player guidLow',
  PRIMARY KEY (`GUID`) USING BTREE,
  INDEX `Owner`(`Owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'don\'t work just yet.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_transmogrification_sets
-- ----------------------------
DROP TABLE IF EXISTS `custom_transmogrification_sets`;
CREATE TABLE `custom_transmogrification_sets`  (
  `Owner` int(10) UNSIGNED NOT NULL COMMENT 'Player guidlow',
  `PresetID` tinyint(3) UNSIGNED NOT NULL COMMENT 'Preset identifier',
  `SetName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SetName',
  `SetData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Slot1 Entry1 Slot2 Entry2',
  PRIMARY KEY (`Owner`, `PresetID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '6_1' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for daily_players_reports
-- ----------------------------
DROP TABLE IF EXISTS `daily_players_reports`;
CREATE TABLE `daily_players_reports`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creation_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `average` float NOT NULL DEFAULT 0,
  `total_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `fly_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `jump_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `waterwalk_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `teleportplane_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `climb_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for executed_services
-- ----------------------------
DROP TABLE IF EXISTS `executed_services`;
CREATE TABLE `executed_services`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('rename','change_acc','customize','change_race','change_class','change_prof','char_restore','guild_rename','unban','level_down','marketplace','transfer','boost','item_restore','boost_profession','boost_profession_small') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `guid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '(player or guild)',
  `old_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `new_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `execute_date` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fake_items
-- ----------------------------
DROP TABLE IF EXISTS `fake_items`;
CREATE TABLE `fake_items`  (
  `guid` int(11) NOT NULL,
  `fakeEntry` int(11) NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for game_event_condition_save
-- ----------------------------
DROP TABLE IF EXISTS `game_event_condition_save`;
CREATE TABLE `game_event_condition_save`  (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `done` float NULL DEFAULT 0,
  PRIMARY KEY (`eventEntry`, `condition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for game_event_save
-- ----------------------------
DROP TABLE IF EXISTS `game_event_save`;
CREATE TABLE `game_event_save`  (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `next_start` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventEntry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gameobject_respawn
-- ----------------------------
DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `respawnTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`, `instanceId`) USING BTREE,
  INDEX `idx_instance`(`instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Grid Loading System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gm_subsurveys
-- ----------------------------
DROP TABLE IF EXISTS `gm_subsurveys`;
CREATE TABLE `gm_subsurveys`  (
  `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subsurveyId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`surveyId`, `subsurveyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gm_surveys
-- ----------------------------
DROP TABLE IF EXISTS `gm_surveys`;
CREATE TABLE `gm_surveys`  (
  `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mainSurvey` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `overallComment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`surveyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gm_tickets
-- ----------------------------
DROP TABLE IF EXISTS `gm_tickets`;
CREATE TABLE `gm_tickets`  (
  `ticketId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Name of ticket creator',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `lastModifiedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `closedBy` int(10) NOT NULL DEFAULT 0,
  `assignedTo` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `escalated` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `viewed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `haveTicket` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_completed_challenges
-- ----------------------------
DROP TABLE IF EXISTS `group_completed_challenges`;
CREATE TABLE `group_completed_challenges`  (
  `map` int(10) UNSIGNED NOT NULL,
  `attemptId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completion_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completion_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `medal_earned` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_members` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `member_1_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_1_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_2_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_2_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_3_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_3_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_4_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_4_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_5_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_5_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`map`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_instance
-- ----------------------------
DROP TABLE IF EXISTS `group_instance`;
CREATE TABLE `group_instance`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `instance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `instance`) USING BTREE,
  INDEX `instance`(`instance`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `memberGuid` int(10) UNSIGNED NOT NULL,
  `memberFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `roles` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `memberGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Groups' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `leaderGuid` int(10) UNSIGNED NOT NULL,
  `lootMethod` tinyint(3) UNSIGNED NOT NULL,
  `looterGuid` int(10) UNSIGNED NOT NULL,
  `lootThreshold` tinyint(3) UNSIGNED NOT NULL,
  `icon1` int(10) UNSIGNED NOT NULL,
  `icon2` int(10) UNSIGNED NOT NULL,
  `icon3` int(10) UNSIGNED NOT NULL,
  `icon4` int(10) UNSIGNED NOT NULL,
  `icon5` int(10) UNSIGNED NOT NULL,
  `icon6` int(10) UNSIGNED NOT NULL,
  `icon7` int(10) UNSIGNED NOT NULL,
  `icon8` int(10) UNSIGNED NOT NULL,
  `groupType` tinyint(3) UNSIGNED NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `raiddifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `leaderGuid`(`leaderGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Groups' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `leaderguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `EmblemStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `EmblemColor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `BorderStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `BorderColor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `BackgroundColor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `motd` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createdate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankMoney` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NULL DEFAULT 1,
  `experience` bigint(20) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`guildid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_achievement
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement`;
CREATE TABLE `guild_achievement`  (
  `guildId` int(10) UNSIGNED NOT NULL,
  `achievement` smallint(5) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guildId`, `achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement_progress`;
CREATE TABLE `guild_achievement_progress`  (
  `guildId` int(10) UNSIGNED NOT NULL,
  `criteria` smallint(5) UNSIGNED NOT NULL,
  `counter` bigint(20) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completedGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildId`, `criteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_bank_eventlog
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild Identificator',
  `LogGuid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event type',
  `PlayerGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemOrMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ItemStackCount` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `DestTabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Destination Tab Id',
  `TimeStamp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`, `LogGuid`, `TabId`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE,
  INDEX `Idx_PlayerGuid`(`PlayerGuid`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_bank_item
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `SlotId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`, `TabId`, `SlotId`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE,
  INDEX `Idx_item_guid`(`item_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_bank_right
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gbright` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `SlotPerDay` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`, `TabId`, `rid`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_bank_tab
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `TabName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TabIcon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TabText` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guildid`, `TabId`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_challenges
-- ----------------------------
DROP TABLE IF EXISTS `guild_challenges`;
CREATE TABLE `guild_challenges`  (
  `guild_id` int(11) UNSIGNED NOT NULL,
  `dungeon` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `raid` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rated_bg` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `scenario` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dungeon_challenge` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_completed_challenges
-- ----------------------------
DROP TABLE IF EXISTS `guild_completed_challenges`;
CREATE TABLE `guild_completed_challenges`  (
  `map` int(10) UNSIGNED NOT NULL,
  `guildId` int(10) UNSIGNED NOT NULL,
  `attemptId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completion_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completion_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `medal_earned` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `guild_members` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `member_1_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_1_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_2_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_2_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_3_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_3_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_4_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_4_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_5_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_5_spec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`map`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_eventlog
-- ----------------------------
DROP TABLE IF EXISTS `guild_eventlog`;
CREATE TABLE `guild_eventlog`  (
  `guildid` int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(10) UNSIGNED NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(3) UNSIGNED NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(10) UNSIGNED NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(10) UNSIGNED NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(3) UNSIGNED NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int(10) UNSIGNED NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`, `LogGuid`) USING BTREE,
  INDEX `Idx_PlayerGuid1`(`PlayerGuid1`) USING BTREE,
  INDEX `Idx_PlayerGuid2`(`PlayerGuid2`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild Eventlog' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_finder_applicant
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_applicant`;
CREATE TABLE `guild_finder_applicant`  (
  `guildId` int(10) UNSIGNED NULL DEFAULT NULL,
  `playerGuid` int(10) UNSIGNED NULL DEFAULT NULL,
  `availability` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `classRole` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `interests` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submitTime` int(10) UNSIGNED NULL DEFAULT NULL,
  UNIQUE INDEX `guildId`(`guildId`, `playerGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_finder_guild_settings
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_guild_settings`;
CREATE TABLE `guild_finder_guild_settings`  (
  `guildId` int(10) UNSIGNED NOT NULL,
  `availability` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `classRoles` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `interests` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `listed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guildId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_member
-- ----------------------------
DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE `guild_member`  (
  `guildid` int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
  `guid` int(10) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `pnote` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `offnote` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `achievement_points` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `first_prof_skill` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `first_prof_value` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `first_prof_rank` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `first_prof_recipes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `second_prof_skill` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `second_prof_value` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `second_prof_rank` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `second_prof_recipes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  UNIQUE INDEX `guid_key`(`guid`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE,
  INDEX `guildid_rank_key`(`guildid`, `rank`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_member_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `guild_member_withdraw`;
CREATE TABLE `guild_member_withdraw`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `tab0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tab7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild Member Daily Withdraws' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_newslog
-- ----------------------------
DROP TABLE IF EXISTS `guild_newslog`;
CREATE TABLE `guild_newslog`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild Identificator',
  `LogGuid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event type',
  `PlayerGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TimeStamp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`, `LogGuid`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE,
  INDEX `Idx_PlayerGuid`(`PlayerGuid`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_rank
-- ----------------------------
DROP TABLE IF EXISTS `guild_rank`;
CREATE TABLE `guild_rank`  (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rindex` tinyint(3) UNSIGNED NOT NULL,
  `rid` tinyint(3) UNSIGNED NOT NULL,
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rights` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `BankMoneyPerDay` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`, `rid`) USING BTREE,
  INDEX `Idx_rid`(`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_reputation
-- ----------------------------
DROP TABLE IF EXISTS `guild_reputation`;
CREATE TABLE `guild_reputation`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `guild` int(10) UNSIGNED NOT NULL,
  `reputation` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `resettime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lfg` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `completedEncounters` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`map`) USING BTREE,
  INDEX `resettime`(`resettime`) USING BTREE,
  INDEX `difficulty`(`difficulty`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instance_reset
-- ----------------------------
DROP TABLE IF EXISTS `instance_reset`;
CREATE TABLE `instance_reset`  (
  `mapid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `resettime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`mapid`, `difficulty`) USING BTREE,
  INDEX `difficulty`(`difficulty`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_deleted
-- ----------------------------
DROP TABLE IF EXISTS `item_deleted`;
CREATE TABLE `item_deleted`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_guid` int(11) NOT NULL,
  `old_item_guid` int(11) NOT NULL,
  `item_entry` int(11) NOT NULL,
  `item_count` int(11) NOT NULL,
  `delete_date` int(11) NOT NULL,
  `delete_type` int(11) NOT NULL,
  `restored` tinyint(1) NOT NULL DEFAULT 0,
  `restore_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_guid_old_item_guid`(`owner_guid`, `old_item_guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4267 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_instance
-- ----------------------------
DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemEntry` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `owner_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creatorGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `giftCreatorGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `duration` int(10) NOT NULL DEFAULT 0,
  `charges` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flags` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `enchantments` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `randomPropertyId` smallint(5) NOT NULL DEFAULT 0,
  `reforgeID` int(10) NOT NULL DEFAULT 0,
  `transmogrifyId` int(10) NOT NULL DEFAULT 0,
  `upgradeID` int(10) NOT NULL DEFAULT 0,
  `durability` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `playedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pet_species` int(11) UNSIGNED NOT NULL,
  `pet_breed` int(11) UNSIGNED NOT NULL,
  `pet_quality` int(11) UNSIGNED NOT NULL,
  `pet_level` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `idx_owner_guid`(`owner_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_loot_items
-- ----------------------------
DROP TABLE IF EXISTS `item_loot_items`;
CREATE TABLE `item_loot_items`  (
  `container_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'guid of container (item_instance.guid)',
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int(10) NOT NULL DEFAULT 0 COMMENT 'stack size',
  `follow_rules` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT 0,
  `counted` tinyint(1) NOT NULL DEFAULT 0,
  `under_threshold` tinyint(1) NOT NULL DEFAULT 0,
  `needs_quest` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'quest drop',
  `rnd_prop` int(10) NOT NULL DEFAULT 0 COMMENT 'random enchantment added when originally rolled',
  `rnd_suffix` int(10) NOT NULL DEFAULT 0 COMMENT 'random suffix added when originally rolled'
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_loot_money
-- ----------------------------
DROP TABLE IF EXISTS `item_loot_money`;
CREATE TABLE `item_loot_money`  (
  `container_id` int(10) NOT NULL DEFAULT 0 COMMENT 'guid of container (item_instance.guid)',
  `money` int(10) NOT NULL DEFAULT 0 COMMENT 'money loot (in copper)'
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_refund_instance
-- ----------------------------
DROP TABLE IF EXISTS `item_refund_instance`;
CREATE TABLE `item_refund_instance`  (
  `item_guid` int(10) UNSIGNED NOT NULL COMMENT 'Item GUID',
  `player_guid` int(10) UNSIGNED NOT NULL COMMENT 'Player GUID',
  `paidMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paidExtendedCost` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`, `player_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Refund System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_soulbound_trade_data
-- ----------------------------
DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data`  (
  `itemGuid` int(10) UNSIGNED NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Refund System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lag_reports
-- ----------------------------
DROP TABLE IF EXISTS `lag_reports`;
CREATE TABLE `lag_reports`  (
  `reportId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lagType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `latency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`reportId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lfg_data
-- ----------------------------
DROP TABLE IF EXISTS `lfg_data`;
CREATE TABLE `lfg_data`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `dungeon` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'LFG Data' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `messageType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stationery` tinyint(3) NOT NULL DEFAULT 41,
  `mailTemplateId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sender` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `receiver` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `subject` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `has_items` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deliver_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `cod` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `checked` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_receiver`(`receiver`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Mail System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mail_items
-- ----------------------------
DROP TABLE IF EXISTS `mail_items`;
CREATE TABLE `mail_items`  (
  `mail_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `receiver` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`) USING BTREE,
  INDEX `idx_receiver`(`receiver`) USING BTREE,
  INDEX `idx_mail_id`(`mail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pet_aura
-- ----------------------------
DROP TABLE IF EXISTS `pet_aura`;
CREATE TABLE `pet_aura`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `caster_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `effect_mask` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recalculate_mask` int(10) UNSIGNED NULL DEFAULT 0,
  `stackcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `remaincharges` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `caster_guid`, `item_guid`, `spell`, `effect_mask`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pet_aura_effect
-- ----------------------------
DROP TABLE IF EXISTS `pet_aura_effect`;
CREATE TABLE `pet_aura_effect`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `effect` tinyint(3) UNSIGNED NOT NULL,
  `base_amount` int(10) NOT NULL DEFAULT 0,
  `amount` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `slot`, `effect`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pet_spell
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell`;
CREATE TABLE `pet_spell`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pet System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pet_spell_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell_cooldown`;
CREATE TABLE `pet_spell_cooldown`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_end` bigint(20) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for petition
-- ----------------------------
DROP TABLE IF EXISTS `petition`;
CREATE TABLE `petition`  (
  `ownerguid` int(10) UNSIGNED NOT NULL,
  `petitionguid` int(10) UNSIGNED NULL DEFAULT 0,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerguid`, `type`) USING BTREE,
  UNIQUE INDEX `index_ownerguid_petitionguid`(`ownerguid`, `petitionguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for petition_sign
-- ----------------------------
DROP TABLE IF EXISTS `petition_sign`;
CREATE TABLE `petition_sign`  (
  `ownerguid` int(10) UNSIGNED NOT NULL,
  `petitionguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerguid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `player_account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`petitionguid`, `playerguid`) USING BTREE,
  INDEX `Idx_playerguid`(`playerguid`) USING BTREE,
  INDEX `Idx_ownerguid`(`ownerguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for players_reports_status
-- ----------------------------
DROP TABLE IF EXISTS `players_reports_status`;
CREATE TABLE `players_reports_status`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creation_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `average` float NOT NULL DEFAULT 0,
  `total_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `fly_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `jump_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `waterwalk_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `teleportplane_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `climb_reports` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pool_quest_save
-- ----------------------------
DROP TABLE IF EXISTS `pool_quest_save`;
CREATE TABLE `pool_quest_save`  (
  `pool_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quest_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`pool_id`, `quest_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rated_pvp_info
-- ----------------------------
DROP TABLE IF EXISTS `rated_pvp_info`;
CREATE TABLE `rated_pvp_info`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `season` smallint(5) UNSIGNED NOT NULL,
  `rank` smallint(5) UNSIGNED NULL DEFAULT 0,
  `rating` smallint(5) UNSIGNED NULL DEFAULT 0,
  `matchmaker_rating` smallint(5) UNSIGNED NULL DEFAULT 0,
  `week_best` smallint(5) UNSIGNED NULL DEFAULT 0,
  `week_games` smallint(5) UNSIGNED NULL DEFAULT 0,
  `week_wins` smallint(5) UNSIGNED NULL DEFAULT 0,
  `season_best` smallint(5) UNSIGNED NULL DEFAULT 0,
  `season_games` smallint(5) UNSIGNED NULL DEFAULT 0,
  `season_wins` smallint(5) UNSIGNED NULL DEFAULT 0,
  `last_week_best` smallint(5) UNSIGNED NULL DEFAULT 0,
  `bonus_reward` tinyint(1) NOT NULL DEFAULT 0,
  `win_streak` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `slot`, `season`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reserved_name
-- ----------------------------
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name`  (
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player Reserved Names' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket_bug
-- ----------------------------
DROP TABLE IF EXISTS `ticket_bug`;
CREATE TABLE `ticket_bug`  (
  `ticketId` int(10) UNSIGNED NOT NULL,
  `playerGuid` bigint(20) UNSIGNED NOT NULL,
  `bugNote` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticketCreateTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `closedBy` bigint(20) NOT NULL DEFAULT 0,
  `assignedTo` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ticketId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for warden_action
-- ----------------------------
DROP TABLE IF EXISTS `warden_action`;
CREATE TABLE `warden_action`  (
  `wardenId` smallint(5) UNSIGNED NOT NULL,
  `action` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`wardenId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for worldstates
-- ----------------------------
DROP TABLE IF EXISTS `worldstates`;
CREATE TABLE `worldstates`  (
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Variable Saves' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

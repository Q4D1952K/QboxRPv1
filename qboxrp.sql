-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for QboxRp
DROP DATABASE IF EXISTS `QboxRp`;
CREATE DATABASE IF NOT EXISTS `QboxRp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `QboxRp`;

-- Dumping structure for table QboxRp.bank_accounts_new
DROP TABLE IF EXISTS `bank_accounts_new`;
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  `auth` longtext DEFAULT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.bank_accounts_new: ~11 rows (approximately)
DELETE FROM `bank_accounts_new`;
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table QboxRp.bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.bans: ~0 rows (approximately)
DELETE FROM `bans`;

-- Dumping structure for table QboxRp.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.dealers: ~0 rows (approximately)
DELETE FROM `dealers`;

-- Dumping structure for table QboxRp.houselocations
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.houselocations: ~0 rows (approximately)
DELETE FROM `houselocations`;

-- Dumping structure for table QboxRp.lapraces
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.lapraces: ~0 rows (approximately)
DELETE FROM `lapraces`;

-- Dumping structure for table QboxRp.management_funds
DROP TABLE IF EXISTS `management_funds`;
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.management_funds: ~12 rows (approximately)
DELETE FROM `management_funds`;
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Dumping structure for table QboxRp.management_outfits
DROP TABLE IF EXISTS `management_outfits`;
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.management_outfits: ~0 rows (approximately)
DELETE FROM `management_outfits`;

-- Dumping structure for table QboxRp.npwd_calls
DROP TABLE IF EXISTS `npwd_calls`;
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `isAnonymous` tinyint(4) NOT NULL DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_calls: ~0 rows (approximately)
DELETE FROM `npwd_calls`;

-- Dumping structure for table QboxRp.npwd_darkchat_channels
DROP TABLE IF EXISTS `npwd_darkchat_channels`;
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table QboxRp.npwd_darkchat_channels: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_channels`;

-- Dumping structure for table QboxRp.npwd_darkchat_channel_members
DROP TABLE IF EXISTS `npwd_darkchat_channel_members`;
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table QboxRp.npwd_darkchat_channel_members: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_channel_members`;

-- Dumping structure for table QboxRp.npwd_darkchat_messages
DROP TABLE IF EXISTS `npwd_darkchat_messages`;
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table QboxRp.npwd_darkchat_messages: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_messages`;

-- Dumping structure for table QboxRp.npwd_marketplace_listings
DROP TABLE IF EXISTS `npwd_marketplace_listings`;
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_marketplace_listings: ~0 rows (approximately)
DELETE FROM `npwd_marketplace_listings`;

-- Dumping structure for table QboxRp.npwd_match_profiles
DROP TABLE IF EXISTS `npwd_match_profiles`;
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_match_profiles: ~0 rows (approximately)
DELETE FROM `npwd_match_profiles`;

-- Dumping structure for table QboxRp.npwd_match_views
DROP TABLE IF EXISTS `npwd_match_views`;
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_match_views: ~0 rows (approximately)
DELETE FROM `npwd_match_views`;

-- Dumping structure for table QboxRp.npwd_messages
DROP TABLE IF EXISTS `npwd_messages`;
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_messages: ~0 rows (approximately)
DELETE FROM `npwd_messages`;

-- Dumping structure for table QboxRp.npwd_messages_conversations
DROP TABLE IF EXISTS `npwd_messages_conversations`;
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_messages_conversations: ~0 rows (approximately)
DELETE FROM `npwd_messages_conversations`;

-- Dumping structure for table QboxRp.npwd_messages_participants
DROP TABLE IF EXISTS `npwd_messages_participants`;
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_messages_participants: ~0 rows (approximately)
DELETE FROM `npwd_messages_participants`;

-- Dumping structure for table QboxRp.npwd_notes
DROP TABLE IF EXISTS `npwd_notes`;
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_notes: ~0 rows (approximately)
DELETE FROM `npwd_notes`;

-- Dumping structure for table QboxRp.npwd_phone_contacts
DROP TABLE IF EXISTS `npwd_phone_contacts`;
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_phone_contacts: ~0 rows (approximately)
DELETE FROM `npwd_phone_contacts`;

-- Dumping structure for table QboxRp.npwd_phone_gallery
DROP TABLE IF EXISTS `npwd_phone_gallery`;
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_phone_gallery: ~0 rows (approximately)
DELETE FROM `npwd_phone_gallery`;

-- Dumping structure for table QboxRp.npwd_twitter_likes
DROP TABLE IF EXISTS `npwd_twitter_likes`;
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_twitter_likes: ~0 rows (approximately)
DELETE FROM `npwd_twitter_likes`;

-- Dumping structure for table QboxRp.npwd_twitter_profiles
DROP TABLE IF EXISTS `npwd_twitter_profiles`;
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_twitter_profiles: ~0 rows (approximately)
DELETE FROM `npwd_twitter_profiles`;

-- Dumping structure for table QboxRp.npwd_twitter_reports
DROP TABLE IF EXISTS `npwd_twitter_reports`;
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_twitter_reports: ~0 rows (approximately)
DELETE FROM `npwd_twitter_reports`;

-- Dumping structure for table QboxRp.npwd_twitter_tweets
DROP TABLE IF EXISTS `npwd_twitter_tweets`;
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.npwd_twitter_tweets: ~0 rows (approximately)
DELETE FROM `npwd_twitter_tweets`;

-- Dumping structure for table QboxRp.occasion_vehicles
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.occasion_vehicles: ~0 rows (approximately)
DELETE FROM `occasion_vehicles`;

-- Dumping structure for table QboxRp.ox_doorlock
DROP TABLE IF EXISTS `ox_doorlock`;
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.ox_doorlock: ~6 rows (approximately)
DELETE FROM `ox_doorlock`;
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'vangelico_jewellery', '{"maxDistance":2,"groups":{"police":0},"doors":[{"model":1425919976,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582},"heading":306},{"model":9467943,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582},"heading":306}],"state":1,"coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"hideUi":true}'),
	(2, 'BigBankThermite1', '{"heading":160,"doors":false,"maxDistance":2,"hideUi":true,"groups":{"police":0},"coords":{"x":251.85757446289063,"y":221.0654754638672,"z":101.83240509033203},"model":-1508355822,"state":1,"autolock":1800}'),
	(3, 'BigBankThermite2', '{"coords":{"x":261.3004150390625,"y":214.50514221191407,"z":101.83240509033203},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":-1508355822,"doors":false,"hideUi":true,"heading":250,"state":1}'),
	(4, 'BigBankLPDoor', '{"coords":{"x":256.3115539550781,"y":220.65785217285157,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"model":-222270721,"doors":false,"lockpick":true,"hideUi":true,"heading":340,"state":1,"lockpickDifficulty":["hard"]}'),
	(5, 'PaletoThermiteDoor', '{"coords":{"x":-106.47130584716797,"y":6476.15771484375,"z":31.95479965209961},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":1309269072,"doors":false,"hideUi":true,"heading":315,"state":1}'),
	(6, 'BigBankRedCardDoor', '{"coords":{"x":262.1980895996094,"y":222.518798828125,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":746855201,"doors":false,"hideUi":true,"heading":250,"state":1}');

-- Dumping structure for table QboxRp.ox_inventory
DROP TABLE IF EXISTS `ox_inventory`;
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table QboxRp.ox_inventory: ~0 rows (approximately)
DELETE FROM `ox_inventory`;

-- Dumping structure for table QboxRp.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.players: ~0 rows (approximately)
DELETE FROM `players`;

-- Dumping structure for table QboxRp.playerskins
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.playerskins: ~0 rows (approximately)
DELETE FROM `playerskins`;

-- Dumping structure for table QboxRp.player_groups
DROP TABLE IF EXISTS `player_groups`;
CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_groups: ~0 rows (approximately)
DELETE FROM `player_groups`;

-- Dumping structure for table QboxRp.player_houses
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_houses: ~0 rows (approximately)
DELETE FROM `player_houses`;

-- Dumping structure for table QboxRp.player_mails
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_mails: ~0 rows (approximately)
DELETE FROM `player_mails`;

-- Dumping structure for table QboxRp.player_outfits
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_outfits: ~0 rows (approximately)
DELETE FROM `player_outfits`;

-- Dumping structure for table QboxRp.player_outfit_codes
DROP TABLE IF EXISTS `player_outfit_codes`;
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_outfit_codes: ~0 rows (approximately)
DELETE FROM `player_outfit_codes`;

-- Dumping structure for table QboxRp.player_transactions
DROP TABLE IF EXISTS `player_transactions`;
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_transactions: ~0 rows (approximately)
DELETE FROM `player_transactions`;

-- Dumping structure for table QboxRp.player_vehicles
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_vehicles: ~0 rows (approximately)
DELETE FROM `player_vehicles`;

-- Dumping structure for table QboxRp.player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.player_warns: ~0 rows (approximately)
DELETE FROM `player_warns`;

-- Dumping structure for table QboxRp.vehicle_financing
DROP TABLE IF EXISTS `vehicle_financing`;
CREATE TABLE IF NOT EXISTS `vehicle_financing` (
  `vehicleId` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `paymentamount` int(11) DEFAULT NULL,
  `paymentsleft` int(11) DEFAULT NULL,
  `financetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table QboxRp.vehicle_financing: ~0 rows (approximately)
DELETE FROM `vehicle_financing`;

CREATE TABLE IF NOT EXISTS `weed_plants` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`timestamp` varchar(255) DEFAULT NULL,
`citizenid` varchar(255) DEFAULT NULL,
`x` varchar(255) DEFAULT NULL,
`y` varchar(255) DEFAULT NULL,
`z` varchar(255) DEFAULT NULL,
`gender` int(1) DEFAULT 0,
`water` float(2) DEFAULT 10,
`strain` text DEFAULT NULL,
`harvest` int(1) DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `strain` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`owner` varchar(255) DEFAULT NULL,
`name` varchar(255) DEFAULT NULL,
`n` int(2) DEFAULT 0,
`p` int(2) DEFAULT 0,
`k` int(2) DEFAULT 0,
`rep` int(2) DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_offenses` (
    `label` varchar(100) NOT NULL,
    `type` ENUM('misdemeanor', 'felony', 'infraction') NOT NULL,
    `category` ENUM(
      'OFFENSES AGAINST PERSONS',
      'OFFENSES INVOLVING THEFT',
      'OFFENSES INVOLVING FRAUD',
      'OFFENSES INVOLVING DAMAGE TO PROPERTY',
      'OFFENSES AGAINST PUBLIC ADMINISTRATION',
      'OFFENSES AGAINST PUBLIC ORDER',
      'OFFENSES AGAINST HEALTH AND MORALS',
      'OFFENSES AGAINST PUBLIC SAFETY',
      'OFFENSES INVOLVING THE OPERATION OF A VEHICLE',
      'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE') NOT NULL,
    `description` varchar(250) NOT NULL,
    `time` int UNSIGNED NOT NULL DEFAULT 0,
    `fine` int UNSIGNED NOT NULL DEFAULT 0,
    `points` int UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_incidents` (
    `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` varchar(50) NOT NULL,
    `description` text DEFAULT NULL,
    `author` varchar(50) DEFAULT NULL,
    `date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_incidents_criminals` (
    `incidentid` INT UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `reduction` TINYINT UNSIGNED NULL DEFAULT NULL,
    `warrantExpiry` DATE NULL DEFAULT NULL,
    `processed` TINYINT NULL DEFAULT NULL,
    `pleadedGuilty` TINYINT NULL DEFAULT NULL,
    INDEX `incidentid` (`incidentid`),
    INDEX `FK_mdt_incidents_incidents_players` (`citizenid`),
    CONSTRAINT `mdt_incidents_criminals_ibfk_2` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_incidents_officers` (
    `incidentid` int UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    KEY `FK_mdt_incidents_officers_players` (`citizenid`),
    KEY `incidentid` (`incidentid`),
    CONSTRAINT `FK_mdt_incidents_officers_mdt_incidents` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_incidents_charges` (
    `incidentid` int UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `charge` VARCHAR(100) DEFAULT NULL,
    `type` ENUM('misdemeanor', 'felony', 'infraction') NOT NULL,
    `count` int UNSIGNED NOT NULL DEFAULT 1,
    `time` int UNSIGNED DEFAULT NULL,
    `fine` int UNSIGNED DEFAULT NULL,
    `points` int UNSIGNED DEFAULT NULL,
    KEY `FK_mdt_incidents_charges_mdt_incidents_criminals` (`incidentid`),
    KEY `FK_mdt_incidents_charges_mdt_incidents_criminals_2` (`citizenid`),
    KEY `FK_mdt_incidents_charges_mdt_offenses` (`charge`),
    CONSTRAINT `FK_mdt_incidents_charges_mdt_offenses` FOREIGN KEY (`charge`) REFERENCES `mdt_offenses` (`label`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `FK_mdt_incidents_charges_mdt_incidents_criminals_2` FOREIGN KEY (`citizenid`) REFERENCES `mdt_incidents_criminals` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_incidents_evidence` (
    `incidentid` INT UNSIGNED NOT NULL,
    `label` VARCHAR(50) NOT NULL DEFAULT '',
    `image` VARCHAR(90) NOT NULL DEFAULT '',
    INDEX `incidentid` (`incidentid`),
    CONSTRAINT `FK_mdt_incidents_evidence_mdt_incidents` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_announcements` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `creator` VARCHAR(50) NOT NULL,
    `contents` TEXT NOT NULL,
    `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `FK_mdt_announcements_players` (`creator`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_warrants` (
    `incidentid` INT UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `expiresAt` DATETIME NOT NULL,
    CONSTRAINT `mdt_warrants_mdt_incidents_id_fk` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_profiles` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `citizenid`  VARCHAR(50)  NOT NULL,
    `image`    VARCHAR(90) NULL,
    `notes`    TEXT        NULL,
    `callsign` VARCHAR(10) NULL,
    `apu` TINYINT NULL DEFAULT NULL,
    `air` TINYINT NULL DEFAULT NULL,
    `mc` TINYINT NULL DEFAULT NULL,
    `k9` TINYINT NULL DEFAULT NULL,
    `fto` TINYINT NULL DEFAULT NULL,
    `fingerprint` VARCHAR(90) NULL,
    `lastActive` DATETIME DEFAULT NULL,
    CONSTRAINT `mdt_profiles_pk` UNIQUE (`callsign`),
    CONSTRAINT `mdt_profiles_pk2` UNIQUE (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_recent_activity` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `category` VARCHAR(100) DEFAULT NULL,
    `type` ENUM('created', 'updated', 'deleted') NOT NULL,
    `date` datetime DEFAULT CURRENT_TIMESTAMP,
    `activityid` INT UNSIGNED DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports` (
    `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` varchar(50) NOT NULL,
    `description` text DEFAULT NULL,
    `author` varchar(50) DEFAULT NULL,
    `date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports_officers` (
    `reportid` int UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    KEY `FK_mdt_reports_officers_players` (`citizenid`),
    KEY `reportid` (`reportid`),
    CONSTRAINT `FK_mdt_reports_officers_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports_citizens` (
    `reportid` int UNSIGNED NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    KEY `FK_mdt_reports_players` (`citizenid`),
    KEY `reportid` (`reportid`),
    CONSTRAINT `FK_mdt_reports_players_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports_evidence` (
    `reportid` INT UNSIGNED NOT NULL,
    `label` VARCHAR(50) NOT NULL DEFAULT '',
    `image` VARCHAR(90) NOT NULL DEFAULT '',
    INDEX `reportid` (`reportid`),
    CONSTRAINT `FK_mdt_reports_evidence_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `plate`  VARCHAR(50)  NOT NULL,
    `image`    VARCHAR(90) NULL,
    `notes`    TEXT        NULL,
    `known_information` JSON NULL,
    UNIQUE (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
    `plate` VARCHAR(50) NOT NULL,
    `reason` TEXT NOT NULL,
    `expiresAt` DATETIME NOT NULL,
    UNIQUE (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP table IF EXISTS `properties`;

CREATE TABLE IF NOT EXISTS `properties` (
    `property_id` int(11) NOT NULL AUTO_INCREMENT,
    `owner_citizenid` varchar(50) NULL,
    `street` VARCHAR(100) NULL,
    `region` VARCHAR(100) NULL,
    `description` LONGTEXT NULL,
    `has_access` JSON NULL DEFAULT (JSON_ARRAY()), -- [citizenid1, citizenid2, ...]
    `extra_imgs` JSON NULL DEFAULT (JSON_ARRAY()),
    `furnitures` JSON NULL DEFAULT (JSON_ARRAY()),
    `for_sale` boolean NOT NULL DEFAULT 1,
    `price` int(11) NOT NULL DEFAULT 0,
    `shell` varchar(50) NOT NULL,
    `apartment` varchar(50) NULL DEFAULT NULL, -- if NULL then it's a house
    `door_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0, "h": 0.0, "length": 0.0, "width": 0.0}
    `garage_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0} -- NULL if no garage
    PRIMARY KEY (`property_id`),
    CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `UQ_owner_apartment` UNIQUE (`owner_citizenid`, `apartment`) -- A character can only own one apartment
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- -- Dumping structure for table QboxRp.properties
-- DROP TABLE IF EXISTS `properties`;
-- CREATE TABLE IF NOT EXISTS `properties` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `property_name` varchar(255) NOT NULL,
--   `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
--   `price` int(11) NOT NULL DEFAULT 0,
--   `owner` varchar(255) DEFAULT NULL,
--   `interior` varchar(255) NOT NULL,
--   `keyholders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`keyholders`)),
--   `rent_interval` int(11) DEFAULT NULL,
--   `interact_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`interact_options`)),
--   `stash_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`stash_options`)),
--   `decorations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`decorations`)),
--   PRIMARY KEY (`id`),
--   KEY `owner` (`owner`),
--   CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `players` (`citizenid`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mdt_offenses` (`label`, `type`, `category`, `description`, `time`, `fine`, `points`) VALUES
    -- OFFENSES AGAINST PERSONS
    ('Assault', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Unlawfully attacking another person.', 30, 1000, 0),
    ('Kidnapping', 'felony', 'OFFENSES AGAINST PERSONS', 'Unlawfully seizing and carrying away a person by force.', 360, 20000, 0),
    ('Manslaughter', 'felony', 'OFFENSES AGAINST PERSONS', 'Killing another person without intention during the commission of a non-felony.', 180, 15000, 0),
    ('Murder', 'felony', 'OFFENSES AGAINST PERSONS', 'Unlawful premeditated killing of one human being by another.', 999, 50000, 0),
    ('Hate Crime', 'felony', 'OFFENSES AGAINST PERSONS', 'A crime motivated by racial, sexual, or other prejudice.', 180, 10000, 0),
    ('Battery', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Applying force to another, resulting in harmful or offensive contact.', 60, 3000, 0),
    ('Stalking', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Repeatedly following or harassing another person and making threats.', 90, 5000, 0),
    ('Human Trafficking', 'felony', 'OFFENSES AGAINST PERSONS', 'Illegal trade of human beings for the purposes of forced labor or sexual exploitation.', 720, 50000, 0),
    ('Sexual Assault', 'felony', 'OFFENSES AGAINST PERSONS', 'An act in which a person sexually touches another person without their consent.', 360, 20000, 0),
    ('Harassment', 'infraction', 'OFFENSES AGAINST PERSONS', 'Engaging in a pattern of unwanted conduct that alarms or seriously annoys another person, without claiming a legitimate purpose.', 0, 500, 0),

    -- OFFENSES INVOLVING THEFT
    ('Petty Theft', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'The theft of relatively low value items.', 30, 500, 0),
    ('Grand Theft Auto', 'felony', 'OFFENSES INVOLVING THEFT', 'Theft of an automobile.', 180, 10000, 0),
    ('Burglary', 'felony', 'OFFENSES INVOLVING THEFT', 'Entering a building unlawfully with intent to commit a felony or a theft.', 90, 5000, 0),
    ('Shoplifting', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'The act of stealing goods from a store.', 30, 1000, 0),
    ('Armed Robbery', 'felony', 'OFFENSES INVOLVING THEFT', 'Robbery with the use of a weapon.', 360, 25000, 0),
    ('Larceny', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'Unlawful taking of personal property.', 60, 2000, 0),
    ('Embezzlement', 'felony', 'OFFENSES INVOLVING THEFT', 'Theft or misappropriation of funds placed in ones trust or belonging to ones employer.', 180, 15000, 0),
    ('Receiving Stolen Property', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'Receiving, buying, or possessing property known to be stolen.', 90, 4000, 0),
    ('Identity Theft', 'felony', 'OFFENSES INVOLVING THEFT', 'The fraudulent acquisition and use of a persons private identifying information.', 180, 10000, 0),
    ('Ticket Scalping', 'infraction', 'OFFENSES INVOLVING THEFT', 'Selling tickets for an event without a proper license and often at a rate exceeding the face value.', 0, 200, 0),

    -- OFFENSES INVOLVING FRAUD
    ('Wire Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Fraud involving the use of electronic communications.', 180, 15000, 0),
    ('Insurance Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'The act of falsifying or exaggerating the facts of an accident to an insurance company to obtain payment that would not otherwise be made.', 180, 10000, 0),
    ('Securities Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Fraudulent practices in the stock and commodities markets, including insider trading.', 360, 25000, 0),
    ('Credit Card Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Unauthorized use of a credit card to obtain goods of value.', 90, 5000, 0),
    ('Tax Evasion', 'felony', 'OFFENSES INVOLVING FRAUD', 'The illegal nonpayment or underpayment of tax.', 180, 10000, 0),
    ('Healthcare Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Filing dishonest healthcare claims to obtain a profit.', 180, 15000, 0),
    ('Mail Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'The use of postal services to commit fraud.', 180, 10000, 0),
    ('Misrepresentation', 'misdemeanor', 'OFFENSES INVOLVING FRAUD', 'Deliberately providing false information in a business transaction.', 90, 3000, 0),
    ('False Advertising', 'misdemeanor', 'OFFENSES INVOLVING FRAUD', 'Advertising products or services in a misleading or deceptive way.', 30, 2000, 0),
    ('Phishing', 'infraction', 'OFFENSES INVOLVING FRAUD', 'Attempting to acquire sensitive information such as usernames, passwords, and credit card details by masquerading as a trustworthy entity in an electronic communication.', 0, 500, 0),

    -- OFFENSES INVOLVING DAMAGE TO PROPERTY
    ('Vandalism', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Deliberately destroying or damaging property.', 30, 1000, 0),
    ('Arson', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'The criminal act of deliberately setting fire to property.', 360, 20000, 0),
    ('Graffiti', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Writing or drawings scribbled, scratched, or sprayed illicitly on a wall or other surface in a public place.', 60, 2500, 0),
    ('Criminal Mischief', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Intentional or knowing damage to anothers property.', 90, 3000, 0),
    ('Trespassing with Damage', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Entering anothers property without permission and causing damage.', 30, 2000, 0),
    ('Illegal Dumping', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Disposing of waste illegally in non-designated areas.', 90, 5000, 0),
    ('Destruction of Signs', 'infraction', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'The act of destroying or defacing road signs or other public signs.', 0, 500, 0),
    ('Littering', 'infraction', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Carelessly discarding trash or other materials on public or private property.', 0, 250, 0),
    ('Damaging Public Utilities', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Intentionally damaging or interfering with services of public utility providers.', 180, 10000, 0),
    ('Sabotage', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Deliberately destroying, damaging, or obstructing something, especially for political or military advantage.', 360, 25000, 0),

    -- OFFENSES AGAINST PUBLIC ADMINISTRATION
    ('Bribery', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Offering, giving, receiving, or soliciting anything of value to influence the actions of an official or other person in charge of a public or legal duty.', 180, 15000, 0),
    ('Perjury', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The offense of willfully telling an untruth in a court after having taken an oath or affirmation.', 180, 10000, 0),
    ('Obstruction of Justice', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The crime of obstructing prosecutors or other (usually government) officials.', 180, 10000, 0),
    ('Public Corruption', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The abuse of public office for private gain.', 360, 25000, 0),
    ('Falsifying Records', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Altering, concealing, falsifying, or destroying a document to obstruct the investigation or other official matters.', 90, 5000, 0),
    ('Witness Tampering', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The attempt to alter or prevent the testimony of witnesses within criminal or civil proceedings.', 240, 15000, 0),
    ('Illegal Lobbying', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Lobbying without proper registration or when specifically prohibited.', 120, 8000, 0),
    ('Election Fraud', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Illegal interference with the process of an election.', 240, 20000, 0),
    ('Misuse of Public Funds', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Using public money for unauthorized, illegal, or unethical purposes.', 180, 15000, 0),
    ('Unauthorized Disclosure of Confidential Information', 'infraction', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Improperly revealing confidential or classified information without authorization.', 0, 1000, 0),

    -- OFFENSES AGAINST PUBLIC ORDER
    ('Disorderly Conduct', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Engaging in behavior that disrupts public peace, including fighting, making excessive noise, or causing a public disturbance.', 30, 1000, 0),
    ('Illegal Assembly', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Gathering of people with the intent of engaging in activities that breach public peace or order.', 60, 3000, 0),
    ('Public Intoxication', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Appearing in public places while significantly impaired by alcohol or drugs, posing a potential danger to self and others.', 0, 500, 0),
    ('Inciting a Riot', 'felony', 'OFFENSES AGAINST PUBLIC ORDER', 'Encouraging, promoting, or participating in violent or disruptive behavior that turns into a mass disturbance.', 90, 7000, 0),
    ('Unlawful Protest', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Protesting without required permissions or in violation of legal restrictions, potentially leading to public disorder.', 30, 2000, 0),
    ('Loitering', 'infraction', 'OFFENSES AGAINST PUBLIC ORDER', 'Remaining idle in a public place for an extended period without a clear reason, often seen as a nuisance.', 0, 250, 0),
    ('Curfew Violation', 'infraction', 'OFFENSES AGAINST PUBLIC ORDER', 'Failing to adhere to government-imposed curfew regulations, typically enforced to maintain public order during emergencies.', 0, 300, 0),
    ('Vagrancy', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Living in public spaces without a permanent home or employment, often associated with public nuisance behaviors.', 30, 1000, 0),
    ('Public Nudity', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Intentionally exposing oneself in a public space, not complying with local decency laws.', 60, 2000, 0),
    ('Illegal Gambling', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Organizing, participating in, or operating games of chance in public or private settings without legal authorization.', 90, 5000, 0),

    -- OFFENSES AGAINST HEALTH AND MORALS
    ('Drug Possession', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Possession of illegal drugs or controlled substances without a prescription.', 60, 2000, 0),
    ('Prostitution', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Engaging in, soliciting, or arranging sexual activities in exchange for payment.', 90, 3000, 0),
    ('Illegal Substance Sale', 'felony', 'OFFENSES AGAINST HEALTH AND MORALS', 'Selling or distributing illegal drugs or other prohibited substances.', 180, 10000, 0),
    ('Public Indecency', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Performing acts of a sexual nature in public spaces or exposing oneself inappropriately.', 30, 1000, 0),
    ('Gambling Operation', 'felony', 'OFFENSES AGAINST HEALTH AND MORALS', 'Operating or participating in illegal gambling activities, including unlicensed casinos or sports betting.', 180, 15000, 0),
    ('Underage Drinking', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Consuming or possessing alcohol by individuals under the legal drinking age.', 0, 500, 0),
    ('Smoking Ban Violation', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Smoking in non-smoking areas or violating local smoking regulations.', 0, 250, 0),
    ('Illegal Fireworks', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Possessing, using, or selling fireworks without appropriate authorization.', 30, 2000, 0),
    ('Animal Cruelty', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Intentionally inflicting harm or failing to provide adequate care to animals.', 90, 5000, 0),
    ('Illegal Tattooing', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Tattooing individuals without proper licensing or on minors without legal consent.', 0, 1000, 0),

    -- OFFENSES AGAINST PUBLIC SAFETY
    ('Firearm Possession without Permit', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Owning or carrying a firearm without the necessary permits.', 180, 10000, 0),
    ('Criminal Possession of Weapon Class A', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class A weapon, such as a machine gun, assault rifle, or destructive device.', 360, 20000, 0),
    ('Criminal Possession of Weapon Class B', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class B weapon, such as a sawed-off shotgun or handgun.', 180, 15000, 0),
    ('Criminal Possession of Weapon Class C', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class C weapon, such as a rifle or shotgun.', 90, 5000, 0),
    ('Criminal Possession of Weapon Class D', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class D weapon, such as a knife or club.', 30, 1000, 0),
    ('Reckless Endangerment', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Engaging in conduct that poses a significant risk of serious physical injury to others.', 90, 7000, 0),
    ('Traffic Violation', 'infraction', 'OFFENSES AGAINST PUBLIC SAFETY', 'Violating traffic laws such as speeding, running red lights, or illegal parking.', 0, 500, 1),
    ('Illegal Hunting', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Hunting wildlife in restricted areas or during off-seasons without proper permits.', 60, 3000, 0),
    ('Building Code Violation', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Violating local building regulations, potentially creating safety hazards.', 30, 2000, 0),
    ('DUI with Bodily Injury', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Driving under the influence of alcohol or drugs and causing bodily harm.', 180, 15000, 3),
    ('Possession of Explosives', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Illegally possessing or improperly handling explosive materials.', 360, 20000, 0),
    ('Hazardous Waste Dumping', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Disposing of hazardous materials in a manner that endangers public health and the environment.', 180, 15000, 0),
    ('Negligent Discharge of a Firearm', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Accidentally discharging a firearm due to careless handling.', 60, 3000, 0),
    ('Improper Transport of Hazardous Materials', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Transporting hazardous materials without adhering to safety regulations and legal requirements.', 240, 15000, 0),

    -- OFFENSES INVOLVING THE OPERATION OF A VEHICLE
    ('Driving Without a License', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Operating a vehicle without a valid driving license.', 0, 1000, 2),
    ('Driving with a Suspended License', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving when your drivers license has been suspended or revoked.', 30, 2000, 2),
    ('Hit and Run', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Leaving the scene of an accident without providing contact information or assisting the injured.', 180, 10000, 3),
    ('Reckless Driving', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving with a willful disregard for the safety of persons or property.', 60, 3000, 4),
    ('Vehicle Manslaughter', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Causing the death of another through negligent or reckless driving.', 360, 20000, 0),
    ('Traffic Obstruction', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Obstructing traffic flow intentionally or unintentionally.', 0, 500, 0),
    ('Illegal Street Racing', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Participating in unauthorized speed contests on public roads.', 90, 5000, 3),
    ('Driving Under the Influence (DUI)', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Operating a vehicle while under the influence of alcohol or drugs.', 90, 7000, 3),
    ('Failure to Yield', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Failing to yield the right of way to other road users where required.', 0, 250, 1),
    ('Driving with Obstructed View', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving a vehicle with objects blocking the drivers view or control.', 0, 300, 0),

    -- OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE
    ('Illegal Fishing', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Fishing without a license or in restricted areas.', 30, 2000, 0),
    ('Wildlife Smuggling', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Illegally exporting or importing protected or endangered species.', 360, 25000, 0),
    ('Destroying Habitat', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Deliberate destruction of environments that support wildlife.', 180, 15000, 0),
    ('Poaching', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Illegal hunting, killing, or capturing of wild animals.', 180, 10000, 0),
    ('Illegal Logging', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Unauthorized cutting down of trees in protected areas.', 180, 15000, 0),
    ('Disrupting Wildlife with Noise Pollution', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Causing noise that can harm wildlife behavior and natural habitat.', 60, 3000, 0),
    ('Feeding Wildlife Illegally', 'infraction', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Feeding wildlife in areas where it is prohibited by law.', 0, 500, 0),
    ('Illegal Pet Trade', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Engaging in the sale or purchase of wild animals as pets illegally.', 360, 20000, 0),
    ('Use of Harmful Pesticides', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Using pesticides that are known to cause significant harm to wildlife.', 90, 5000, 0),
    ('Littering in Natural Reserves', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Disposing of waste in a natural reserve, negatively affecting wildlife.', 30, 2000, 0);

ALTER TABLE `players`
MODIFY COLUMN `name` varchar(50) NOT NULL COLLATE utf8mb4_unicode_ci;
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

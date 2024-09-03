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


-- Dumping database structure for qboxrp
DROP DATABASE IF EXISTS `qboxrp`;
CREATE DATABASE IF NOT EXISTS `qboxrp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `qboxrp`;

-- Dumping structure for table qboxrp.bank_accounts_new
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

-- Dumping data for table qboxrp.bank_accounts_new: ~11 rows (approximately)
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

-- Dumping structure for table qboxrp.bans
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

-- Dumping data for table qboxrp.bans: ~0 rows (approximately)
DELETE FROM `bans`;

-- Dumping structure for table qboxrp.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.dealers: ~0 rows (approximately)
DELETE FROM `dealers`;

-- Dumping structure for table qboxrp.houselocations
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

-- Dumping data for table qboxrp.houselocations: ~0 rows (approximately)
DELETE FROM `houselocations`;

-- Dumping structure for table qboxrp.lapraces
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

-- Dumping data for table qboxrp.lapraces: ~0 rows (approximately)
DELETE FROM `lapraces`;

-- Dumping structure for table qboxrp.management_funds
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

-- Dumping data for table qboxrp.management_funds: ~12 rows (approximately)
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

-- Dumping structure for table qboxrp.management_outfits
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

-- Dumping data for table qboxrp.management_outfits: ~0 rows (approximately)
DELETE FROM `management_outfits`;

-- Dumping structure for table qboxrp.mdt_announcements
DROP TABLE IF EXISTS `mdt_announcements`;
CREATE TABLE IF NOT EXISTS `mdt_announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) NOT NULL,
  `contents` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_mdt_announcements_players` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_announcements: ~0 rows (approximately)
DELETE FROM `mdt_announcements`;

-- Dumping structure for table qboxrp.mdt_bolos
DROP TABLE IF EXISTS `mdt_bolos`;
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `plate` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `expiresAt` datetime NOT NULL,
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_bolos: ~0 rows (approximately)
DELETE FROM `mdt_bolos`;

-- Dumping structure for table qboxrp.mdt_incidents
DROP TABLE IF EXISTS `mdt_incidents`;
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_incidents: ~0 rows (approximately)
DELETE FROM `mdt_incidents`;

-- Dumping structure for table qboxrp.mdt_incidents_charges
DROP TABLE IF EXISTS `mdt_incidents_charges`;
CREATE TABLE IF NOT EXISTS `mdt_incidents_charges` (
  `incidentid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `charge` varchar(100) DEFAULT NULL,
  `type` enum('misdemeanor','felony','infraction') NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 1,
  `time` int(10) unsigned DEFAULT NULL,
  `fine` int(10) unsigned DEFAULT NULL,
  `points` int(10) unsigned DEFAULT NULL,
  KEY `FK_mdt_incidents_charges_mdt_incidents_criminals` (`incidentid`),
  KEY `FK_mdt_incidents_charges_mdt_incidents_criminals_2` (`citizenid`),
  KEY `FK_mdt_incidents_charges_mdt_offenses` (`charge`),
  CONSTRAINT `FK_mdt_incidents_charges_mdt_incidents_criminals_2` FOREIGN KEY (`citizenid`) REFERENCES `mdt_incidents_criminals` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mdt_incidents_charges_mdt_offenses` FOREIGN KEY (`charge`) REFERENCES `mdt_offenses` (`label`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_incidents_charges: ~0 rows (approximately)
DELETE FROM `mdt_incidents_charges`;

-- Dumping structure for table qboxrp.mdt_incidents_criminals
DROP TABLE IF EXISTS `mdt_incidents_criminals`;
CREATE TABLE IF NOT EXISTS `mdt_incidents_criminals` (
  `incidentid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `reduction` tinyint(3) unsigned DEFAULT NULL,
  `warrantExpiry` date DEFAULT NULL,
  `processed` tinyint(4) DEFAULT NULL,
  `pleadedGuilty` tinyint(4) DEFAULT NULL,
  KEY `incidentid` (`incidentid`),
  KEY `FK_mdt_incidents_incidents_players` (`citizenid`),
  CONSTRAINT `mdt_incidents_criminals_ibfk_2` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_incidents_criminals: ~0 rows (approximately)
DELETE FROM `mdt_incidents_criminals`;

-- Dumping structure for table qboxrp.mdt_incidents_evidence
DROP TABLE IF EXISTS `mdt_incidents_evidence`;
CREATE TABLE IF NOT EXISTS `mdt_incidents_evidence` (
  `incidentid` int(10) unsigned NOT NULL,
  `label` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(90) NOT NULL DEFAULT '',
  KEY `incidentid` (`incidentid`),
  CONSTRAINT `FK_mdt_incidents_evidence_mdt_incidents` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_incidents_evidence: ~0 rows (approximately)
DELETE FROM `mdt_incidents_evidence`;

-- Dumping structure for table qboxrp.mdt_incidents_officers
DROP TABLE IF EXISTS `mdt_incidents_officers`;
CREATE TABLE IF NOT EXISTS `mdt_incidents_officers` (
  `incidentid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  KEY `FK_mdt_incidents_officers_players` (`citizenid`),
  KEY `incidentid` (`incidentid`),
  CONSTRAINT `FK_mdt_incidents_officers_mdt_incidents` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_incidents_officers: ~0 rows (approximately)
DELETE FROM `mdt_incidents_officers`;

-- Dumping structure for table qboxrp.mdt_offenses
DROP TABLE IF EXISTS `mdt_offenses`;
CREATE TABLE IF NOT EXISTS `mdt_offenses` (
  `label` varchar(100) NOT NULL,
  `type` enum('misdemeanor','felony','infraction') NOT NULL,
  `category` enum('OFFENSES AGAINST PERSONS','OFFENSES INVOLVING THEFT','OFFENSES INVOLVING FRAUD','OFFENSES INVOLVING DAMAGE TO PROPERTY','OFFENSES AGAINST PUBLIC ADMINISTRATION','OFFENSES AGAINST PUBLIC ORDER','OFFENSES AGAINST HEALTH AND MORALS','OFFENSES AGAINST PUBLIC SAFETY','OFFENSES INVOLVING THE OPERATION OF A VEHICLE','OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE') NOT NULL,
  `description` varchar(250) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT 0,
  `fine` int(10) unsigned NOT NULL DEFAULT 0,
  `points` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_offenses: ~104 rows (approximately)
DELETE FROM `mdt_offenses`;
INSERT INTO `mdt_offenses` (`label`, `type`, `category`, `description`, `time`, `fine`, `points`) VALUES
	('Animal Cruelty', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Intentionally inflicting harm or failing to provide adequate care to animals.', 90, 5000, 0),
	('Armed Robbery', 'felony', 'OFFENSES INVOLVING THEFT', 'Robbery with the use of a weapon.', 360, 25000, 0),
	('Arson', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'The criminal act of deliberately setting fire to property.', 360, 20000, 0),
	('Assault', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Unlawfully attacking another person.', 30, 1000, 0),
	('Battery', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Applying force to another, resulting in harmful or offensive contact.', 60, 3000, 0),
	('Bribery', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Offering, giving, receiving, or soliciting anything of value to influence the actions of an official or other person in charge of a public or legal duty.', 180, 15000, 0),
	('Building Code Violation', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Violating local building regulations, potentially creating safety hazards.', 30, 2000, 0),
	('Burglary', 'felony', 'OFFENSES INVOLVING THEFT', 'Entering a building unlawfully with intent to commit a felony or a theft.', 90, 5000, 0),
	('Credit Card Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Unauthorized use of a credit card to obtain goods of value.', 90, 5000, 0),
	('Criminal Mischief', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Intentional or knowing damage to anothers property.', 90, 3000, 0),
	('Criminal Possession of Weapon Class A', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class A weapon, such as a machine gun, assault rifle, or destructive device.', 360, 20000, 0),
	('Criminal Possession of Weapon Class B', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class B weapon, such as a sawed-off shotgun or handgun.', 180, 15000, 0),
	('Criminal Possession of Weapon Class C', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class C weapon, such as a rifle or shotgun.', 90, 5000, 0),
	('Criminal Possession of Weapon Class D', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Possession of a Class D weapon, such as a knife or club.', 30, 1000, 0),
	('Curfew Violation', 'infraction', 'OFFENSES AGAINST PUBLIC ORDER', 'Failing to adhere to government-imposed curfew regulations, typically enforced to maintain public order during emergencies.', 0, 300, 0),
	('Damaging Public Utilities', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Intentionally damaging or interfering with services of public utility providers.', 180, 10000, 0),
	('Destroying Habitat', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Deliberate destruction of environments that support wildlife.', 180, 15000, 0),
	('Destruction of Signs', 'infraction', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'The act of destroying or defacing road signs or other public signs.', 0, 500, 0),
	('Disorderly Conduct', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Engaging in behavior that disrupts public peace, including fighting, making excessive noise, or causing a public disturbance.', 30, 1000, 0),
	('Disrupting Wildlife with Noise Pollution', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Causing noise that can harm wildlife behavior and natural habitat.', 60, 3000, 0),
	('Driving Under the Influence (DUI)', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Operating a vehicle while under the influence of alcohol or drugs.', 90, 7000, 3),
	('Driving with a Suspended License', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving when your drivers license has been suspended or revoked.', 30, 2000, 2),
	('Driving with Obstructed View', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving a vehicle with objects blocking the drivers view or control.', 0, 300, 0),
	('Driving Without a License', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Operating a vehicle without a valid driving license.', 0, 1000, 2),
	('Drug Possession', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Possession of illegal drugs or controlled substances without a prescription.', 60, 2000, 0),
	('DUI with Bodily Injury', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Driving under the influence of alcohol or drugs and causing bodily harm.', 180, 15000, 3),
	('Election Fraud', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Illegal interference with the process of an election.', 240, 20000, 0),
	('Embezzlement', 'felony', 'OFFENSES INVOLVING THEFT', 'Theft or misappropriation of funds placed in ones trust or belonging to ones employer.', 180, 15000, 0),
	('Failure to Yield', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Failing to yield the right of way to other road users where required.', 0, 250, 1),
	('False Advertising', 'misdemeanor', 'OFFENSES INVOLVING FRAUD', 'Advertising products or services in a misleading or deceptive way.', 30, 2000, 0),
	('Falsifying Records', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Altering, concealing, falsifying, or destroying a document to obstruct the investigation or other official matters.', 90, 5000, 0),
	('Feeding Wildlife Illegally', 'infraction', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Feeding wildlife in areas where it is prohibited by law.', 0, 500, 0),
	('Firearm Possession without Permit', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Owning or carrying a firearm without the necessary permits.', 180, 10000, 0),
	('Gambling Operation', 'felony', 'OFFENSES AGAINST HEALTH AND MORALS', 'Operating or participating in illegal gambling activities, including unlicensed casinos or sports betting.', 180, 15000, 0),
	('Graffiti', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Writing or drawings scribbled, scratched, or sprayed illicitly on a wall or other surface in a public place.', 60, 2500, 0),
	('Grand Theft Auto', 'felony', 'OFFENSES INVOLVING THEFT', 'Theft of an automobile.', 180, 10000, 0),
	('Harassment', 'infraction', 'OFFENSES AGAINST PERSONS', 'Engaging in a pattern of unwanted conduct that alarms or seriously annoys another person, without claiming a legitimate purpose.', 0, 500, 0),
	('Hate Crime', 'felony', 'OFFENSES AGAINST PERSONS', 'A crime motivated by racial, sexual, or other prejudice.', 180, 10000, 0),
	('Hazardous Waste Dumping', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Disposing of hazardous materials in a manner that endangers public health and the environment.', 180, 15000, 0),
	('Healthcare Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Filing dishonest healthcare claims to obtain a profit.', 180, 15000, 0),
	('Hit and Run', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Leaving the scene of an accident without providing contact information or assisting the injured.', 180, 10000, 3),
	('Human Trafficking', 'felony', 'OFFENSES AGAINST PERSONS', 'Illegal trade of human beings for the purposes of forced labor or sexual exploitation.', 720, 50000, 0),
	('Identity Theft', 'felony', 'OFFENSES INVOLVING THEFT', 'The fraudulent acquisition and use of a persons private identifying information.', 180, 10000, 0),
	('Illegal Assembly', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Gathering of people with the intent of engaging in activities that breach public peace or order.', 60, 3000, 0),
	('Illegal Dumping', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Disposing of waste illegally in non-designated areas.', 90, 5000, 0),
	('Illegal Fireworks', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Possessing, using, or selling fireworks without appropriate authorization.', 30, 2000, 0),
	('Illegal Fishing', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Fishing without a license or in restricted areas.', 30, 2000, 0),
	('Illegal Gambling', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Organizing, participating in, or operating games of chance in public or private settings without legal authorization.', 90, 5000, 0),
	('Illegal Hunting', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Hunting wildlife in restricted areas or during off-seasons without proper permits.', 60, 3000, 0),
	('Illegal Lobbying', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Lobbying without proper registration or when specifically prohibited.', 120, 8000, 0),
	('Illegal Logging', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Unauthorized cutting down of trees in protected areas.', 180, 15000, 0),
	('Illegal Pet Trade', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Engaging in the sale or purchase of wild animals as pets illegally.', 360, 20000, 0),
	('Illegal Street Racing', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Participating in unauthorized speed contests on public roads.', 90, 5000, 3),
	('Illegal Substance Sale', 'felony', 'OFFENSES AGAINST HEALTH AND MORALS', 'Selling or distributing illegal drugs or other prohibited substances.', 180, 10000, 0),
	('Illegal Tattooing', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Tattooing individuals without proper licensing or on minors without legal consent.', 0, 1000, 0),
	('Improper Transport of Hazardous Materials', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Transporting hazardous materials without adhering to safety regulations and legal requirements.', 240, 15000, 0),
	('Inciting a Riot', 'felony', 'OFFENSES AGAINST PUBLIC ORDER', 'Encouraging, promoting, or participating in violent or disruptive behavior that turns into a mass disturbance.', 90, 7000, 0),
	('Insurance Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'The act of falsifying or exaggerating the facts of an accident to an insurance company to obtain payment that would not otherwise be made.', 180, 10000, 0),
	('Kidnapping', 'felony', 'OFFENSES AGAINST PERSONS', 'Unlawfully seizing and carrying away a person by force.', 360, 20000, 0),
	('Larceny', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'Unlawful taking of personal property.', 60, 2000, 0),
	('Littering', 'infraction', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Carelessly discarding trash or other materials on public or private property.', 0, 250, 0),
	('Littering in Natural Reserves', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Disposing of waste in a natural reserve, negatively affecting wildlife.', 30, 2000, 0),
	('Loitering', 'infraction', 'OFFENSES AGAINST PUBLIC ORDER', 'Remaining idle in a public place for an extended period without a clear reason, often seen as a nuisance.', 0, 250, 0),
	('Mail Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'The use of postal services to commit fraud.', 180, 10000, 0),
	('Manslaughter', 'felony', 'OFFENSES AGAINST PERSONS', 'Killing another person without intention during the commission of a non-felony.', 180, 15000, 0),
	('Misrepresentation', 'misdemeanor', 'OFFENSES INVOLVING FRAUD', 'Deliberately providing false information in a business transaction.', 90, 3000, 0),
	('Misuse of Public Funds', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Using public money for unauthorized, illegal, or unethical purposes.', 180, 15000, 0),
	('Murder', 'felony', 'OFFENSES AGAINST PERSONS', 'Unlawful premeditated killing of one human being by another.', 999, 50000, 0),
	('Negligent Discharge of a Firearm', 'misdemeanor', 'OFFENSES AGAINST PUBLIC SAFETY', 'Accidentally discharging a firearm due to careless handling.', 60, 3000, 0),
	('Obstruction of Justice', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The crime of obstructing prosecutors or other (usually government) officials.', 180, 10000, 0),
	('Perjury', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The offense of willfully telling an untruth in a court after having taken an oath or affirmation.', 180, 10000, 0),
	('Petty Theft', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'The theft of relatively low value items.', 30, 500, 0),
	('Phishing', 'infraction', 'OFFENSES INVOLVING FRAUD', 'Attempting to acquire sensitive information such as usernames, passwords, and credit card details by masquerading as a trustworthy entity in an electronic communication.', 0, 500, 0),
	('Poaching', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Illegal hunting, killing, or capturing of wild animals.', 180, 10000, 0),
	('Possession of Explosives', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Illegally possessing or improperly handling explosive materials.', 360, 20000, 0),
	('Prostitution', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Engaging in, soliciting, or arranging sexual activities in exchange for payment.', 90, 3000, 0),
	('Public Corruption', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The abuse of public office for private gain.', 360, 25000, 0),
	('Public Indecency', 'misdemeanor', 'OFFENSES AGAINST HEALTH AND MORALS', 'Performing acts of a sexual nature in public spaces or exposing oneself inappropriately.', 30, 1000, 0),
	('Public Intoxication', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Appearing in public places while significantly impaired by alcohol or drugs, posing a potential danger to self and others.', 0, 500, 0),
	('Public Nudity', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Intentionally exposing oneself in a public space, not complying with local decency laws.', 60, 2000, 0),
	('Receiving Stolen Property', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'Receiving, buying, or possessing property known to be stolen.', 90, 4000, 0),
	('Reckless Driving', 'misdemeanor', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Driving with a willful disregard for the safety of persons or property.', 60, 3000, 4),
	('Reckless Endangerment', 'felony', 'OFFENSES AGAINST PUBLIC SAFETY', 'Engaging in conduct that poses a significant risk of serious physical injury to others.', 90, 7000, 0),
	('Sabotage', 'felony', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Deliberately destroying, damaging, or obstructing something, especially for political or military advantage.', 360, 25000, 0),
	('Securities Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Fraudulent practices in the stock and commodities markets, including insider trading.', 360, 25000, 0),
	('Sexual Assault', 'felony', 'OFFENSES AGAINST PERSONS', 'An act in which a person sexually touches another person without their consent.', 360, 20000, 0),
	('Shoplifting', 'misdemeanor', 'OFFENSES INVOLVING THEFT', 'The act of stealing goods from a store.', 30, 1000, 0),
	('Smoking Ban Violation', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Smoking in non-smoking areas or violating local smoking regulations.', 0, 250, 0),
	('Stalking', 'misdemeanor', 'OFFENSES AGAINST PERSONS', 'Repeatedly following or harassing another person and making threats.', 90, 5000, 0),
	('Tax Evasion', 'felony', 'OFFENSES INVOLVING FRAUD', 'The illegal nonpayment or underpayment of tax.', 180, 10000, 0),
	('Ticket Scalping', 'infraction', 'OFFENSES INVOLVING THEFT', 'Selling tickets for an event without a proper license and often at a rate exceeding the face value.', 0, 200, 0),
	('Traffic Obstruction', 'infraction', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Obstructing traffic flow intentionally or unintentionally.', 0, 500, 0),
	('Traffic Violation', 'infraction', 'OFFENSES AGAINST PUBLIC SAFETY', 'Violating traffic laws such as speeding, running red lights, or illegal parking.', 0, 500, 1),
	('Trespassing with Damage', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Entering anothers property without permission and causing damage.', 30, 2000, 0),
	('Unauthorized Disclosure of Confidential Information', 'infraction', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'Improperly revealing confidential or classified information without authorization.', 0, 1000, 0),
	('Underage Drinking', 'infraction', 'OFFENSES AGAINST HEALTH AND MORALS', 'Consuming or possessing alcohol by individuals under the legal drinking age.', 0, 500, 0),
	('Unlawful Protest', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Protesting without required permissions or in violation of legal restrictions, potentially leading to public disorder.', 30, 2000, 0),
	('Use of Harmful Pesticides', 'misdemeanor', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Using pesticides that are known to cause significant harm to wildlife.', 90, 5000, 0),
	('Vagrancy', 'misdemeanor', 'OFFENSES AGAINST PUBLIC ORDER', 'Living in public spaces without a permanent home or employment, often associated with public nuisance behaviors.', 30, 1000, 0),
	('Vandalism', 'misdemeanor', 'OFFENSES INVOLVING DAMAGE TO PROPERTY', 'Deliberately destroying or damaging property.', 30, 1000, 0),
	('Vehicle Manslaughter', 'felony', 'OFFENSES INVOLVING THE OPERATION OF A VEHICLE', 'Causing the death of another through negligent or reckless driving.', 360, 20000, 0),
	('Wildlife Smuggling', 'felony', 'OFFENSES INVOLVING THE WELL-BEING OF WILDLIFE', 'Illegally exporting or importing protected or endangered species.', 360, 25000, 0),
	('Wire Fraud', 'felony', 'OFFENSES INVOLVING FRAUD', 'Fraud involving the use of electronic communications.', 180, 15000, 0),
	('Witness Tampering', 'felony', 'OFFENSES AGAINST PUBLIC ADMINISTRATION', 'The attempt to alter or prevent the testimony of witnesses within criminal or civil proceedings.', 240, 15000, 0);

-- Dumping structure for table qboxrp.mdt_profiles
DROP TABLE IF EXISTS `mdt_profiles`;
CREATE TABLE IF NOT EXISTS `mdt_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `image` varchar(90) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL,
  `apu` tinyint(4) DEFAULT NULL,
  `air` tinyint(4) DEFAULT NULL,
  `mc` tinyint(4) DEFAULT NULL,
  `k9` tinyint(4) DEFAULT NULL,
  `fto` tinyint(4) DEFAULT NULL,
  `fingerprint` varchar(90) DEFAULT NULL,
  `lastActive` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdt_profiles_pk2` (`citizenid`),
  UNIQUE KEY `mdt_profiles_pk` (`callsign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_profiles: ~0 rows (approximately)
DELETE FROM `mdt_profiles`;

-- Dumping structure for table qboxrp.mdt_recent_activity
DROP TABLE IF EXISTS `mdt_recent_activity`;
CREATE TABLE IF NOT EXISTS `mdt_recent_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` enum('created','updated','deleted') NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `activityid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_recent_activity: ~0 rows (approximately)
DELETE FROM `mdt_recent_activity`;

-- Dumping structure for table qboxrp.mdt_reports
DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_reports: ~0 rows (approximately)
DELETE FROM `mdt_reports`;

-- Dumping structure for table qboxrp.mdt_reports_citizens
DROP TABLE IF EXISTS `mdt_reports_citizens`;
CREATE TABLE IF NOT EXISTS `mdt_reports_citizens` (
  `reportid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  KEY `FK_mdt_reports_players` (`citizenid`),
  KEY `reportid` (`reportid`),
  CONSTRAINT `FK_mdt_reports_players_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_reports_citizens: ~0 rows (approximately)
DELETE FROM `mdt_reports_citizens`;

-- Dumping structure for table qboxrp.mdt_reports_evidence
DROP TABLE IF EXISTS `mdt_reports_evidence`;
CREATE TABLE IF NOT EXISTS `mdt_reports_evidence` (
  `reportid` int(10) unsigned NOT NULL,
  `label` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(90) NOT NULL DEFAULT '',
  KEY `reportid` (`reportid`),
  CONSTRAINT `FK_mdt_reports_evidence_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_reports_evidence: ~0 rows (approximately)
DELETE FROM `mdt_reports_evidence`;

-- Dumping structure for table qboxrp.mdt_reports_officers
DROP TABLE IF EXISTS `mdt_reports_officers`;
CREATE TABLE IF NOT EXISTS `mdt_reports_officers` (
  `reportid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  KEY `FK_mdt_reports_officers_players` (`citizenid`),
  KEY `reportid` (`reportid`),
  CONSTRAINT `FK_mdt_reports_officers_mdt_reports` FOREIGN KEY (`reportid`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_reports_officers: ~0 rows (approximately)
DELETE FROM `mdt_reports_officers`;

-- Dumping structure for table qboxrp.mdt_vehicles
DROP TABLE IF EXISTS `mdt_vehicles`;
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) NOT NULL,
  `image` varchar(90) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `known_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`known_information`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_vehicles: ~0 rows (approximately)
DELETE FROM `mdt_vehicles`;

-- Dumping structure for table qboxrp.mdt_warrants
DROP TABLE IF EXISTS `mdt_warrants`;
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `incidentid` int(10) unsigned NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `expiresAt` datetime NOT NULL,
  KEY `mdt_warrants_mdt_incidents_id_fk` (`incidentid`),
  CONSTRAINT `mdt_warrants_mdt_incidents_id_fk` FOREIGN KEY (`incidentid`) REFERENCES `mdt_incidents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.mdt_warrants: ~0 rows (approximately)
DELETE FROM `mdt_warrants`;

-- Dumping structure for table qboxrp.npwd_calls
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

-- Dumping data for table qboxrp.npwd_calls: ~0 rows (approximately)
DELETE FROM `npwd_calls`;

-- Dumping structure for table qboxrp.npwd_darkchat_channels
DROP TABLE IF EXISTS `npwd_darkchat_channels`;
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qboxrp.npwd_darkchat_channels: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_channels`;

-- Dumping structure for table qboxrp.npwd_darkchat_channel_members
DROP TABLE IF EXISTS `npwd_darkchat_channel_members`;
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qboxrp.npwd_darkchat_channel_members: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_channel_members`;

-- Dumping structure for table qboxrp.npwd_darkchat_messages
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

-- Dumping data for table qboxrp.npwd_darkchat_messages: ~0 rows (approximately)
DELETE FROM `npwd_darkchat_messages`;

-- Dumping structure for table qboxrp.npwd_marketplace_listings
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

-- Dumping data for table qboxrp.npwd_marketplace_listings: ~0 rows (approximately)
DELETE FROM `npwd_marketplace_listings`;

-- Dumping structure for table qboxrp.npwd_match_profiles
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.npwd_match_profiles: ~3 rows (approximately)
DELETE FROM `npwd_match_profiles`;
INSERT INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `voiceMessage`, `createdAt`, `updatedAt`) VALUES
	(1, 'R5A1OGU6', 'ThinTrang Trn', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-08-26 04:17:18', '2024-08-26 04:17:18'),
	(4, 'T59O1D67', 'CmVn Tng', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-08-26 09:05:01', '2024-08-26 09:05:01'),
	(13, 'LA5878Q5', 'HngTng L', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-08-26 10:13:19', '2024-08-26 10:13:19'),
	(14, 'XY0CB8SV', 'TunThnh Ng', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-08-31 12:17:21', '2024-08-31 12:17:21');

-- Dumping structure for table qboxrp.npwd_match_views
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

-- Dumping data for table qboxrp.npwd_match_views: ~0 rows (approximately)
DELETE FROM `npwd_match_views`;

-- Dumping structure for table qboxrp.npwd_messages
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

-- Dumping data for table qboxrp.npwd_messages: ~0 rows (approximately)
DELETE FROM `npwd_messages`;

-- Dumping structure for table qboxrp.npwd_messages_conversations
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

-- Dumping data for table qboxrp.npwd_messages_conversations: ~0 rows (approximately)
DELETE FROM `npwd_messages_conversations`;

-- Dumping structure for table qboxrp.npwd_messages_participants
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

-- Dumping data for table qboxrp.npwd_messages_participants: ~0 rows (approximately)
DELETE FROM `npwd_messages_participants`;

-- Dumping structure for table qboxrp.npwd_notes
DROP TABLE IF EXISTS `npwd_notes`;
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.npwd_notes: ~0 rows (approximately)
DELETE FROM `npwd_notes`;

-- Dumping structure for table qboxrp.npwd_phone_contacts
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

-- Dumping data for table qboxrp.npwd_phone_contacts: ~0 rows (approximately)
DELETE FROM `npwd_phone_contacts`;

-- Dumping structure for table qboxrp.npwd_phone_gallery
DROP TABLE IF EXISTS `npwd_phone_gallery`;
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.npwd_phone_gallery: ~0 rows (approximately)
DELETE FROM `npwd_phone_gallery`;

-- Dumping structure for table qboxrp.npwd_twitter_likes
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

-- Dumping data for table qboxrp.npwd_twitter_likes: ~0 rows (approximately)
DELETE FROM `npwd_twitter_likes`;

-- Dumping structure for table qboxrp.npwd_twitter_profiles
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.npwd_twitter_profiles: ~3 rows (approximately)
DELETE FROM `npwd_twitter_profiles`;
INSERT INTO `npwd_twitter_profiles` (`id`, `profile_name`, `identifier`, `avatar_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'ThinTrang_Trn', 'R5A1OGU6', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-08-26 04:17:18', '2024-08-26 04:17:18'),
	(4, 'CmVn_Tng', 'T59O1D67', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-08-26 09:05:01', '2024-08-26 09:05:01'),
	(13, 'HngTng_L', 'LA5878Q5', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-08-26 10:13:19', '2024-08-26 10:13:19'),
	(14, 'TunThnh_Ng', 'XY0CB8SV', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-08-31 12:17:21', '2024-08-31 12:17:21');

-- Dumping structure for table qboxrp.npwd_twitter_reports
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

-- Dumping data for table qboxrp.npwd_twitter_reports: ~0 rows (approximately)
DELETE FROM `npwd_twitter_reports`;

-- Dumping structure for table qboxrp.npwd_twitter_tweets
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

-- Dumping data for table qboxrp.npwd_twitter_tweets: ~0 rows (approximately)
DELETE FROM `npwd_twitter_tweets`;

-- Dumping structure for table qboxrp.occasion_vehicles
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

-- Dumping data for table qboxrp.occasion_vehicles: ~0 rows (approximately)
DELETE FROM `occasion_vehicles`;

-- Dumping structure for table qboxrp.ox_doorlock
DROP TABLE IF EXISTS `ox_doorlock`;
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.ox_doorlock: ~6 rows (approximately)
DELETE FROM `ox_doorlock`;
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'vangelico_jewellery', '{"maxDistance":2,"groups":{"police":0},"doors":[{"model":1425919976,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582},"heading":306},{"model":9467943,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582},"heading":306}],"state":1,"coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"hideUi":true}'),
	(2, 'BigBankThermite1', '{"heading":160,"doors":false,"maxDistance":2,"hideUi":true,"groups":{"police":0},"coords":{"x":251.85757446289063,"y":221.0654754638672,"z":101.83240509033203},"model":-1508355822,"state":1,"autolock":1800}'),
	(3, 'BigBankThermite2', '{"coords":{"x":261.3004150390625,"y":214.50514221191407,"z":101.83240509033203},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":-1508355822,"doors":false,"hideUi":true,"heading":250,"state":1}'),
	(4, 'BigBankLPDoor', '{"coords":{"x":256.3115539550781,"y":220.65785217285157,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"model":-222270721,"doors":false,"lockpick":true,"hideUi":true,"heading":340,"state":1,"lockpickDifficulty":["hard"]}'),
	(5, 'PaletoThermiteDoor', '{"coords":{"x":-106.47130584716797,"y":6476.15771484375,"z":31.95479965209961},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":1309269072,"doors":false,"hideUi":true,"heading":315,"state":1}'),
	(6, 'BigBankRedCardDoor', '{"coords":{"x":262.1980895996094,"y":222.518798828125,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":746855201,"doors":false,"hideUi":true,"heading":250,"state":1}');

-- Dumping structure for table qboxrp.ox_inventory
DROP TABLE IF EXISTS `ox_inventory`;
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.ox_inventory: ~0 rows (approximately)
DELETE FROM `ox_inventory`;

-- Dumping structure for table qboxrp.players
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
) ENGINE=InnoDB AUTO_INCREMENT=1207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.players: ~2 rows (approximately)
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `phone_number`, `last_updated`, `last_logged_out`) VALUES
	(65, 'LA5878Q5', 1, 'license2:2e61abb136b0903440f13bfb1db541483f2ee4dc', 'Q4D', '{"cash":9800,"bank":8930,"crypto":0}', '{"birthdate":"1982-03-05","account":"US09QBX4401352614","phone":"3256730786","cid":1,"firstname":"HùngTường","lastname":"Lê","backstory":"placeholder backstory","nationality":"AR","gender":0}', '{"label":"Civilian","name":"unemployed","isboss":false,"grade":{"level":0,"name":"Freelancer"},"onduty":true,"payment":10}', '{"label":"No Gang","name":"none","grade":{"level":0,"name":"Unaffiliated"},"isboss":false}', '{"x":-1289.024169921875,"y":-3409.8330078125,"z":20.905517578125,"w":153.07086181640626}', '{"isdead":false,"inlaststand":false,"stress":0,"phone":[],"injail":0,"licences":{"id":true,"weapon":false,"driver":true},"status":[],"jobrep":{"trucker":0,"tow":0,"hotdog":0,"taxi":0},"weed_rep":0,"walletid":"QB-62956840","criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","hunger":0,"jailitems":[],"fingerprint":"X665M8481K1M4WP","attachmentcraftingrep":0,"health":200,"ishandcuffed":false,"thirst":0,"dealerrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":45805220},"tracker":false,"craftingrep":0,"inside":{"apartment":[]},"bloodtype":"AB+","armor":0}', '[{"metadata":{"drawable":15,"texture":0},"count":1,"slot":1,"name":"undershirt"},{"count":1,"slot":2,"name":"phone"},{"metadata":{"birthdate":"1982-03-05","sex":"M","firstname":"HùngTường","citizenid":"LA5878Q5","nationality":"AR","lastname":"Lê","badge":"none","mugShot":"data:image/png;base64,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","cardtype":"id_card"},"count":1,"slot":3,"name":"id_card"},{"metadata":{"birthdate":"1982-03-05","sex":"M","firstname":"HùngTường","citizenid":"LA5878Q5","nationality":"AR","lastname":"Lê","badge":"none","mugShot":"none","cardtype":"driver_license"},"count":1,"slot":4,"name":"driver_license"},{"count":1,"slot":5,"name":"tablet"},{"count":1,"slot":6,"name":"vpn"},{"count":1,"slot":7,"name":"fertilizer"},{"metadata":{"gender":"male","texture":0,"image":"male_mask_3_0","typeCloth":"mask","label":"Mask (3-0)","idCloth":3},"count":1,"slot":8,"name":"clothing"},{"count":2,"slot":9,"name":"deliverylist"},{"count":19,"slot":10,"name":"oxy"},{"count":18,"slot":11,"name":"rolls"},{"count":9800,"slot":12,"name":"money"},{"metadata":{"drawable":0,"texture":0},"count":1,"slot":13,"name":"bag"},{"metadata":{"gender":"male","texture":0,"image":"male_jacket_17_0","typeCloth":"jacket","label":"Blue Tank","idCloth":17},"count":1,"slot":16,"name":"clothing"},{"metadata":{"gender":"male","texture":0,"image":"male_pants_5_0","typeCloth":"pants","label":"Pants (5-0)","idCloth":5},"count":1,"slot":36,"name":"clothing"},{"metadata":{"gender":"male","texture":0,"image":"male_shoes_1_0","typeCloth":"shoes","label":"Shoes (1-0)","idCloth":1},"count":1,"slot":37,"name":"clothing"},{"metadata":{"gender":"male","texture":0,"image":"male_undershirt_15_0","typeCloth":"undershirt","label":"Shirt (15-0)","idCloth":15},"count":2,"slot":17,"name":"clothing"},{"metadata":{"gender":"male","texture":0,"image":"male_jacket_73_0","typeCloth":"jacket","label":"Pegasus T-Shirt","idCloth":73},"count":1,"slot":33,"name":"clothing"}]', '3256730786', '2024-09-01 02:16:18', '2024-08-31 18:45:05'),
	(1015, 'XY0CB8SV', 2, 'license2:2e61abb136b0903440f13bfb1db541483f2ee4dc', 'Q4D', '{"cash":99200,"bank":5080,"crypto":0}', '{"account":"US09QBX9437595362","phone":"3737114876","cid":2,"birthdate":"1990-03-01","nationality":"CL","gender":0,"lastname":"Ngô","firstname":"TuấnThành","backstory":"placeholder backstory"}', '{"name":"unemployed","label":"Civilian","payment":10,"isboss":false,"grade":{"level":0,"name":"Freelancer"},"onduty":true}', '{"grade":{"level":0,"name":"Unaffiliated"},"name":"none","label":"No Gang","isboss":false}', '{"x":305.22198486328127,"y":-847.4769287109375,"z":29.128173828125,"w":85.03936767578125}', '{"walletid":"QB-95760824","health":200,"phonedata":{"InstalledApps":[],"SerialNumber":22192567},"attachmentcraftingrep":0,"fingerprint":"622589LH0316A1T","jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"jailitems":[],"stress":0,"criminalrecord":{"hasRecord":false},"inlaststand":false,"callsign":"NO CALLSIGN","injail":0,"isdead":false,"inside":{"apartment":[]},"bloodtype":"B-","thirst":58.20000000000003,"weed_rep":0,"ishandcuffed":false,"status":[],"craftingrep":0,"tracker":false,"armor":0,"hunger":53.79999999999997,"phone":[],"licences":{"weapon":false,"id":true,"driver":true},"dealerrep":0}', '[{"count":99200,"slot":1,"name":"money"},{"count":1,"slot":2,"name":"phone"},{"count":1,"metadata":{"citizenid":"XY0CB8SV","nationality":"CL","badge":"none","cardtype":"id_card","firstname":"TuấnThành","mugShot":"none","birthdate":"1990-03-01","sex":"M","lastname":"Ngô"},"slot":3,"name":"id_card"},{"count":1,"metadata":{"citizenid":"XY0CB8SV","nationality":"CL","badge":"none","cardtype":"driver_license","firstname":"TuấnThành","mugShot":"none","birthdate":"1990-03-01","sex":"M","lastname":"Ngô"},"slot":4,"name":"driver_license"},{"count":1,"metadata":{"texture":0,"typeCloth":"jacket","gender":"male","label":"Light Gray Jacket","image":"male_jacket_24_0","idCloth":24},"slot":5,"name":"clothing"},{"count":1,"metadata":{"texture":10,"typeCloth":"shoes","gender":"male","label":"Shoes (0-10)","image":"male_shoes_0_10","idCloth":0},"slot":6,"name":"clothing"},{"count":1,"metadata":{"texture":5,"typeCloth":"shoes","gender":"male","label":"Shoes (1-5)","image":"male_shoes_1_5","idCloth":1},"slot":7,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"undershirt","label":"Shirt (15-0)","gender":"male","image":"male_undershirt_15_0","idCloth":15},"slot":8,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"undershirt","label":"White Cuffed Shirt","gender":"male","image":"male_undershirt_31_0","idCloth":31},"slot":10,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"pants","gender":"male","label":"Black Skinny Suit Pantss","image":"male_pants_24_0","idCloth":24},"slot":11,"name":"clothing"},{"count":1,"metadata":{"texture":3,"typeCloth":"undershirt","label":"Pale Blue Cuffed Shirt","gender":"male","image":"male_undershirt_31_3","idCloth":31},"slot":12,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"jacket","label":"Chestnut Leather Jacket","gender":"male","image":"male_jacket_37_0","idCloth":37},"slot":16,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"pants","gender":"male","label":"Pants (4-0)","image":"male_pants_4_0","idCloth":4},"slot":36,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"shoes","gender":"male","label":"Shoes (1-0)","image":"male_shoes_1_0","idCloth":1},"slot":37,"name":"clothing"},{"count":2,"metadata":{"texture":0,"typeCloth":"jacket","label":"Black Smooth Fitted","gender":"male","image":"male_jacket_30_0","idCloth":30},"slot":18,"name":"clothing"},{"count":1,"metadata":{"texture":0,"typeCloth":"jacket","gender":"male","label":"Jacket (1-0)","image":"male_jacket_1_0","idCloth":1},"slot":33,"name":"clothing"}]', '3737114876', '2024-08-31 13:54:03', '2024-08-31 13:54:03');

-- Dumping structure for table qboxrp.playerskins
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.playerskins: ~3 rows (approximately)
DELETE FROM `playerskins`;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(65, 'LA5878Q5', 'mp_f_freemode_01', '{"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"eyeColor":-1,"tattoos":[],"model":"mp_f_freemode_01","hair":{"highlight":0,"texture":0,"style":0,"color":0},"headOverlays":{"sunDamage":{"secondColor":0,"color":0,"style":0,"opacity":0},"blemishes":{"secondColor":0,"color":0,"style":0,"opacity":0},"ageing":{"secondColor":0,"color":0,"style":0,"opacity":0},"makeUp":{"secondColor":0,"color":0,"style":0,"opacity":0},"complexion":{"secondColor":0,"color":0,"style":0,"opacity":0},"beard":{"secondColor":0,"color":0,"style":0,"opacity":0},"lipstick":{"secondColor":0,"color":0,"style":0,"opacity":0},"chestHair":{"secondColor":0,"color":0,"style":0,"opacity":0},"moleAndFreckles":{"secondColor":0,"color":0,"style":0,"opacity":0},"blush":{"secondColor":0,"color":0,"style":0,"opacity":0},"bodyBlemishes":{"secondColor":0,"color":0,"style":0,"opacity":0},"eyebrows":{"secondColor":0,"color":0,"style":0,"opacity":0}},"headBlend":{"skinMix":0.1,"skinThird":0,"thirdMix":0,"shapeSecond":21,"shapeFirst":45,"shapeThird":0,"skinFirst":20,"shapeMix":0.3,"skinSecond":15},"faceFeatures":{"jawBoneWidth":0,"nosePeakLowering":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"eyeBrownForward":0,"noseBoneHigh":0,"nosePeakHigh":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"neckThickness":0,"noseBoneTwist":0,"cheeksWidth":0,"noseWidth":0,"nosePeakSize":0,"cheeksBoneHigh":0,"chinBoneSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"lipsThickness":0},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}]}', 0),
	(82, 'LA5878Q5', 'mp_m_freemode_01', '{"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"eyeColor":-1,"faceFeatures":{"eyeBrownHigh":0.0,"nosePeakHigh":0.0,"chinBoneLowering":0.0,"jawBoneWidth":0.0,"noseWidth":0.0,"lipsThickness":0.0,"noseBoneTwist":0.0,"chinBoneSize":0.0,"jawBoneBackSize":0.0,"nosePeakSize":0.0,"cheeksBoneHigh":0.0,"neckThickness":0.0,"eyeBrownForward":0.0,"cheeksWidth":0.0,"chinBoneLenght":0.0,"chinHole":0.0,"noseBoneHigh":0.0,"cheeksBoneWidth":0.0,"eyesOpening":0.0,"nosePeakLowering":0.0},"model":"mp_m_freemode_01","headOverlays":{"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":5,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":1,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":73,"component_id":11}],"tattoos":[],"headBlend":{"shapeMix":0.0,"skinThird":0,"skinFirst":0,"shapeSecond":0,"skinMix":0.0,"shapeFirst":0,"shapeThird":0,"thirdMix":0.0,"skinSecond":0},"hair":{"color":0,"highlight":0,"style":0,"texture":0}}', 1),
	(152, 'XY0CB8SV', 'mp_m_freemode_01', '{"faceFeatures":{"cheeksWidth":0.0,"noseWidth":0.0,"eyeBrownHigh":0.0,"cheeksBoneWidth":0.0,"jawBoneBackSize":0.0,"lipsThickness":0.0,"chinBoneLowering":0.0,"cheeksBoneHigh":0.0,"jawBoneWidth":0.0,"nosePeakHigh":0.0,"eyesOpening":0.0,"noseBoneHigh":0.0,"eyeBrownForward":0.0,"chinBoneLenght":0.0,"chinBoneSize":0.0,"nosePeakLowering":0.0,"neckThickness":0.0,"nosePeakSize":0.0,"noseBoneTwist":0.0,"chinHole":0.0},"model":"mp_m_freemode_01","eyeColor":-1,"headOverlays":{"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0}},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":4},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":1},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":15},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":1}],"tattoos":[],"hair":{"texture":0,"style":0,"highlight":0,"color":0},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"headBlend":{"shapeMix":0.0,"skinSecond":0,"shapeThird":0,"skinMix":0.0,"skinFirst":0,"shapeFirst":0,"thirdMix":0.0,"shapeSecond":0,"skinThird":0}}', 1);

-- Dumping structure for table qboxrp.player_groups
DROP TABLE IF EXISTS `player_groups`;
CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.player_groups: ~0 rows (approximately)
DELETE FROM `player_groups`;

-- Dumping structure for table qboxrp.player_houses
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

-- Dumping data for table qboxrp.player_houses: ~0 rows (approximately)
DELETE FROM `player_houses`;

-- Dumping structure for table qboxrp.player_mails
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

-- Dumping data for table qboxrp.player_mails: ~0 rows (approximately)
DELETE FROM `player_mails`;

-- Dumping structure for table qboxrp.player_outfits
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

-- Dumping data for table qboxrp.player_outfits: ~0 rows (approximately)
DELETE FROM `player_outfits`;

-- Dumping structure for table qboxrp.player_outfit_codes
DROP TABLE IF EXISTS `player_outfit_codes`;
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.player_outfit_codes: ~0 rows (approximately)
DELETE FROM `player_outfit_codes`;

-- Dumping structure for table qboxrp.player_transactions
DROP TABLE IF EXISTS `player_transactions`;
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.player_transactions: ~0 rows (approximately)
DELETE FROM `player_transactions`;

-- Dumping structure for table qboxrp.player_vehicles
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

-- Dumping data for table qboxrp.player_vehicles: ~0 rows (approximately)
DELETE FROM `player_vehicles`;

-- Dumping structure for table qboxrp.player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.player_warns: ~0 rows (approximately)
DELETE FROM `player_warns`;

-- Dumping structure for table qboxrp.properties
DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qboxrp.properties: ~1 rows (approximately)
DELETE FROM `properties`;
INSERT INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(8, 'LA5878Q5', NULL, NULL, 'This is HùngTường Lê\'s apartment in South Rockford Drive', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'South Rockford Drive', '{"x":-667.02001953125,"y":-1105.239990234375,"z":14.63000011444091,"w":242.32000732421876}', '[]'),
	(9, 'XY0CB8SV', NULL, NULL, 'This is TuấnThành Ngô\'s apartment in South Rockford Drive', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'South Rockford Drive', '{"x":-667.02001953125,"y":-1105.239990234375,"z":14.63000011444091,"w":242.32000732421876}', '[]');

-- Dumping structure for table qboxrp.rnotes
DROP TABLE IF EXISTS `rnotes`;
CREATE TABLE IF NOT EXISTS `rnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noteid` varchar(50) NOT NULL DEFAULT '0',
  `citizenid` varchar(100) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qboxrp.rnotes: ~0 rows (approximately)
DELETE FROM `rnotes`;

-- Dumping structure for table qboxrp.strain
DROP TABLE IF EXISTS `strain`;
CREATE TABLE IF NOT EXISTS `strain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `n` int(2) DEFAULT 0,
  `p` int(2) DEFAULT 0,
  `k` int(2) DEFAULT 0,
  `rep` int(2) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qboxrp.strain: ~2 rows (approximately)
DELETE FROM `strain`;
INSERT INTO `strain` (`id`, `owner`, `name`, `n`, `p`, `k`, `rep`) VALUES
	(1, 'LA5878Q5', 'Afghani Wonder Platinum Chase', 1, 1, 1, 0),
	(2, 'LA5878Q5', 'Afghani Wonder Pineapple Chase', 1, 2, 1, 0),
	(3, 'LA5878Q5', 'Afghani Wonder Remus Chase', 1, 16, 1, 0);

-- Dumping structure for table qboxrp.vehicle_financing
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

-- Dumping data for table qboxrp.vehicle_financing: ~0 rows (approximately)
DELETE FROM `vehicle_financing`;

-- Dumping structure for table qboxrp.weed_plants
DROP TABLE IF EXISTS `weed_plants`;
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  `z` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT 0,
  `water` float DEFAULT 10,
  `strain` text DEFAULT NULL,
  `harvest` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qboxrp.weed_plants: ~0 rows (approximately)
DELETE FROM `weed_plants`;

-- Create Table for Fuel Stations --
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) DEFAULT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB;

-- Insert Default Information into the Table Created! --
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (1, 0, '0', 100000, 3, 0, 'Davis Avenue Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (2, 0, '0', 100000, 3, 0, 'Grove Street LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (3, 0, '0', 100000, 3, 0, 'Dutch London Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (4, 0, '0', 100000, 3, 0, 'Little Seoul LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (5, 0, '0', 100000, 3, 0, 'Strawberry Ave Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (6, 0, '0', 100000, 3, 0, 'Popular Street Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (7, 0, '0', 100000, 3, 0, 'Capital Blvd Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (8, 0, '0', 100000, 3, 0, 'Mirror Park LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (9, 0, '0', 100000, 3, 0, 'Clinton Ave Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (10, 0, '0', 100000, 3, 0, 'North Rockford Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (11, 0, '0', 100000, 3, 0, 'Great Ocean Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (12, 0, '0', 100000, 3, 0, 'Paleto Blvd Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (13, 0, '0', 100000, 3, 0, 'Paleto Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (14, 0, '0', 100000, 3, 0, 'Paleto Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (15, 0, '0', 100000, 3, 0, 'Grapeseed LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (16, 0, '0', 100000, 3, 0, 'Sandy Shores Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (17, 0, '0', 100000, 3, 0, 'Sandy Shores Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (18, 0, '0', 100000, 3, 0, 'Senora Freeway Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (19, 0, '0', 100000, 3, 0, 'Harmony Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (20, 0, '0', 100000, 3, 0, 'Route 68 Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (21, 0, '0', 100000, 3, 0, 'Route 68 Workshop Globe O');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (22, 0, '0', 100000, 3, 0, 'Route 68 Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (23, 0, '0', 100000, 3, 0, 'Route 68 Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (24, 0, '0', 100000, 3, 0, "Rex\'s Diner Globe Oil");
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (25, 0, '0', 100000, 3, 0, 'Palmino Freeway Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (26, 0, '0', 100000, 3, 0, 'North Rockford LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (27, 0, '0', 100000, 3, 0, 'Alta Street Globe Oil');


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

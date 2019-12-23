CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `essentialmode`;

CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `type` text DEFAULT NULL,
  `slot` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `disc_inventory_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `meta` tinyint(1) NOT NULL DEFAULT 0,
  `itemurl` text COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `disc_inventory_owner_type_index` (
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
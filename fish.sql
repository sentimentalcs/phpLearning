/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : fish

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-09-04 20:04:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `exchange_rate`;
CREATE TABLE `exchange_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL COMMENT '游戏id',
  `money` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分值',
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标准汇率',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 0表示废弃 1表示正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exchange_rate
-- ----------------------------

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏简介',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1表示经营 2 暂停经营',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of game
-- ----------------------------

-- ----------------------------
-- Table structure for integration
-- ----------------------------
DROP TABLE IF EXISTS `integration`;
CREATE TABLE `integration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '客户姓名',
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '积分余额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of integration
-- ----------------------------

-- ----------------------------
-- Table structure for integration_rule
-- ----------------------------
DROP TABLE IF EXISTS `integration_rule`;
CREATE TABLE `integration_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `limit_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户姓名',
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '积分余额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of integration_rule
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_09_02_042513_create_order_table', '1');
INSERT INTO `migrations` VALUES ('4', '2017_09_02_044041_create_exchange_rate_table', '1');
INSERT INTO `migrations` VALUES ('5', '2017_09_02_045420_add_votes_to_order_table', '1');
INSERT INTO `migrations` VALUES ('6', '2017_09_02_073659_rename_votes_to_exchange_rate_table', '1');
INSERT INTO `migrations` VALUES ('7', '2017_09_02_074307_create_game_table', '1');
INSERT INTO `migrations` VALUES ('8', '2017_09_02_081658_dropvote_to_order_table', '1');
INSERT INTO `migrations` VALUES ('9', '2017_09_02_082032_dropanothervote_to_order_table', '1');
INSERT INTO `migrations` VALUES ('10', '2017_09_03_061640_add_integration_table', '1');
INSERT INTO `migrations` VALUES ('11', '2017_09_03_062335_add_integration_rule_table', '1');
INSERT INTO `migrations` VALUES ('12', '2017_09_03_065603_create_prize', '1');
INSERT INTO `migrations` VALUES ('13', '2017_09_03_080123_create_prize_detail', '1');
INSERT INTO `migrations` VALUES ('14', '2017_09_04_084622_create_wheel_settings_table', '2');
INSERT INTO `migrations` VALUES ('15', '2017_09_04_095527_create_user_coupons_table', '3');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '客户id',
  `game_id` int(11) NOT NULL COMMENT '游戏id',
  `game_account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏账号',
  `money` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '金额',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分值',
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '1表示新订单 2表示正在上分 3表示已完成',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 0表示废弃 1表示正常',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `prize_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '奖品主键',
  `probability` double NOT NULL COMMENT '中奖概率',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prize_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES ('1', '10', null, null);
INSERT INTO `prize` VALUES ('2', '15', null, null);
INSERT INTO `prize` VALUES ('3', '5', null, null);
INSERT INTO `prize` VALUES ('4', '10', null, null);
INSERT INTO `prize` VALUES ('5', '0', null, null);

-- ----------------------------
-- Table structure for prize_detail
-- ----------------------------
DROP TABLE IF EXISTS `prize_detail`;
CREATE TABLE `prize_detail` (
  `prize_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '奖品详情表主键',
  `prize_id` int(11) NOT NULL COMMENT 'prize表外键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖品名称',
  `deposit` double NOT NULL COMMENT '充值金额单位元 0-直接送',
  `prize` double NOT NULL COMMENT '赠送的游戏币单位万',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prize_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prize_detail
-- ----------------------------
INSERT INTO `prize_detail` VALUES ('1', '1', '满50送100', '50', '100', null, null);
INSERT INTO `prize_detail` VALUES ('2', '2', '送100', '0', '100', null, null);
INSERT INTO `prize_detail` VALUES ('3', '3', '送300', '0', '300', null, null);
INSERT INTO `prize_detail` VALUES ('4', '4', '满100送100', '0', '100', null, null);
INSERT INTO `prize_detail` VALUES ('5', '5', '谢谢参与', '0', '0', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headImgUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Norbert Gleichner Sr.', 'Mrs. Mariah Upton', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', 'a123456', 'chasity77@example.net', '1-920-393-8620 x595', 'http://www.rogahn.net/eum-nihil-pariatur-voluptatibus-fuga-illum', '', 'Peggieberg', '889', '281', '0', 'BCGHlTIbEDtnhW4h5Gnnfay1E5k302WD11vntDvLRqWtRivVIiRGcNaLoA39', '2017-09-03 08:22:26', '2017-09-03 15:48:33');
INSERT INTO `users` VALUES ('2', 'Lillian Stokes I', 'Antwan Welch MD', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', '1@qq.com', '+1-789-417-2413', 'http://robel.net/rerum-fuga-quibusdam-rerum-odio-similique-nam-deleniti-vero', '', 'South Ewell', '874', '983', '0', 'HWrkgFy7FI', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('3', 'Jazmin Hartmann', 'Ms. Keira Mante IV', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'llewellyn.hessel@example.net', '687-769-6255 x33261', 'http://quigley.com/reprehenderit-aliquam-fuga-voluptatum-molestiae-recusandae', '', 'Cameronmouth', '287', '799', '0', 'AKAZgFzhuc', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('4', 'Betsy Ferry', 'Tomasa Jerde III', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'erika70@example.net', '927-344-7633', 'http://www.abernathy.biz/aliquam-officia-suscipit-qui-amet-ut-autem-error-aliquid', '', 'Jakubowskiton', '117', '918', '0', 'UEmqmzsAlp', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('5', 'Eula Wisozk', 'Dr. Jana Leffler DDS', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'arath@example.net', '1-416-521-1465', 'http://langworth.com/', '', 'Wehnerside', '494', '887', '0', 'RkzvKuC5Z2', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('6', 'Seamus Gottlieb III', 'Mrs. Maddison Legros II', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'osinski.consuelo@example.net', '212-476-1442 x843', 'http://lynch.com/et-voluptatem-qui-velit-officiis-blanditiis-ducimus-saepe-voluptatem', '', 'North Heaventon', '344', '786', '0', '8wGv2tmrZl', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('7', 'Cassandre Spinka', 'Sterling Kuhn', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'lonie16@example.org', '+14689165252', 'http://funk.info/consequatur-consequatur-soluta-quasi-voluptas.html', '', 'Marisolshire', '742', '740', '0', 'cmHuVt8PUx', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('8', 'Alisha Considine', 'Lorna Heathcote Jr.', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'joshuah53@example.net', '+14248658238', 'https://veum.net/est-voluptatum-similique-maxime-nihil-porro-facilis.html', '', 'Lake Phoebebury', '636', '750', '0', 'WoN8BsEW9W', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('9', 'Mellie Greenfelder I', 'Ms. Liza Howell', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'elwyn56@example.org', '558.677.9857 x023', 'http://www.swift.com/', '', 'Mullerfort', '393', '264', '0', 'nkxiSLOo9N', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('10', 'Dr. Teresa Wintheiser', 'Everett Steuber', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'hansen.maverick@example.com', '(614) 725-5608 x817', 'http://kihn.com/repudiandae-aspernatur-dolorum-sint-dolores-repellat-eum-voluptatem-laborum.html', '', 'North Anneburgh', '299', '623', '0', 'xdCdMjfk8i', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('11', 'Elmore Barrows', 'Prof. Vivian Mraz II', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'powlowski.waylon@example.org', '+1-384-637-5252', 'http://williamson.info/est-rem-ab-vitae-dolore-maxime.html', '', 'Kundeside', '659', '822', '0', '5VJTDrQH70', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('12', 'Aurelia Zboncak', 'Prof. Lenny Waters MD', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'pouros.alayna@example.org', '638-349-0104', 'http://www.bauch.org/', '', 'Richiehaven', '456', '554', '0', '4Hn34VUq01', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('13', 'Prof. Meagan Bins', 'Efren Farrell Jr.', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'gene.reinger@example.net', '258-215-1412 x030', 'http://hansen.com/ipsam-fugiat-necessitatibus-sit-est-sint-doloremque-dolor', '', 'Ludiechester', '887', '227', '0', 'XkfbzS8xTF', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('14', 'Jace Will', 'Ashley Nitzsche', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'hand.osvaldo@example.net', '+15424419412', 'http://koepp.com/amet-aliquam-numquam-consectetur-provident-corrupti', '', 'Port Jonathonton', '655', '292', '0', 'UWMJlU2qwk', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('15', 'Prof. Colin Stamm', 'Prof. Brandon Krajcik', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'aurelia.flatley@example.com', '1-992-551-2818', 'https://armstrong.com/veritatis-necessitatibus-et-earum-quis-fugit-cumque.html', '', 'Austinbury', '566', '305', '0', 'o3mmuHjlBI', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('16', 'Elvera Hamill', 'Dr. Fleta Dach Sr.', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'ena10@example.org', '+1.639.532.3054', 'http://www.thompson.info/', '', 'West Malika', '123', '454', '0', 'h09KlpS5Xb', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('17', 'Mrs. Lysanne Kerluke', 'Devante Herman', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'labadie.lorena@example.org', '1-604-407-6080 x8130', 'http://www.balistreri.com/quo-voluptates-omnis-amet-atque.html', '', 'Santiagomouth', '487', '897', '0', 'FMwoVRyVvO', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('18', 'Miss Carolina Torphy', 'Kallie Windler I', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'alexie25@example.net', '1-457-577-1690 x95021', 'https://kovacek.com/repellendus-qui-assumenda-distinctio-consequatur.html', '', 'Mckaylastad', '437', '674', '0', 'fSwqy46ZNL', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('19', 'Reanna Hilpert IV', 'Mireille Farrell', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'eudora.schaefer@example.com', '+1.656.391.9786', 'http://lynch.biz/', '', 'Schowalterfort', '696', '454', '0', 'JFFccpJb0o', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('20', 'Jerod Mitchell', 'Mr. Hailey Gusikowski DVM', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'istokes@example.net', '205-325-6749 x82256', 'http://haag.com/alias-voluptate-officia-totam-iure-quos.html', '', 'South Micheleberg', '591', '189', '0', 'fDyFpb38UU', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('21', 'Mathilde Medhurst', 'Dimitri Bins', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'tremblay.newton@example.org', '+18755933241', 'http://www.schinner.org/', '', 'Serenityborough', '341', '836', '0', 'mEba1Fd1gb', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('22', 'Sarina Olson III', 'Prof. Edgar Hoppe MD', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'maybell.homenick@example.org', '1-696-663-9473 x101', 'http://www.borer.com/minus-mollitia-aut-odit-neque-maiores-minus-reprehenderit', '', 'Lake Eduardo', '876', '983', '0', 'UutSXKWIoQ', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('23', 'Natasha Bradtke', 'Kade Beahan', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'vicky.weimann@example.org', '+1.231.578.7194', 'https://www.maggio.com/voluptatibus-ipsa-culpa-tenetur-non-molestias', '', 'Craigstad', '575', '511', '0', 'ZksTmOHLtP', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('24', 'Mrs. Zelda Skiles', 'Floyd Schiller', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'mose08@example.com', '(783) 939-2882', 'http://www.ledner.com/veniam-cumque-et-culpa-dolor', '', 'South Darrelltown', '732', '869', '0', 'ibg9GbhvD8', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('25', 'D\'angelo Prohaska', 'Kiel Lakin', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'cfay@example.org', '1-252-912-8290 x06237', 'http://olson.com/repellendus-iste-qui-quia-est-explicabo-commodi-voluptatem.html', '', 'Romainetown', '676', '932', '0', 'fw9ftKULQJ', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('26', 'Peyton Luettgen', 'Oda Lindgren', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'pfannerstill.alvah@example.net', '1-832-774-1510', 'https://www.gleichner.com/ut-tenetur-non-nihil-assumenda-et-possimus-expedita-magnam', '', 'Ullrichfort', '491', '335', '0', '74PH8Y1e3M', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('27', 'Dr. Amir Oberbrunner', 'Greyson Lebsack', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'janiya80@example.net', '+1 (382) 814-7569', 'https://goldner.com/quis-illum-vel-non-nostrum-suscipit.html', '', 'Ernafurt', '753', '847', '0', 'jTGomWCkta', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('28', 'Prof. Rex Okuneva I', 'Jamarcus Ryan', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'casper.kayden@example.com', '1-215-838-8568 x41384', 'http://www.hahn.com/vero-tempora-veniam-autem-ipsam-provident-omnis.html', '', 'Port Kareemport', '789', '640', '0', 'OuPJHamhfQ', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('29', 'Freida Conroy PhD', 'Mr. Kelley Swaniawski II', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'rolfson.cecelia@example.net', '763-202-8203 x883', 'https://braun.org/velit-et-fugiat-non-molestias-blanditiis-deleniti-totam.html', '', 'Miketon', '975', '444', '0', 'R737ikMMRZ', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('30', 'Kirstin Casper', 'Mr. Nolan Emmerich', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'ada77@example.com', '(339) 434-9567', 'http://heller.com/inventore-ipsa-animi-rerum-iusto-facilis', '', 'Auerfurt', '832', '540', '0', 'jP2z9ulXIh', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('31', 'Edwin O\'Conner', 'Ivy Bailey', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'rudy.gislason@example.com', '(690) 346-4267 x505', 'https://bogan.com/in-error-cupiditate-possimus-est.html', '', 'South Jovanny', '650', '855', '0', 'tR1YbwxX0q', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('32', 'Kurt Ernser MD', 'Mrs. Peggie Bernhard II', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'maryam.cole@example.net', '(914) 247-0881 x692', 'https://www.west.com/enim-molestiae-eum-cum-quia-laboriosam-iure', '', 'East Shanyport', '895', '136', '0', 'n4Mf1hDu1c', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('33', 'Prof. Ezequiel Robel V', 'Paolo Koelpin III', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'oberbrunner.hilario@example.net', '808-673-8194 x82837', 'http://www.braun.com/explicabo-tempora-autem-est-rerum-nostrum-mollitia.html', '', 'Williemouth', '752', '331', '0', 'btysBKQCVx', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('34', 'Prof. Bert Conn PhD', 'Otis Bernier', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'muller.irwin@example.org', '1-801-452-8231 x573', 'https://www.bernier.biz/sed-dignissimos-laborum-cum-ipsam-reprehenderit-maxime', '', 'Kozeymouth', '711', '447', '0', 'zF1DTBcrmL', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('35', 'Miss Clarissa Schinner Sr.', 'Kailyn Reynolds', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'ytorphy@example.com', '+1-665-756-6942', 'http://www.kunde.com/necessitatibus-minus-esse-totam-delectus-possimus-consequatur-quis-perspiciatis.html', '', 'South Roxanne', '686', '301', '0', '3xWXeu8cWO', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('36', 'Mr. Wilbert Stark PhD', 'Dr. Mason Pacocha DVM', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'maxwell.robel@example.org', '+1 (856) 809-3257', 'https://nikolaus.biz/non-vitae-iste-asperiores-quod-unde-qui-quia.html', '', 'Mafaldafort', '537', '927', '0', 'bQjWWWDUgn', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('37', 'Dr. Cora Kshlerin', 'Jeanette Schulist', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'ndouglas@example.net', '1-484-475-8829 x9863', 'http://www.bins.info/enim-assumenda-cupiditate-quibusdam-qui', '', 'Hirtheburgh', '136', '412', '0', 'CbKFfLcrWV', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('38', 'Mr. Olin Mann V', 'Vernon Schulist III', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'nikolaus.trycia@example.com', '1-725-616-9415 x45367', 'http://www.hauck.com/soluta-incidunt-nulla-cum-id-ex-dolorem', '', 'Andyberg', '909', '612', '0', 'ZFBuQPHVxo', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('39', 'Jennie Huel', 'Burnice Koss V', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'botsford.liam@example.net', '(582) 472-5999 x949', 'http://cassin.com/dolore-non-nesciunt-necessitatibus-molestiae-dignissimos-nostrum-dolore-accusantium', '', 'Carleyburgh', '824', '641', '0', 'DolokvF7jg', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('40', 'Mrs. Alexandrea Jacobson DDS', 'George Hodkiewicz', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'mable.toy@example.net', '+1-327-584-1419', 'http://orn.org/ratione-doloremque-deleniti-eius-quisquam.html', '', 'South Muhammadmouth', '480', '499', '0', 'cuz6WLtYaO', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('41', 'Jasen Skiles Sr.', 'Haylie Ernser MD', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'shanie.osinski@example.com', '+1-710-830-3970', 'https://hudson.com/quibusdam-qui-quaerat-voluptas-dolores.html', '', 'Port Marcellusport', '573', '872', '0', 'GefukL7xon', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('42', 'Miss Katarina Wolff Jr.', 'Mr. Cristian Ratke', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'kullrich@example.org', '302-844-8741', 'http://kerluke.com/qui-nostrum-maxime-commodi-tempore-ut-soluta-quasi', '', 'New Kimberlymouth', '734', '326', '0', '92w8oKWHNb', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('43', 'Tabitha Hamill', 'Laurine Schaden', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'cnitzsche@example.org', '1-661-250-6943 x978', 'http://bauch.net/sint-exercitationem-natus-voluptatem-ab', '', 'Wisokyburgh', '718', '523', '0', 'cywJzkakBl', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('44', 'Ms. Hassie Effertz', 'Guy Haag DDS', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'erunolfsdottir@example.org', '+1-215-459-3863', 'http://www.boyer.com/consequuntur-eos-soluta-veniam-vel-inventore', '', 'New Colbyfort', '866', '693', '0', 'NzZVjaQHOh', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('45', 'Chris Gislason', 'Bartholome McCullough I', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'hspencer@example.com', '1-745-597-1343 x7228', 'http://gaylord.info/doloribus-tempore-aut-alias-qui-nemo', '', 'South Macie', '867', '698', '0', 'hUxbk3Ygzw', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('46', 'Yvonne Oberbrunner', 'George Kiehn', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'frami.terrill@example.com', '780.679.4918 x86263', 'http://carter.com/commodi-et-fugit-accusamus-consequuntur-aliquid-eaque.html', '', 'Feestfurt', '233', '517', '0', 'rv7HrSkJk3', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('47', 'Mrs. Keara Casper', 'Shana Schamberger', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'jones.rylan@example.com', '+1 (403) 844-4384', 'http://waters.com/', '', 'O\'Connerstad', '553', '127', '0', '6TPmpwGIAp', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('48', 'Ms. Kelly Stark', 'Lexi Effertz', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'kristoffer.cronin@example.net', '1-676-673-3483', 'http://kessler.com/ipsam-et-consequatur-unde-inventore', '', 'Jamiefurt', '553', '304', '0', 'aGIwY9lqfk', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('49', 'Emelia Klocko', 'Casimer Walsh', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'kraig.wunsch@example.com', '+1 (773) 967-8810', 'http://www.gutmann.com/optio-officia-quae-sint-repellendus-voluptatem', '', 'Mittiechester', '358', '263', '0', 'quFfIxPNN6', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('50', 'Genevieve Prosacco', 'Gussie Wisozk', '$2y$10$mKcRhGesYTOZ5NCZKa/G2eN46bmd55TOqA1wd8fM7VOqy8IVqS9Te', '', 'bergstrom.paolo@example.org', '743-407-0997 x29714', 'http://kiehn.org/', '', 'Kristown', '652', '945', '0', 'KxrRYIUTQi', '2017-09-03 08:22:26', '2017-09-03 08:22:26');
INSERT INTO `users` VALUES ('51', 'ycg', null, '$2y$10$9.e88Yw9cMoEv8WzvKOgVe0ju9/EN32PqvnV52eyVTIWseTfMqMTS', '', 'ycg@ycg.com', null, null, null, null, '0', '0', '0', 'MBMC2ylaacRIaJanHpLR5qhIBi5u4AroFpAjX3xoH5NaaCGwZbwDeF8Mwzsd', '2017-09-04 02:33:22', '2017-09-04 02:33:22');
INSERT INTO `users` VALUES ('52', 'zzq', null, '$2y$10$CaEjIWZvPNBWEMP8581qd./493Q/PiOxXKLDsnMzqXHraqopXZmDO', '', 'zzq@163.com', null, null, null, null, '0', '0', '0', null, '2017-09-04 06:20:13', '2017-09-04 06:20:13');

-- ----------------------------
-- Table structure for user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `user_coupons`;
CREATE TABLE `user_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'users表的外键',
  `prize_detail_id` int(11) NOT NULL COMMENT 'prize_detail表的外键',
  `expire_time` int(11) NOT NULL COMMENT '过期时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_coupons
-- ----------------------------
INSERT INTO `user_coupons` VALUES ('1', '1', '2', '111', '111', null, null);
INSERT INTO `user_coupons` VALUES ('2', '2', '3', '3', '3', null, null);

-- ----------------------------
-- Table structure for wheel_settings
-- ----------------------------
DROP TABLE IF EXISTS `wheel_settings`;
CREATE TABLE `wheel_settings` (
  `wheel_setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `finish_time` int(11) NOT NULL COMMENT '活动结束时间',
  `play_num` tinyint(4) NOT NULL COMMENT '每人每天可抽奖次数',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动规则',
  `valid_time` int(11) NOT NULL COMMENT '卡券的有效时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`wheel_setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wheel_settings
-- ----------------------------
INSERT INTO `wheel_settings` VALUES ('1', '1504515547', '1505059200', '2', '1.每位获奖会员请到个人中心奖券栏中查看\r\n2. 每位会员每天有且仅有一次抽奖资格；\r\n3. 对未按照活动规则参与抽奖，或不符合抽奖资格的会员，活动主办方有权取消其抽奖资格，并收回其抽奖所获得奖品；\r\n4. 会员参加活动的否成功，以活动页面提示为准，如因网络系统异常问题，导致无法参与抽奖，将不给予补偿；\r\n5. 本活动由XXX公司独家承办\r\n6. XXX公司拥有此次活动的最终解释权', '8', null, null);

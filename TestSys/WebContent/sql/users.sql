- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL  auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20130521001 DEFAULT CHARSET=utf8;

--INSERT INTO `users`(name)  VALUES ( 'Ä½°×');
INSERT INTO `users` VALUES ('2013052101', 'ÄÂÇà');
INSERT INTO `users` VALUES ('2013052102', 'äìÏæ');
INSERT INTO `users` VALUES ('2013052103', 'ÄÂ°Ø');
INSERT INTO `users` VALUES ('2013052104', 'ÏôºÎ');
INSERT INTO `users` VALUES ('2013052105', 'Ïôºì');
INSERT INTO `users` VALUES ('2013052106', 'ÏôÇà');
INSERT INTO `users` VALUES ('2013052107', 'ÏôÇà£¬¼Ó');
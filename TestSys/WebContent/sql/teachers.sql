DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `tid` int(11) NOT NULL  auto_increment,
  `name` varchar(15) NOT NULL,
  password varchar(15)  NOT NULL ,
  academy varchar(20) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;


INSERT INTO `teachers` VALUES ('2010052101', '王哲远','2101','商学院');
--INSERT INTO `teachers` VALUES ('2010052102', '王皓','2102','商学院');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052103', '杨敏','2103');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052104', '杨元','2104');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052105', '霍金','2105');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052106', '瞿秋白','2106');
INSERT INTO `teachers`(name,password) VALUES ('杨敏浩','2103');
INSERT INTO `teachers` VALUES ('20100521001', '王豪','2101','商学院');
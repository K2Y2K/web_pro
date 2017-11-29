DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `sid` int(11) NOT NULL  auto_increment,
  `name` varchar(15) NOT NULL,
  password varchar(15)   NULL ,
 banji varchar(20) default NULL,
  academy varchar(20) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=20130521001 DEFAULT CHARSET=utf8;

INSERT INTO `students` VALUES ('2013052101', '穆青','101','信管1302','商学院');
INSERT INTO `students` VALUES ('2013052102', '潇湘','102','信管1302','商学院');
INSERT INTO `students`(sid,name,password) VALUES ('2013052103', '穆柏','103');
INSERT INTO `students`(sid,name,password) VALUES ('2013052104', '萧何','104');
INSERT INTO `students`(sid,name,password) VALUES ('2013052105', '萧红','105');
INSERT INTO `students`(sid,name,password) VALUES ('2013052106', '萧青','106xq');
INSERT INTO `students`(sid,name,password) VALUES ('2013052107', 'admin','admin');

insert into students(name,password) values('李冬雪','li');
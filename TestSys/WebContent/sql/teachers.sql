DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `tid` int(11) NOT NULL  auto_increment,
  `name` varchar(15) NOT NULL,
  password varchar(15)  NOT NULL ,
  academy varchar(20) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;


INSERT INTO `teachers` VALUES ('2010052101', '����Զ','2101','��ѧԺ');
--INSERT INTO `teachers` VALUES ('2010052102', '���','2102','��ѧԺ');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052103', '����','2103');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052104', '��Ԫ','2104');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052105', '����','2105');
INSERT INTO `teachers`(tid,name,password) VALUES ('2010052106', '�����','2106');
INSERT INTO `teachers`(name,password) VALUES ('������','2103');
INSERT INTO `teachers` VALUES ('20100521001', '����','2101','��ѧԺ');
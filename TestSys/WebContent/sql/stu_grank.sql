DROP TABLE IF EXISTS `stu_grank`;
CREATE TABLE `stu_grank` (
 stu_gr_id int NOT NULL  auto_increment,
 sid int,
 kj_id int,
 stu_grank int,
  PRIMARY KEY  (`stu_gr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into stu_grank values(1,2013052101,10,1);
insert into stu_grank values(2,2013052102,10,4);
insert into stu_grank values(3,2013052103,10,5);
insert into stu_grank values(4,2013052104,10,6);
insert into stu_grank values(5,2013052105,10,2);
insert into stu_grank values(6,2013052106,10,3);

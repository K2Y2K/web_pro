DROP TABLE IF EXISTS `stu_result`;
CREATE TABLE `stu_result` (
 stu_r_id int NOT NULL  auto_increment,
 sid int,
 kj_id int,
 stu_dxt_r varchar(500),
 stu_dxt_c varchar(500), 
 stu_dxts_r varchar(500),
 stu_dxts_c varchar(500), 
 stu_pdt_r varchar(500),
 stu_pdt_c varchar(500), 
  PRIMARY KEY  (`stu_r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

update stu_result set sid=2013052101 where stu_r_id=8;
update stu_result set sid=2013052102 where stu_r_id=9;
update stu_result set sid=2013052103 where stu_r_id=10;
update stu_result set sid=2013052104 where stu_r_id=11;
update stu_result set sid=2013052105 where stu_r_id=12;
update stu_result set sid=2013052106 where stu_r_id=13;
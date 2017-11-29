DROP TABLE IF EXISTS `stu_grade`;
CREATE TABLE `stu_grade` (
 stu_g_id int NOT NULL  auto_increment,
 sid int,
 kj_id int,
 stu_dxt_g int,
 stu_dxts_g int,
 stu_pdt_g int, 
 stu_total_g int,
  PRIMARY KEY  (`stu_g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

update stu_grade set sid=2013052101,stu_pdt_g=40,stu_total_g=40 where stu_g_id=8;
update stu_grade set sid=2013052102  where stu_g_id=9;
update stu_grade set sid=2013052103 where stu_g_id=10;
update stu_grade set sid=2013052104  where stu_g_id=11;
update stu_grade set sid=2013052105,stu_pdt_g=20,stu_total_g=20 where stu_g_id=12;
update stu_grade set sid=2013052106,stu_pdt_g=20,stu_total_g=20 where stu_g_id=13;


insert into stu_grade values(2,2013052102,10,0,0,0,0);
insert into stu_grade values(3,2013052103,10,0,0,0,0);
insert into stu_grade values(4,2013052104,10,0,0,0,0);
insert into stu_grade values(5,2013052105,10,0,0,0,20);
insert into stu_grade values(6,2013052106,10,0,0,0,20);

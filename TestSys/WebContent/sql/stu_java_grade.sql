DROP TABLE IF EXISTS `stu_java_grade`;
CREATE TABLE `stu_java_grade` (
  stu_java_grade_id int NOT NULL  auto_increment,
   sid int(11),
   c_id int  default 1,
   sj_type int default 1,
   sj_dxt_rnum1 int,
   sj_dxt_rnum2 int,
   sj_dxt_rnum3 int,
   sj_dxt_rnum4 int,
   sj_dxt_rnum5 int,
 sj_dxts_rnum1 int,
 sj_dxts_rnum2 int,
 sj_dxts_rnum3 int,
 sj_dxts_rnum4 int,
 sj_dxts_rnum5 int,
 sj_pdt_rnum1 int,
 sj_pdt_rnum2 int,
 sj_pdt_rnum3 int,
 sj_pdt_rnum4 int,
 sj_pdt_rnum5 int,
 stu_grade int,
  PRIMARY KEY  (`stu_java_grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 --sj_dxt_rnum1 字段下1代表做对，0为该题错--
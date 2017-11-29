DROP TABLE IF EXISTS `stu_java_result`;
CREATE TABLE `stu_java_result` (
  `stu_java_result_id` int NOT NULL  auto_increment,
   sid int(11),
   c_id int default 1,
   sj_type int default 1,
   sj_dxt_num1 int,
   sj_dxt_num2 int,
   sj_dxt_num3 int,
   sj_dxt_num4 int,
   sj_dxt_num5 int,
 sj_dxts_num1 int,
 sj_dxts_num2 int,
 sj_dxts_num3 int,
 sj_dxts_num4 int,
 sj_dxts_num5 int,
 sj_pdt_num1 int,
 sj_pdt_num2 int,
 sj_pdt_num3 int,
 sj_pdt_num4 int,
 sj_pdt_num5 int, 
  PRIMARY KEY  (`stu_java_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
--sj_dxt_num1字段下储存1234代表没题的答案--
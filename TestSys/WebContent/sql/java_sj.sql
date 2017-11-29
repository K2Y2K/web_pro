DROP TABLE IF EXISTS `java_sj`;
CREATE TABLE `java_sj` (
  `java_sj_id` int NOT NULL  auto_increment,
 `java_dxt_id` int(10),
 `java_dxts_id` int,
 `java_pdt_id` int,
 `java_cxt_id` int,
 java_t_result varchar(1000),
 st_type int,
 st_num int,
 sj_type int default 1,
 c_id int default 1,
 tid int(11),
  PRIMARY KEY  (`java_sj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- st_type 字段表示单选题还是多选题--
--sj_type 1代表A卷 ，2代表B卷，int类型默认为11位--
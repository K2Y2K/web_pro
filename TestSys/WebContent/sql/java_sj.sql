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
-- st_type �ֶα�ʾ��ѡ�⻹�Ƕ�ѡ��--
--sj_type 1����A�� ��2����B��int����Ĭ��Ϊ11λ--
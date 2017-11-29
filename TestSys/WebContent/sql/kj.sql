DROP TABLE IF EXISTS `kj`;
CREATE TABLE `kj` (
  `kj_id` int NOT NULL  auto_increment,
  kj_name varchar(500), 
 `kj_dxt_id` varchar(500),
 `kj_dxts_id` varchar(500),
 `kj_pdt_id` varchar(500), 
 kj_type int default 1,
 c_id int default 1,
 tid int(11),
  PRIMARY KEY  (`kj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into kj(kj_name,kj_dxt_id,kj_dxts_id,kj_pdt_id) value("面向程序设计之Java","1#34#","1#2#","1#2#");
 alter table kj add column kj_dxt_g int null default 0 after `kj_dxt_id`;
 alter table kj add column kj_dxts_g int null default 0 after kj_dxts_id;
 alter table kj add column kj_pdt_g int null default 0 after kj_pdt_id;
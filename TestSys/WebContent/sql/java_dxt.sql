DROP TABLE IF EXISTS `java_dxt`;
CREATE TABLE `java_dxt` (
  `java_dxt_id` int(10) NOT NULL  auto_increment,
  `java_dxt_question` varchar(1000) default NULL,
  
  java_dxt_opt1 varchar(500) default NULL,
  java_dxt_opt2 varchar(500) default NULL,
  java_dxt_opt3 varchar(500) default NULL,
  java_dxt_opt4 varchar(500) default NULL,
  java_dxt_result varchar(500) default NULL,
  PRIMARY KEY  (`java_dxt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
--�������ݵ����ź�˫���ŵ�����һ��
insert into java_dxt values(1,'����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','java_dxt_opt2');
insert into java_dxt(java_dxt_question,java_dxt_opt1,java_dxt_opt2,java_dxt_opt3,java_dxt_opt4,java_dxt_result)  values('����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','java_dxt_opt2');
select java_dxt_id from java_dxt order by java_dxt_id desc;
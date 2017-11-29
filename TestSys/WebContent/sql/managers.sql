DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  m_id int NOT NULL  auto_increment,
  m_name varchar(15)  NULL,
  m_password varchar(15)   NULL ,
  m_type int default 1,
  PRIMARY KEY  (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
--为何int  最多输入10位 int默认为11位，指定的位数，数据库不识别
insert into managers values('3','lee','lee',1);
insert into managers(m_name,m_password,m_type) values('1001','1001',1);
select * from managers;
show create table managers;
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  c_id int NOT NULL  auto_increment,
  c_name varchar(500),  
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into course values(1,"java");
insert into course values(2,"C”Ô—‘");
insert into course values(3,"C++");
insert into course values(4,"Python");
DROP TABLE IF EXISTS `java_pdt`;
CREATE TABLE `java_pdt` (
  `java_pdt_id` int NOT NULL  auto_increment,
  `java_pdt_question` varchar(1000) default NULL,
  java_pdt_result int default 1, 
  PRIMARY KEY  (`java_pdt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into java_pdt values(1,'在构造方法中如调用super()语句，则必须使其成为构造方法中的第一条语句。( )','0');

-- java_pdt_result字段默认为1表示正确

insert into java_pdt values(2,'对象可以赋值，只要使用赋值号（等号）即可，相当于生成了一个各属性与赋值对象相同的新对象。( )','0');
insert into java_pdt values(3,'有的类定义时可以不定义构造函数，所以构造函数不是必需的。( )','0');
insert into java_pdt values(4,'类及其属性、方法可以同时有一个以上的修饰符来修饰。','1');
insert into java_pdt values(5,'Java的屏幕坐标是以像素为单位，容器的左下角被确定为坐标的起点.( )','0');
insert into java_pdt values(6,'抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。 ( )','0');
insert into java_pdt values(7,'final类中的属性和方法都必须被final修饰符修饰。 ( )','0');
insert into java_pdt values(8,'最终类不能派生子类，最终方法不能被覆盖。( )','1');
insert into java_pdt values(9,'子类要调用父类的方法，必须使用super关键字。( )','1');
insert into java_pdt values(10,'一个Java类可以有多个父类。( )','0');
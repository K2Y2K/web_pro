DROP TABLE IF EXISTS `java_dxts`;
CREATE TABLE `java_dxts` (
  `java_dxts_id` int NOT NULL  auto_increment,
  `java_dxts_question` varchar(1000) default NULL,
  java_dxts_opt1 varchar(500) default NULL,
  java_dxts_opt2 varchar(500) default NULL,
  java_dxts_opt3 varchar(500) default NULL,
  java_dxts_opt4 varchar(500) default NULL,
  java_dxts_result varchar(2000) default NULL,
  PRIMARY KEY  (`java_dxts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 insert into java_dxts values(1,'下面的说法正确的是( )。','Java 语言是面向对象的、解释执行的网络编程语言。','Java 语言具有可移植性，是与平台无关的编程语言。','Java 语言可对内存垃圾自动收集。','ava 语言编写的程序虽然是“一次编译，到处运行”，但必须要java的运行环境。','1:2:3:4');
 insert into java_dxts values(2,'下面main()方法的定义哪些是正确的( ).','public static void main(String args[]) {} ','public static void main(String[]) {}','public static void main(String[] args) {} ','public static void main(String [] x) {}','1:3:4');
 insert into java_dxts values(3,'下面哪些关键字能用来控制对类成员的访问( ).','public','protected','private','default','1:2:3');
 insert into java_dxts values(4,'面向对象程序设计的基本特征是( )。','抽象','封装','继承','多态','1:2:3:4');
 insert into java_dxts values(5,'下面关于类的说法正确的是( )。','类是 Java 语言中的一种复合数据类型。','类中包含数据变量和方法。','类是对所有具有一定共性的对象的抽象。','Java 语言的类只支持单继承。','1:2:3:4');
 insert into java_dxts values(6,'下面哪个说法正确( ).','如果某公共的接口被声明在一个源文件中，则接口必须与源文件具有相同的名字。','如果源文件包含import语句，则该语句必须是除空行和注释行外的第一个语句行。','如果某源文件包含package语句，则该语句必须是第一个非空、非注释行。','接口中的方法必定是抽象方法，但可以不用关键字abstract修饰。','1:2:3:4');

 insert into java_dxts values(7,'编译Java Application 源程序文件将产生相应的字节码文件，这些字节码文件的扩展名为( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(8,'编译Java Application 源程序文件将产生相应的字节码文件，这些字节码文件的扩展名为( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(9,'编译Java Application 源程序文件将产生相应的字节码文件，这些字节码文件的扩展名为( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(10,'编译Java Application 源程序文件将产生相应的字节码文件，这些字节码文件的扩展名为( )','.java','.class','.html','.exe','.class');
 
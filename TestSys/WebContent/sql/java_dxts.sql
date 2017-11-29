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
 insert into java_dxts values(1,'�����˵����ȷ����( )��','Java �������������ġ�����ִ�е����������ԡ�','Java ���Ծ��п���ֲ�ԣ�����ƽ̨�޹صı�����ԡ�','Java ���Կɶ��ڴ������Զ��ռ���','ava ���Ա�д�ĳ�����Ȼ�ǡ�һ�α��룬�������С���������Ҫjava�����л�����','1:2:3:4');
 insert into java_dxts values(2,'����main()�����Ķ�����Щ����ȷ��( ).','public static void main(String args[]) {} ','public static void main(String[]) {}','public static void main(String[] args) {} ','public static void main(String [] x) {}','1:3:4');
 insert into java_dxts values(3,'������Щ�ؼ������������ƶ����Ա�ķ���( ).','public','protected','private','default','1:2:3');
 insert into java_dxts values(4,'������������ƵĻ���������( )��','����','��װ','�̳�','��̬','1:2:3:4');
 insert into java_dxts values(5,'����������˵����ȷ����( )��','���� Java �����е�һ�ָ����������͡�','���а������ݱ����ͷ�����','���Ƕ����о���һ�����ԵĶ���ĳ���','Java ���Ե���ֻ֧�ֵ��̳С�','1:2:3:4');
 insert into java_dxts values(6,'�����ĸ�˵����ȷ( ).','���ĳ�����Ľӿڱ�������һ��Դ�ļ��У���ӿڱ�����Դ�ļ�������ͬ�����֡�','���Դ�ļ�����import��䣬����������ǳ����к�ע������ĵ�һ������С�','���ĳԴ�ļ�����package��䣬����������ǵ�һ���ǿա���ע���С�','�ӿ��еķ����ض��ǳ��󷽷��������Բ��ùؼ���abstract���Ρ�','1:2:3:4');

 insert into java_dxts values(7,'����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(8,'����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(9,'����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','.class');
 insert into java_dxts values(10,'����Java Application Դ�����ļ���������Ӧ���ֽ����ļ�����Щ�ֽ����ļ�����չ��Ϊ( )','.java','.class','.html','.exe','.class');
 
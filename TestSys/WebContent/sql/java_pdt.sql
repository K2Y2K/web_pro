DROP TABLE IF EXISTS `java_pdt`;
CREATE TABLE `java_pdt` (
  `java_pdt_id` int NOT NULL  auto_increment,
  `java_pdt_question` varchar(1000) default NULL,
  java_pdt_result int default 1, 
  PRIMARY KEY  (`java_pdt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into java_pdt values(1,'�ڹ��췽���������super()��䣬�����ʹ���Ϊ���췽���еĵ�һ����䡣( )','0');

-- java_pdt_result�ֶ�Ĭ��Ϊ1��ʾ��ȷ

insert into java_pdt values(2,'������Ը�ֵ��ֻҪʹ�ø�ֵ�ţ��Ⱥţ����ɣ��൱��������һ���������븳ֵ������ͬ���¶���( )','0');
insert into java_pdt values(3,'�е��ඨ��ʱ���Բ����幹�캯�������Թ��캯�����Ǳ���ġ�( )','0');
insert into java_pdt values(4,'�༰�����ԡ���������ͬʱ��һ�����ϵ����η������Ρ�','1');
insert into java_pdt values(5,'Java����Ļ������������Ϊ��λ�����������½Ǳ�ȷ��Ϊ��������.( )','0');
insert into java_pdt values(6,'���󷽷������ڳ������У����Գ������еķ����������ǳ��󷽷��� ( )','0');
insert into java_pdt values(7,'final���е����Ժͷ��������뱻final���η����Ρ� ( )','0');
insert into java_pdt values(8,'�����಻���������࣬���շ������ܱ����ǡ�( )','1');
insert into java_pdt values(9,'����Ҫ���ø���ķ���������ʹ��super�ؼ��֡�( )','1');
insert into java_pdt values(10,'һ��Java������ж�����ࡣ( )','0');
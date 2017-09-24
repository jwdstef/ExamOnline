drop database if exists examDB;
create database examDB;

use examDB;

-- 管理员表
create table adminInfo
(
  adminId int primary key auto_increment,
  adminName varchar(20) not null,
  adminEmail varchar(50) not null,
  adminPwd varchar(50) not null
)CHARACTER set ='utf8';

-- 年级表
create table gradeInfo
(
  gradeId int primary key auto_increment,
  gradeName varchar(10) not null
)CHARACTER set ='utf8';

-- 班级表
create table classInfo
(
  classId int primary key auto_increment,
  className varchar(20) not null,
  master varchar(20) not null,
  teacher varchar(20) not null,
  number int not null,
  classBegin varchar(50) not null,
  gradeId int references gradeInfo(gradeId)
)CHARACTER set ='utf8';
select * from classInfo a inner join gradeInfo b on a.gradeId=b.gradeId order by classId DESC limit 0,10
-- 学生表
create table stuInfo
(
  stuId int primary key auto_increment,
  stuNo varchar(20) not null,
  stuName varchar(20) not null,
  stuPwd varchar(50) not null,
  stuSex char(2) check(stuSex='男' or stuSex='女'),
  stuAge int,
  stuPhoto varchar(200) not null,
  classId int references classInfo(classId)
)CHARACTER set ='utf8';

-- 科目表
create table subject
(
  subId int primary key auto_increment,
  subName varchar(20) not null
)CHARACTER set ='utf8';

-- 题库表
create table examLibrary
(
  libId int primary key auto_increment,
  libTitle varchar(200) not null,
  libA varchar(200) not null,
  libB varchar(200) not null,
  libC varchar(200) not null,
  libD varchar(200) not null,
  libRight char(1) not null,
  subId int references subject(subId),
  libtype int not null,
  gradeId int references gradeInfo(gradeId)
)CHARACTER set ='utf8';
insert into examLibrary value(libId,'Java测试1','J2EE','J2ME','J2SE','.NET','A',1,1,1);

-- 试卷表
create table examPaper
(
  paperId int primary key auto_increment,
  paperName varchar(50) not null,
  classId int not null,
  beginTime varchar(100) not null,
  endTime varchar(100) not null
)CHARACTER set ='utf8';

-- 试卷题目表
create table examPaperLibs
(
  paperId int references examPaper(paperId),
  libId int references examLibrary(libId)
)CHARACTER set ='utf8';

create table score(
  scoreId int primary key AUTO_INCREMENT,
  stuId int references stuInfo(stuId),
  paperId int references examPaper(paperId),
  score int not null
)charset utf8;
select * from score a inner join stuInfo b on a.stuId = b.stuId inner join classInfo c on b.classId = c.classId inner join gradeInfo on c.gradeId = gradeInfo.gradeId inner join examPaper e on a.paperId = e.paperId;
create table siteInfo
(
  title varchar(50) not null,
  url varchar(50) not null,
  words varchar(200),
  descr varchar(500),
  sitemap varchar(60),
  favicon varchar(50),
  copyright varchar(20),
  icp varchar(20),
  count varchar(2000)
)CHARACTER set ='utf8';

-- 插入测试数据
insert into adminInfo values(1,'admin','i@ryanc.cc',md5('123456'));
insert into siteInfo VALUES ('考试在线','http://localhost:8080','考试,在线考试','我是描述','/sitemap.xml','favicon.ico','Copyright◎2017','渝ICP备-111222-1','cnzz.com');

insert into gradeInfo values('1','S1');
insert into gradeInfo values('2','S2');
insert into gradeInfo values('3','S3');

insert into classInfo values(1,'JAVA41','Mary','Jack',30,'2017-1-1',1);
insert into classInfo values(2,'.NET37','Jane','Ryan',30,'2017-1-1',2);
insert into classInfo values(3,'PHP42','Jackson','Jhonson',30,'2017-1-1',3);

insert into stuInfo values(1,'S0001','张三',md5('123456'),'男',18,'default.png',1);  -- Java41
insert into stuInfo values(2,'S0002','李四',md5('123456'),'女',18,'default.png',1);
insert into stuInfo values(3,'S0003','王五',md5('123456'),'男',18,'default.png',2);  -- .NET37
insert into stuInfo values(4,'S0004','赵六',md5('123456'),'女',18,'default.png',2);
insert into stuInfo values(5,'S0005','田七',md5('123456'),'男',18,'default.png',3);  -- PHP42
insert into stuInfo values(6,'S0006','王八',md5('123456'),'女',18,'default.png',3);

insert into subject values(subId,'JavaWeb高级');
insert into subject values(subId,'.NET高级');
insert into subject values(subId,'PHP网页设计');

insert into examLibrary values(libId,'Java语言中，int类型在内存中所占的位数为 ( )','8','16','32','64','A',1,1,1);
insert into examLibrary values(libId,'下列哪个字符串是合法的类标识符？ （ ）','implements','_implements','-implements','implements-1','B',1,1,1);
insert into examLibrary values(libId,' AWT中创建一个标识有“确定”按钮的语句是 ( )','TextField b = new TextField(“确定”);','Checkbox b = new Checkbox(“确定”);','Buttn b = new Button(“确定”);','Label b = new Label(“确定”);','C',1,1,1);
insert into examLibrary values(libId,'下列哪个命令中，用来编译Java程序的是： ( )','java','jar','javadoc','javac','D',1,1,1);
insert into examLibrary values(libId,'下列有关一个Java文件的叙述，正确的是？ （ ）','可以有2个以上package语句','可以有2个以上import语句','可以有2个以上public类','只能有1个类定义','B',1,1,1);
insert into examLibrary values(libId,'一个Unicode字符占用 （ ）','8位','16位','32位','一个字节','A',1,1,1);
insert into examLibrary values(libId,'类声明中，声明抽象类的关键字是 ( )','public','abstract','final','class','B',1,1,1);
insert into examLibrary values(libId,'下列命令中，是Java编译命令的是： ( )','java','javadoc','jar','javac','B',1,1,1);
insert into examLibrary values(libId,'Java语言中，byte类型在内存中所占的位数为 ( )','8','16','32','64','A',1,1,1);
insert into examLibrary values(libId,'AWT中用来表示文本框的类是 ( )','TextField','Menu','Label','List','A',1,1,1);
insert into examLibrary values(libId,'下列哪个字符串不能作为类标识符？ （ ）','HelloWorld','helloworld','J2EE','Hello-World','D',1,1,1);
insert into examLibrary values(libId,'将长整型(long)数据转换为较短的整数类型(int)数据，要进行 ( )','类型的自动转换','类型的强制转换','无需转换','无法实现','A',1,1,1);
insert into examLibrary values(libId,'下列哪个不是合法的标识符 ( )','hello','i','123','_good','C',1,1,1);
insert into examLibrary values(libId,'下列哪个语句语法正确？','byte y = 11; byte x = y +y;','String x = new Object();','Object x = new String(“Hellow”);','int a [11] = new int [11];','C',1,1,1);
insert into examLibrary values(libId,'以下选项中哪一个不是Java的特点：( )','自动垃圾回收','跨平台','面向对象','多重继承','D',1,1,1);

insert into examPaper values(paperId,'JAVA41第一次月考',1,'2017-9-18 12:00','2017-9-19 13:00');

insert into examPaperLibs values(1,1);
insert into examPaperLibs values(1,2);
insert into examPaperLibs values(1,3);
insert into examPaperLibs values(1,4);

SELECT * FROM adminInfo;
select * from stuInfo;
select * from gradeInfo;


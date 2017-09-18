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
insert into siteInfo VALUES ('考试在线','http://localhost:8080','考试,在线考试','我是描述','/sitemap.xml','favicon.ico','Copyright◎2017','渝ICP备-111222-1','cnzz.com');

-- 插入测试数据
insert into adminInfo values(1,'admin','i@ryanc.cc',md5('123456'));

insert into gradeInfo values('1','S1');
insert into gradeInfo values('2','S2');
insert into gradeInfo values('3','S3');

insert into classInfo values(1,'T394','张三','李四',30,'2017-1-1',1);
insert into classInfo values(2,'T395','张三','李四',30,'2017-1-1',2);
insert into classInfo values(3,'T396','张三','李四',30,'2017-1-1',3);

insert into stuInfo values(1,'S0001','张三',md5('123456'),'男',18,'default.png',1);
insert into stuInfo values(2,'S0002','李四',md5('123456'),'女',18,'default.png',1);
insert into stuInfo values(3,'S0003','王五',md5('123456'),'男',18,'default.png',2);
insert into stuInfo values(4,'S0004','赵六',md5('123456'),'女',18,'default.png',2);
insert into stuInfo values(5,'S0005','田七',md5('123456'),'男',18,'default.png',3);
insert into stuInfo values(6,'S0006','王八',md5('123456'),'女',18,'default.png',3);
insert into stuInfo values(7,'S0007','刘九',md5('123456'),'男',18,'default.png',3);

insert into subject values(subId,'JavaWeb高级');
insert into subject values(subId,'.NET高级');
insert into subject values(subId,'PHP网页设计');
insert into subject values(subId,'Linux基础');
insert into subject values(subId,'Photoshop基础');

insert into examLibrary values(libId,'Java测试1','J2EE','J2ME','J2SE','.NET','A',1,1,1);
insert into examLibrary values(libId,'Java测试2','J2EE','J2ME','J2SE','.NET','B',1,1,1);
insert into examLibrary values(libId,'Java测试3','J2EE','J2ME','J2SE','.NET','C',1,1,1);
insert into examLibrary values(libId,'Java测试4','J2EE','J2ME','J2SE','.NET','D',1,1,1);
insert into examLibrary values(libId,'Java测试5','J2EE','J2ME','J2SE','.NET','A',1,1,1);
insert into examLibrary values(libId,'Java测试6','J2EE','J2ME','J2SE','.NET','B',1,1,1);

insert into examPaper values(paperId,'JAVA41第二次月考',1,'2017-9-18','2017-9-19');
insert into examPaper values(paperId,'JAVA41第三次月考',1,'2017-9-18','2017-9-19');
insert into examPaper values(paperId,'JAVA41第四次月考',1,'2017-9-18','2017-9-19');
insert into examPaper values(paperId,'JAVA41第六次月考',1,'2017-9-18','2017-9-19');

insert into examPaperLibs values(1,1);
insert into examPaperLibs values(1,2);
insert into examPaperLibs values(1,3);
insert into examPaperLibs values(1,4);
insert into examPaperLibs values(1,5);
insert into examPaperLibs values(1,6);
insert into examPaperLibs values(2,1);
insert into examPaperLibs values(2,2);
insert into examPaperLibs values(2,3);
insert into examPaperLibs values(2,4);
insert into examPaperLibs values(2,5);
insert into examPaperLibs values(2,6);

SELECT * FROM adminInfo;
select * from stuInfo;
select * from gradeInfo;


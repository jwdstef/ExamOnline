drop database if exists examDB;
create database examDB;

use examDB;

-- 管理员表
create table adminInfo
(
  adminId int primary key auto_increment,
  adminName varchar(20) not null,
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
  examId int primary key auto_increment,
  subId int references subject(subId),
  examTitle varchar(200) not null,
  examA varchar(200) not null,
  examB varchar(200) not null,
  examC varchar(200) not null,
  examD varchar(200) not null,
  examRight char(1) not null
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
insert into adminInfo values(1,'admin',md5('123456'));

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

insert into examLibrary values(examId,1,'Java牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');
insert into examLibrary values(examId,2,'.NET牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');
insert into examLibrary values(examId,3,'PHP牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');
insert into examLibrary values(examId,4,'Linux牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');
insert into examLibrary values(examId,5,'Photoshop牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');


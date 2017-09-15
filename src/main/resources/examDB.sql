drop database if exists examDB;
create database examDB;

use examDB;

-- 管理员表
create table adminInfo
(
  adminId int primary key auto_increment,
  adminName varchar(20) not null,
  adminPwd varchar(20) not null
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
  classBegin varchar(50) not null,
  gradeId int references gradeInfo(gradeId)
)CHARACTER set ='utf8';

-- 学生表
create table stuInfo
(
  stuId int primary key auto_increment,
  stuNo varchar(20) not null,
  stuName varchar(20) not null,
  stuPwd varchar(20) not null,
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

-- 假装创建一张试卷表
create table examPages
(
  pageId int primary key auto_increment
)CHARACTER set ='utf8';

-- 考试控制表
create table examControl
(
  ctrlId int primary key auto_increment,
  pageId int references examPages(pageId),
  classId int references classInfo(classId),
  beginTime varchar(50) not null,
  endTIme varchar(50) not null,
  times int,
  nums int,
  isOver int default 0,
  score int
)CHARACTER set ='utf8';


-- 插入测试数据
insert into adminInfo values(1,'admin','123456');

insert into gradeInfo values('1','S1');
insert into gradeInfo values('2','S2');
insert into gradeInfo values('3','S3');

insert into classInfo values(1,'T394','2017-1-1',1);
insert into classInfo values(2,'T395','2017-1-1',2);
insert into classInfo values(3,'T396','2017-1-1',3);

insert into stuInfo values(1,'S0001','张三','123456','男',18,'default.png',1);
insert into stuInfo values(2,'S0002','李四','123456','女',18,'default.png',1);
insert into stuInfo values(3,'S0003','王五','123456','男',18,'default.png',2);
insert into stuInfo values(4,'S0004','赵六','123456','女',18,'default.png',2);
insert into stuInfo values(5,'S0005','田七','123456','男',18,'default.png',3);
insert into stuInfo values(6,'S0006','王八','123456','女',18,'default.png',3);
insert into stuInfo values(7,'S0007','刘九','123456','男',18,'default.png',3);

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

-- 班级管理
-- 添加班级
insert into classInfo values(4,'T397','2017-1-1',4);

-- 修改班级
update classInfo set classId=4,className='T397',gradeId=4 where classId=4;

-- 删除班级
delete from classInfo where classId = 4;

-- 查询班级
select * from classInfo;


-- 学生管理
-- 添加学生
insert into stuInfo values(8,'S0008','呵呵','123456','男',18,'default.png',3);

-- 修改学生
update stuInfo set stuId=8,stuNo='S0008',stuName='嘿嘿',stuPwd='123456',stuSex='男',stuAge=18,stuPhoto='default',classId=3 where stuId=8;

-- 删除学生
delete from stuInfo where stuId = 8;

-- 查询学生
select * from stuInfo;


-- 试卷管理
-- 出题管理
-- 添加试题
insert into examLibrary values(examId,5,'Photoshop牛逼吗？','牛逼','还行','屌爆了','辣鸡','C');

-- 修改试题
update examLibrary set examId=6,examTitle='macOS牛逼吗？',examA='牛逼',examB='还行',examC='屌爆了',examD='辣鸡',examRight='C' where examId=6;

-- 删除试题
delete from examLibrary where examId = 6;

-- 查询试题
select * from examLibrary;


-- 管理员管理
-- 添加管理员
insert into adminInfo values(adminId,'admin2','123456');

-- 修改用户名
update adminInfo set adminName='admin22' where adminId=2;

-- 修改密码
update adminInfo set adminPwd='654321' where adminId=2;


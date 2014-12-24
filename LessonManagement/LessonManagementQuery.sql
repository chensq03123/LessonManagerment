use LessonManagement;
--insert into User_Info(User_LoginName,User_LoginPwd) values('test','123456');
--select * from User_Info;
--create table teacher_info(id int primary key Identity(1,1),Teacher_Name varchar(20));
--select * from teacher_info;
--alter table teacher_info alter column Teacher_Name nvarchar(20);
--delete from teacher_info;
--drop table teacher_info;
--create table teacher_info(id int primary key identity(1,1),Teacher_Name nvarchar(20) COLLATE Chinese_PRC_CS_AS_WS);
--insert into teacher_info(Teacher_Name) values('陈水强');
--alter table teacher_info alter column  Teacher_Name nvarchar(20) collate Chinese_PRC_90_CI_AS;
--select * from teacher_info;
--insert into teacher_info(Teacher_Name) values(N'陈水枪chensq');
--delete from teacher_info;
--create table plantable(id int primary key identity(1,1));
--alter table teacher_info alter column Teacher_Condition nvarchar(300) collate Chinese_PRC_90_CI_AS;
--select * from teacher_info;
--create table Lesson_Info(id int primary key identity(1,1),lesson_name nvarchar(100) collate Chinese_PRC_90_CI_AS);
--insert into Lesson_Info(lesson_name) values (N'微积分(上)');
--select * from Lesson_Info;
--课程名 课程类型 总学时 讲课学时 上机学时 实验学时 课外学时
--alter table Lesson_Info add lesson_type nvarchar(10),lesson_totallen int,lesson_classlen int,lesson_machlen int,lesson_explen int,lensson_outlen int;
--select * from Lesson_Info;
--班级表 ID 班级名 计划周次
--create table class_info(id int primary key identity(1,1),weekdayid int not null);
--drop table class_info;
--create table Class_Info(id int primary key identity(1,1),weekdayid int not null);
--alter table Class_Info drop column weekdayid;
--alter table Class_Info add timetableid int not null;
--alter table Class_Info add class_name nvarchar(20) not null;
--时间表 ID 教学计划id 周次 第几节
--create table timetable(id int primary key identity(1,1),planid int,weeknum int,classnum int);
--教学计划关联表 ID 课程id 教师id 开始周次 结束周次
--create table plantable(id int primary key identity(1,1),lessonid int,teacherid int,weekbegin int,weekend int);
--select * from plantable;
--select * from Lesson_Info;
--select * from timetable;
--select * from Class_Info;
/*if exists(select * from sysobjects where name='addplan')
drop procedure addplan
go
create procedure addplan
(

)*/
--insert into teacher_info(Teacher_Name,Teacher_Condition) values (N'陈水强',N'周一');
--insert into Lesson_Info(lesson_name,lesson_type,lesson_totallen,lesson_classlen,lesson_machlen,lesson_explen,lensson_outlen) values (N'中国近代史',N'必修',32,24,0,0,8);
--select * from Lesson_Info;
--select * from teacher_info;
--delete from teacher_info;
--delete  from Lesson_Info where id=1;
/*if exists(select * from sysobjects where name='test')
drop procedure test
go
create procedure test
as
select * from Lesson_Info

go
exec test*/

/*if exists(select * from sysobjects where name='addplan')
drop procedure addplan
go
create procedure addplan
(
	--plantable paras
	@T_id int,
	@L_id int,
	@w_begin int,
	@w_end int,
	--timetable paras
	@classnum int,
	@weeknum int
)
AS
begin
insert into plantable(teacherid,lessonid,weekbegin,weekend) values(@T_id,@L_id,@w_begin,@w_end)
declare @planid int
set @planid=IDENT_CURRENT('plantable')
insert into timetable(classnum,weeknum,planid) values(@classnum,@weeknum,@planid)
end

go 
exec addplan 1004,2,5,12,4,3
select * from plantable left join timetable on plantable.id=timetable.planid right join  teacher_info on plantable.teacherid=teacher_info.id right join Lesson_Info on plantable.lessonid=Lesson_Info.id
*/
--insert into timetable(planid,weeknum,classnum) values (1,5,5)
select * from plantable left join timetable on plantable.id=timetable.planid right join  teacher_info on plantable.teacherid=teacher_info.id right join Lesson_Info on plantable.lessonid=Lesson_Info.id
--create table classtable(id int primary key identity(1,1),classname nvarchar(20) collate Chinese_PRC_90_CI_AS,planid int)
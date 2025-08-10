

create database emp_db;
use emp_db;
drop  table emp;
create table emp(empid int,empname varchar(20),deptname varchar(20),salary int);

insert into emp values(112,'komal','IT',10000);
insert into emp values(117,'rakesh','IT',8000);
insert into emp values(105,'rajesh','HR',8000);
insert into emp values(108,'suresh','IT',8000);
insert into emp values(102,'amit','IT',8000);
insert into emp values(110,'pooja','IHR',7000);
insert into emp values(101,'sneha','IT',7000);
insert into emp values(111,'sona','finace',6500);
insert into emp values(103,'shraddha','IT',6500);
insert into emp values(100,'sheetal','finance',6500);
select * from emp;

select * from emp order by salary desc;
select distinct * from emp;
select * from emp limit 9,1; /*to fetch 4th highest salary*/


drop database stud_db;
create database stud_db;
use stud_db;

drop table emp_mgnt;
create table emp_mgnt(empid int NOT NULL,empname varchar(50),contact varchar(10) NOT NULL);
desc emp_mgnt;

insert into emp_mgnt values(1001,'rahul',987654321);
select * from emp_mgnt;
insert into emp_mgnt values(null,'rahul',987654321);
insert into emp_mgnt values(1001,'rahul',null);
insert into emp_mgnt values(1001,null,987654321);

show tables;
desc student;
alter table student modify column rollno int NOT NULL;

drop table emp_Un;
create table emp_Un(empid int ,empname varchar(50),contact varchar(10) UNIQUE);
DESC EMP_Un;
insert into emp_Un values(1001,'rahul',987654321);
insert into emp_Un values(1002,'rohan',987654321);
alter table emp_Un drop index contact;
select * from emp_un;
drop table emp_p;
create table emp_p(empid int primary key,empname varchar(10),contact varchar(10));
insert into  emp_p values(1002,'rohit',123456789);
/*insert into  emp_p values(1002,'rohit',123456789);*/
select *from emp_p;
alter table student  modify column rollno int primary key;
alter table student drop primary key;
desc student;
select * from student;

alter table student modify column rollno int primary key;


show tables;
drop table course;


create table course(course_id int,course_name varchar(25),rollno int,
/*alter table course add constraint  roll_no*/ foreign key(rollno) references student(rollno)
on delete cascade
on update cascade);
insert into course values(10,'data science',101);
delete from student where rollno=101;
select * from course;
update student set rollno=113 where rollno=102;
select * from student;
select * from course;


insert into course values(10,'data science',102);
delete from student where rollno=101;
select * from course;


create table emp_loc(empid int,empname varchar(10),loc varchar(10) default 'pune');
insert into emp_loc values(1001,'rohit','mumbai');
select * from emp_loc;

alter table student modify column branch varchar(20) default'comp';
alter table student alter branch drop default;



/*check==*/
create table emp_chk(empid int,empage int,check (empage>20));
insert into emp_chk values(1001,25);
select * from emp_chk;
insert into emp_chk values(1001,19);

alter table student modify column gender char(1) check (gender in('m','f'));
insert into student (rollno,gender)values (100,'d');

drop table emp_inc;
create table emp_inc(empid int auto_increment primary key,empname varchar(10));
insert into emp_inc(empname)values('rahul');

select * from emp_inc;
insert into emp_inc(empname)values('rohit');
alter table emp_inc auto_increment=100;


/*use stud_db;*/


select * from student;
select * from student where rollno=105;

select * from student order by stud_name ;
select * from student order by stud_name desc;


select * from student order by branch,rollno;

select distinct branch from student;
select * from student;
select distinct cgpa from student;

select distinct * from student;

select * from student limit 0,5; 
select * from student limit 5;

select * from student limit 2,5;
select * from student limit 9;

select * from student limit 20,5;
/*to fetch 4th highest salary from table*/
select * from emp order by salary desc;
select * from emp order by salary desc limit 3,1;/*it gives duplicate value */

/*to fetch from nth highest salary*/
select distinct salary from emp order by salary desc limit 3,1;

select * from stud_db.course;
 




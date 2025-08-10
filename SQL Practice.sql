drop database stud_db;
create database stud_db;
use stud_db;

create table emp(emp_id int,emp_name varchar(10),dept_name varchar(10),salary int);
select * from emp;

insert into emp values(102,"rahul","HR",3000);
insert into emp values(103,"akbar","IT",4000);
insert into emp values(104,"dorvin","FINANCE",6500);
insert into emp values(105,"rohit","HR",3000);
insert into emp values(106,"rajesh","FINANCE",5000);
insert into emp values(107,"preet","HR",7000);
insert into emp values(108,"maryam","ADMIN",4000);
insert into emp values(109,"sanjay","IT",6500);
insert into emp values(110,"vasudha","IT",7000);
insert into emp values(111,"melinda","IT",8000);

select * from emp;

select emp_id,emp_name from emp;

select emp_id from emp;

select salary,salary*0.25 ,salary+100 from emp;

create table student(rollno int, stud_name varchar(20),gender char(2),cgpa int,branch varchar(10));

insert into student values(101,"rahul","M",8,"entc");
insert into student values(103,"snehal","F",NULL,"comp");
insert into student values(104,"dhiraj","M",6,"comp");
insert into student values(105,"niraj","M",7,NULL);
insert into student values(106,"neha","F",8,"entc");
insert into student values(107,"ashish","M",9,"comp");
insert into student values(102,"rohit","M",NULL,"entc");

select * from student;
select * from student where rollno=107;
select * from student where branch="comp";

select * from student where rollno IN (101,103,105);
select * from student where rollno NOT IN (101,103,105);

select * from student where cgpa between 7 and 9;

select * from student where stud_name LIKE "_a%";
select * from student where stud_name LIKE "___h%";
select * from student where branch="entc" and cgpa>5;

select * from student;

select * from student where stud_name like"%a%";

select * from student where stud_name like"%r%";

select * from student where rollno=101 and stud_name="rohit";

select * from student where branch='entc' and cgpa>5;

select * from student;
select * from student where cgpa is null;

select * from student where cgpa is not null;

select * from student where branch is null;
select * from student where branch is not null;

/*update data*/

select * from student;

SET SQL_SAFE_UPDATES = 0;
update student set cgpa=5 where cgpa is null;

alter table student add column internship int;

select * from student;

update student set internship=3;

update student
set internship=
case rollno
when 101 then 1
when 102 then 3
when 103 then 2
else 0
end;



SET SQL_SAFE_UPDATES = 0;

delete from student where rollno=102;

select * from student;


create table emp_nn(empid int,empname varchar(10),contact varchar(10) not null);

insert into emp_nn values(1001,'rahul',9786357243);

select * from emp_nn;
SHOW TABLES;

insert into emp_nn values(null,'rahul',9786357243);

desc emp_nn;

desc student;
alter table student modify column rollno int NOT NULL;

-- UNIQUE

create table emp_unq(empid int,empname varchar(20),contact varchar(10) unique);
desc emp_unq;

insert into emp_unq values(1001,'rahul',8974367221);
insert into emp_unq values(1002,'satish',8974347221);

alter table student modify column rollno int unique;

alter table student drop index rollno;

-- primary key
create table emp_pk(empid int primary key,empname varchar(10),contact varchar(10) );
desc emp_pk;

insert into emp_pk values(1002,'rohit',98755432);
select* from emp_pk;
insert into emp_pk values(null,'rohit',98755432);

alter table student modify column rollno int primary key;

desc student;

alter table student drop primary key;

-- primary key and foreign key

alter table student modify column rollno int primary key; 

create table course(course_id int,course_name varchar(50),rollno int, foreign key(rollno) references student(rollno)
on delete cascade
on update cascade);

select * from student;

insert into course values(10,'data science',101);

select * from course;

delete from student where rollno=102;

create table emp_df(empid int,empname varchar(20),loc varchar(20) default 'pune');
select * from emp_df;

insert into emp_df(empid,empname) values(101,'shraddha');
select * from emp_df;

create table emp_chk(empid int,empage int,check (empage>20));
insert into emp_chk values(1001,25);

select * from emp_chk;

alter table student modify column gender char (1) check (gender in ('m','f'));
insert into student (gender) values ('d');

select * from student;
select * from student where rollno=105;

-- order by:
select * from student order by stud_name desc;

select * from emp order by salary;

select max(salary) from emp  where salary < ( select max(salary) from emp order by salary);

select * from emp limit 0,5;

select * from emp limit 2,5;

select * from emp limit 9,6;

-- read rows from 21 to 25
select * from emp limit 20,5;

select * from emp limit 9,1;

-- nth highest salary 
select distinct salary  from emp order by salary desc limit 1;

select max(salary) from emp order by salary desc;

show create table course;
alter table course drop foreign key course_ibfk_1 ;


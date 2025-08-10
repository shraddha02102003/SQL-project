select * from emp;
select max(salary) from emp;
select min(salary) from emp;
select sum(salary) from emp;
select avg(salary) from emp;
select count(salary) from emp;
select count(*) from emp;
select count(1) from emp;
select count(empid) from emp;

select * from student;
insert into student values (null,null,null,null,null);

select count(*) from student;
select count(rollno) from student;
select count(stud_name)from student;


alter table student add placement char(1);
select * from placement;

/*
--based on database
--avg cgpa of mech stud from the list

select avg(cgpa) from placement where branch='mechanical';
select count(1) from placement where branch='mechanical';
select count(*) from placement where branch='mechanical';


*/
create database car_db;
use car_db;

drop table car;
create table car(cars varchar(20),days varchar(10),distance_travel int);
insert into car values('car1','day1',50); 
insert into car values('car1','day2',100); 
insert into car values('car1','day3',200); 
insert into car values('car2','day1',0); 
insert into car values('car3','day1',0); 
insert into car values('car3','day2',50); 
insert into car values('car3','day3',50); 
insert into car values('car3','day4',100); 

select * from car;

/*total distance travelled by car*/
select cars,sum(distance_travel) from car group by cars;


select max(salary) from emp;
select * from emp where salary=10000;
/*subquery*/
select * from emp where salary=(select max(salary) from emp);

select max(salary) from emp where salary <(select max(salary) from emp);

select * from emp limit 4,1;
select * from emp where salary=(select distinct salary  from emp order by salary desc limit 4,1);

select empname,salary from emp where salary >(select avg(salary)from emp);


/*
select sum(`no of screens`) from movies where gener='Drama';


*/
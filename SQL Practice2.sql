create database shrad_db;
use shrad_db;

create table player(Ranks int,name varchar(30),score int);
insert into player values(1,'virat',183),(2,'rohit',183);
start transaction;
insert into player values(3,'sachin',200);
commit;

set SQL_SAFE_UPDATES=0;
update player set name='pandya' where Ranks=2; 
insert into player values(4,'dhoni',250);
delete from player where Ranks=3;

select * from player;
rollback;

commit;

rollback;

start transaction ;
savepoint A;
insert into player values(5,'jadeja',160),(6,'shashi',200);
update player set Name='kohli' where Ranks=1;
delete from player where name='pandya';

Savepoint B;
insert into player values(7,'rahul',160),(8,'suresh',200);
update player set Name='mohan' where Ranks=5;
delete from player where name='kohli';

select * from player;

rollback To B;
select * from player;

rollback to A;

select * from player;
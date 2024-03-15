create database Ravi
use Ravi

create table Student(
	Id int Primary Key identity(1,1),
	name varchar(50),
	age int,
	isStudent bit,
	registration_date date,
);

use Ravi

select * from Student

update Student set height=120.54 where id=2

update Student set height=180.00 where id=1

update Student set height=178.00 where id=3

update Student set height=175.05 where id=4

update Student set name='poul', isStudent=0 where id=2

insert into Student (name,age,isStudent,registration_date) values('ravi',20,1,'2024-03-21')

insert into Student values('raj',19,1,'2024-03-20')

alter table Student add  height float

insert into Student values ('John Doe', 25, 1, '1990-05-15', 175.5)

insert into Student values ('steve Smith', 39, 0, '1985-08-22', 160.0)

insert into Student values ('Bob Johnson', 22, 1, '2000-03-10', 180.2)

update Student set height=160.90 where id=3

select name,age from Student;

update Student set registration_date='2020-03-21' where id=1

select * from Student;

delete from Student where id=2

select * from Student where isStudent=1

select * from Student order by age 

select count(registration_date) from Student

select * from Student

select count(id) from Student

select '10'+'5'

declare @avg int ;

select @avg =avg(id) from Student

select sum(id)/@avg from Student

declare @dum int;

select sum(id) into @dum from Student

select * from Student


use Ravi


Create table student_details(
	EmployeeId int ,
	firstname nvarchar(50),
	lastname nvarchar(50),
	salary decimal(10,2),
	hiring date
);

CREATE TABLE XYZ(
	ID INT PRIMARY KEY,
	);

	ALTER TABLE XYZ DROP CONSTRAINT PK__XYZ__3214EC278BEA0D68

	-- Query to find the constraint name
SELECT
    constraint_name
FROM
    information_schema.table_constraints
WHERE
    table_name = 'XYZ' AND constraint_type = 'PRIMARY KEY';

exec sp_help 'XYZ'

alter table student_details add emial varchar(25)

alter table student_details alter column employeeid int not null

alter table student_details add constraint EmployeeId primary key(EmployeeId)

ALTER TABLE student_details
ADD CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeId)

alter table student_details ADD constraint PK_EmployeeID PRIMARY KEY(EmployeeId)

insert into student_details values(1,'ravi','parmar',
80000.00,cast('2024-03-21' as date),'psrmsrravi11D62@gmail.com')

ALTER TABLE STUDENT_DETAILS ADD CONSTRAINT UQEMAIL UNIQUE (EMIAL);

SELECT * FROM STUDENT_DETAILS

select * from student_details

use ravi

select * from student_details

ALTER TABLE student_details add employeetype varchar(10) 

ALTER TABLE student_details ALTER COLUMN salary decimal(18,

exec sp_rename 'student_details.firstname','first_name','column'

alter table student_details alter column hiring date not null

exec sp_help 'student_details'

drop index student_details.laat

create index laat on student_details (lastname)

select * from Student

declare @number numeric

set @number=7016685471

print @number






--creating database
create database assignment_1_RaviParmar

--switch to assignment_1_RaviParmar

use assignment_1_RaviParmar

--creting emp_department

create table emp_department(
	DPT_CODE TINYINT PRIMARY KEY,
	DPT_NAME VARCHAR(10) NOT NULL,
	DPT_ALLOTMENT INT
);

--inserting value in emp_department

INSERT INTO emp_department values(57,'IT',65000),
(63,'Finance',15000),
(47,'HR',240000),
(27,'RD',55000),
(89,'QC',75000)

SELECT * FROM emp_department

--creting emp_details

create table emp_details(
	EMP_IDNO int primary key,
	EMP_FNAME varchar(20),
	EMP_LNAME varchar(20),
	EMP_DEPT tinyint,
	foreign key(EMP_DEPT) references emp_department(DPT_CODE)
);

select * from emp_details

--inserting in emp_details

insert into emp_details values(127323 ,'Michale','Robbin',57),
							  (526689  ,'Carlos','Snares',63),
							  (843795  ,'Enric','Dosio',57),
							  (328717  ,'Jhon','Snares',63),
							  (444527  ,'Joseph','Dosni',47),
							  (659831  ,'Zanifer','Emily',47),
							  (847674  ,'Kuleswar','Sitaraman',57),
							  (748681  ,'Henrey','Gabriel',47),
							  (555935  ,'Alex','Manuel',57),
							  (539569  ,'George','Mardy',27),
							  (733843   ,'Mario','Saule',63),
							  (631548   ,'Alan','Snappy',27),
							  (839139   ,'Maria','Foster',57)


--creting company_mast

create table company_mast(
	COM_ID tinyint primary key,
	COM_NAME VARCHAR(15)
);

--inserting in company_mast

INSERT INTO company_mast VALUES (11,'Samsung'),
								(12,'iBall'),
								(13,'Epsion'),
								(14,'Zebronics'),
								(15,'Asus'),
								(16,'Frontech')
	                      
select * from company_mast


--creting item_mast

create table item_mast(
	PRO_ID 	int primary key,
	PRO_NAME varchar (30),   
	PRO_PRICE int not null,
	PRO_COM tinyint,
	foreign key (PRO_COM) references company_mast(COM_ID)
);

--inserting in  item_mast

insert into item_mast values (101,'Mother Board',3200,15),
							 (102,'Key Board',450,16),
							 (103,'ZIP drive',250,14),
							 (104,'Speaker',550,16),
							 (105,'Monitor',5000,11),
							 (106,'DVD drive',900,12),
							 (107,'CD drive',800,12),
							 (108,'Printer',2600,13),
							 (109,'Refill cartridge',350,13),
							 (110,'Mouse',250,12)
select * from item_mast

--creting salesman

create table salesman(
	salesman_id int primary key,
	name varchar(30),
	city varchar(30),
	commission float(10),
);

--inserting in salesman

insert into salesman values (5001,'James Hoog','New York',0.15),
							 (5002,'Nail Knite','Paris',0.13),
							 (5005,'Pit Alex','London',0.11),
							 (5006,'Mc Lyon','Paris',0.14),
							 (5007,'Paul Adam','Rome',0.13),
							 (5003,'Lauson Hen','Sam Jose',0.12)
select * from salesman

--creting customer

create table customer(
	customer_id int primary key,
	cust_name varchar(30),
	city varchar(30),
	grade int,
	salesman_id int,
	foreign key (salesman_id) references salesman(salesman_id)
);

--inserting in   customer

insert into customer values (3002,'Nick Rimando','New York',100,5001),
							(3007,'Brad Davis','New York',100,5001),
							(3005,'Graham Zusi','California',200,5002),
							(3008,'Julian Green','London',300,5002),
							(3004,'Fabian Johnson','Paris',300,5006),
							(3009,'Geoff Cameron','Berlin',100,5003),
							(3003,'Jozy Altidor','Moscow',200,5007),
							(3001,'Brad Guzan','London',null,5005)
select * from customer
				

--creting orders

create table orders(
	ord_no int primary key,
	purch_amt float(10),
	ord_date date,
	customer_id  int,
	salesman_id int,
	foreign key (customer_id) references customer(customer_id),
	foreign key (salesman_id) references salesman(salesman_id)
);

--inserting in orders

insert into orders values (70001,150.5,cast('2012-10-05' as date),3005,5002),
						  (70009,270.65,cast('2012-09-10' as date),3001,5005),
						  (70002,65.26,cast('2012-10-05' as date),3002,5001),
						  (70004,110.5,cast('2012-08-17' as date),3009,5003),
						  (70007,948.5,cast('2012-09-10' as date),3005,5002),
						  (70005,2400.6,cast('2012-07-27' as date),3007,5001),
						  (70008,5760,cast('2012-09-10' as date),3002,5001),
						  (70010,1983.43,cast('2012-10-10' as date),3004,5006),
						  (70003,2480.4,cast('2012-10-10' as date),3009,5003),
						  (70012,250.45,cast('2012-06-27' as date),3008,5002),
						  (70011,75.29,cast('2012-08-17' as date),3003,5007),
						  (70013,3045.6,cast('2012-04-25' as date),3002,5001);
select * from orders;



--(1) Write a SQL statement to find the total purchase amount of all orders.

select sum(purch_amt) as total_purchase_amount from orders;

--(2) Write a SQL statement to find the average purchase amount of all orders.

select avg(purch_amt) as average_purchase_amout from orders;

--(3) Write a SQL statement to find the number of salesmen currently listing for all of their customers

select count(distinct salesman_id)as Listed_salesMan from customer; 

--(4) Write a SQL statement to know how many customer have listed their names.

select COUNT(cust_name) from customer;

--(5) Write a SQL statement find the number of customers who gets at least a gradation for his/her performance

select count(*) from customer where grade is not null;

--(6) Write a SQL statement to get the maximum purchase amount of all the orders

select max(purch_amt) as max_amount from orders;

--(7) Write a SQL statement to get the minimum purchase amount of all the orders

select min(purch_amt) as max_amount from orders;

--(8) Write a SQL statement which selects the highest grade for each of the cities of the customers.

SELECT city,MAX(grade) as max_grade  from customer group by city; 

--(9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.  

select customer_id,Max(purch_amt) as max_spending from orders group by customer_id;

--(10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 

select customer_id,ord_date ,Max(purch_amt) as max_spending from orders group by  ord_date,customer_id;

--(11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.

select salesman_id,max(purch_amt) as max_purchase_amount  from orders where ord_date='2012-08-17'  group by salesman_id ;  

--(12) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.  

select max(purch_amt) as max_purch_amt,customer_id,ord_date from orders  group by customer_id,ord_date having max(purch_amt)>2000;

--(13) Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000

select max(purch_amt)as max_purch_amt,customer_id,ord_date from orders  group by customer_id,ord_date having max(purch_amt) between 2000 and 6000;

--(14) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  

select max(purch_amt)as max_purch_amt,customer_id,ord_date from orders  group by customer_id,ord_date having max(purch_amt) in (2000,3000,5760,6000);

--(15) Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.

select max(purch_amt) as max_amount,customer_id from orders group by customer_id having customer_id between 3002 and 3007;

--(16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  

select max(purch_amt) as max_amount,customer_id from orders group by customer_id having (customer_id between 3002 and 3007) and max(purch_amt)>1000;

--(17) Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008. 

select max(purch_amt) as max_amount,salesman_id,customer_id from orders  where salesman_id between 5003 and 5008  group by salesman_id,customer_id; 

--(18) Write a SQL statement that counts all orders for a date August 17th, 2012.   

select count(*) from orders where ord_date='2012-08-17';

--(19) Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.   

select count(*) as no_of_salesman from salesman where TRIM(city) <>'';

--(20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.

select salesman_id,ord_date,count(salesman_id) as no_of_orderBy_salesman from orders group by ord_date,salesman_id;

--(21) Write a SQL query to calculate the average price of all the products. 

select avg(pro_price) from item_mast;

--(22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.
select count(*) as no_of_product from item_mast where pro_price>=350;

--(23) Write a SQL query to display the average price of each company's products, along with their code.
select pro_com , avg(pro_price) as average_price from item_mast group by pro_com;

--(24) Write a query in SQL to find the sum of the allotment amount of all departments. 
select sum(DPT_ALLOTMENT) as total_allotment from emp_department group by DPT_NAME;      

--(25) Write a query in SQL to find the number of employees in each department along with the department code.
select EMP_DEPT,count(*) as no_of_employee from emp_details group by EMP_DEPT;

select * from item_mast join company_mast on COM_ID=PRO_COM


















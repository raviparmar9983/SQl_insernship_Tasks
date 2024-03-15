create Database Assignment_2_RaviParmar

use Assignment_2_RaviParmar

create table employees(
	EmployeeId int Primary Key,
	FirstName Varchar(30),
	LastName varchar(30),
	Title varchar(20),
	Birthdate date,
	HireDate date,
	ReportTo Int,
	Address varchar(50)
);


insert into employees values
(1,'ravi','parmar','Manager',cast('1980-05-15' as date),cast('2010-01-20' as date),null,'123 main st ahemba'),
(2,'jane','smith','team lead',cast('1985-08-22' as date),cast('2012-03-10' as date),1,'456 ring road rajkot'),
(3,'Bob','johnson','supervisor',cast('1990-12-10' as date),cast('2015-06-05' as date),1,'12 ambli bopal'),
(4,'sarah','miller','developer',cast('1993-04-18' as date),cast('2018-07-12' as date),2,'23 satelite ahem'),
(5,'Michael','Brown','Analyst',cast('1988-09-30' as date),cast('2014-02-28' as date),2,'123 iscone ahemda'),
(6, 'Emily', 'Davis', 'Manager', cast('1982-12-05' as date), cast('2011-05-08' as date), NULL, '444 Pineapple Ave'),
(7, 'Alex', 'Garcia', 'Supervisor', cast('1995-07-20' as date), cast('2019-11-15' as date), 6, '555 Orange Blvd'),
(8, 'Grace', 'Wong', 'Developer', cast('1990-02-14' as date), cast('2017-09-22' as date), 6, '666 Cherry Ln')



select * from employees;

create table orders (
	OrderID int primary key,
	CustomerID int,
	EmployeeID int,
	OrderDate date
	foreign key (CustomerID) references cutomers(CustomerID),
	foreign key (EmployeeId) references employees(EmployeeId)
);
insert into orders values
(1, 101, 1, cast('2022-01-15' as date)),
(2, 102, 2, cast('2022-02-20' as date)),
(3, 103, 3, cast('2022-03-25' as date)),
(4, 104, 3, cast('2022-04-10' as date)),
(5, 105, 4, cast('2022-05-18' as date))

delete orders where orderid=5
select * from orders

create table cutomers(
	CustomerID int primary key,
	CompanyName varchar(30),
	ContactName varchar(20),
	ContactTitle varchar(20),
	Address varchar(50),
	City varchar(20),
	Country varchar(15),
);


insert into cutomers values(106, 'Innovate Ltd', 'Frank Johnson', 'CEO', '999 Oak Blvd', 'Innovation City', 'UK'),

(101, 'ABC Corp', 'Alice Johnson', 'CEO', '456 Oak St', 'Cityville', 'USA'),
(102, 'XYZ Ltd', 'Bob Smith', 'Manager', '789 Pine St', 'Townsville', 'Canada'),
(103, '123 Inc', 'Charlie Brown', 'CFO', '111 Elm St', 'Villagetown', 'UK'),
(104, 'Tech Solutions', 'David Rodriguez', 'CTO', '777 Walnut St', 'TechCity', 'USA'),
(105, 'Global Imports', 'Emma White', 'Director', '888 Cedar Ave', 'Tradeville', 'Canada'),
(106, 'Innovate Ltd', 'Frank Johnson', 'CEO', '999 Oak Blvd', 'Innovation City', 'UK'),
(107, 'Elite Enterprises', 'Helen Chen', 'COO', '123 Pine Ln', 'Businessville', 'Australia'),
(108, 'Future Trends', 'Ivan Santos', 'CFO', '456 Maple Ave', 'Prospect City', 'New Zealand')

select * from cutomers;

--Write a SQL query to retrieve the list of all orders made by customers in the "USA".

select o.* from orders as o join  cutomers as 
c on c.customerid=o.customerid where c.country='usa';

--Write a SQL query to retrieve the list of all customers who have placed an order.

select c.* from cutomers as c join orders as 
o on c.customerid=o.customerid;

--Write a SQL query to retrieve the list of all employees who have not yet placed an order.

select e.employeeid,e.firstname,e.lastname,e.title from employees as e left join orders 
as o on e.employeeid=o.employeeid where orderid is null;

--Write a SQL query to retrieve the list of all employees who have placed an order.

select e.employeeid,e.firstname,e.lastname,e.title from employees as e  join orders 
as o on e.employeeid=o.employeeid ;

--Write a SQL query to retrieve the list of all customers who have not yet placed an order.

select c.* from cutomers as c left join orders 
as o on o.customerid=c.customerid where o.orderid is null;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.


select c.*,o.orderdate from cutomers as c  
join orders as o on o.customerid=c.customerid ;

--Write a SQL query to retrieve the list of all orders placed by a particular customer.

select * from orders where customerid=102;

--Write a SQL query to retrieve the list of all orders placed by a particular employee.

select * from orders where employeeid=2;

--Write a SQL query to retrieve the list of all orders placed by a particular customer on a particular date.

select * from orders where customerid=102 and day(orderdate)=20;
--or
select * from orders where customerid=102 and orderdate='2022-02-20';

--Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.

select c.* from cutomers as c left join orders as o on 
o.customerid=c.customerid where o.orderid is null order by c.country;

--Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.

select o.* from orders as o join cutomers as c on 
o.customerid= c.customerid where country='usa' order by orderdate;

--Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.

select e.* from employees as e left join orders as o
on e.employeeid = o.employeeid where orderid is null order by lastname;

--Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.

select c.* from cutomers as c  join orders as o on
c.customerid=o.customerid order by companyname;

--Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.

select distinct e.* from employees as e  
join orders as o on e.employeeid = o.employeeid  order by hiredate;

--Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.

select c.* from cutomers as c join orders as o on o.customerid=c.customerid 
where orderdate='2022-03-25 ' order by companyname;
--or
select * from cutomers as c join orders as o on o.customerid=c.customerid 
where day(orderdate)=25  order by companyname;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.

select c.* , e.employeeid,e.firstname from cutomers as c 
join orders as o on o.customerid =c.customerid join employees 
as e on e.employeeid=o.employeeid;

--Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.

select e.*,c.customerid,c.companyname from cutomers as c 
join orders as o on o.customerid =c.customerid join employees
as e on e.employeeid=o.employeeid;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.

select o.orderid,o.customerid,c.companyname,o.orderdate
from orders as o join cutomers as c on o.customerid=c.customerid;

--Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year, along with the employee name and order date.

select o.*,e.firstname from orders as o join employees 
as e on e.employeeid=o.employeeid where year(birthdate)=1990;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order.

select c.customerid,c.companyname,o.orderid,o.orderdate,e.firstname
from cutomers as c join orders as o on o.customerid=c.customerid join
employees as e on e.employeeid=o.employeeid;

--Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with the customer name and order date.

select o.*,c.companyname from orders as o join cutomers as 
c on c.customerid=o.customerid where c.ContactTitle='ceo';

--Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the employee name and order date.

select o.* , e.firstname from orders as o join employees 
as e on o.employeeid=e.employeeid where e.title='developer';

--Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, order date, and employee who handled the order.

select c.contactname, o.orderdate, e.firstname  
from cutomers as c join orders as o on o.customerid=c.customerid join employees as e on e.employeeid=o.employeeid where day(orderdate)=20;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.

select c.contactname , o.orderdate from cutomers as 
c join orders as o on o.customerid=c.customerid where city='cityville';

--Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, along with the employee name and order date.

select * from employees join orders on employees.employeeid=orders.employeeid
where address like '%rajkot%'

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order, sorted by order date.

select c.contactname, o.orderdate, e.firstname  from cutomers 
as c join orders as o on o.customerid=c.customerid join employees
as e on e.employeeid=o.employeeid order by o.orderdate;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date, sorted by order date.

select c.contactname , o.orderdate from 
cutomers as c join orders as o on o.customerid=c.customerid
where c.country='usa' order by orderdate;





create database Proc_task_ravi

use proc_task_ravi

create table customers(
	cust_id int Primary key identity(100,1),
	cust_fname varchar(20),
	cust_lname varchar(20),
	cust_balance float,
	cust_address varchar(50),
	city varchar(15),
	zip_code int,
);
insert into customers values ('Ravi','Parmar',1000000.00,'Satelite near isro','ahemdabad',380004),
							 ('Rahul', 'Gupta', 10000.00, '123 Gandhi Road', 'Mumbai', 400001),
							 ('Pooja', 'Sharma', 10500.50, '456 Nehru Street', 'Delhi', 110001),
							 ('Amit', 'Patel', 20000.75, '789 Tagore Lane', 'Bangalore', 560001),
							 ('Sneha', 'Singh', 12000.25, '321 Rajput Circle', 'Jaipur', 302001),
							 ('Kiran', 'Yadav', 18000.00, '567 Ganga Nagar', 'Kolkata', 700001),
							 ('Deepak', 'Mishra', 9000.50, '789 Yamuna Lane', 'Chennai', 600001),
							 ('Anjali', 'Rao', 21000.75, '456 Krishna Road', 'Hyderabad', 500001),
							 ('Suresh', 'Verma', 150000.25, '234 Gandhi Nagar', 'Ahmedabad', 380001),
							 ('Ananya', 'Reddy', 22000.50, '678 Indira Street', 'Pune', 411001),
							 ('Rajesh', 'Kumar', 1300.75, '345 Patel Lane', 'Surat', 395001),
							 ('Meena', 'Pandey', 19000.00, '890 Rajasthani Road', 'Lucknow', 226001),
							 ('Vikram', 'Agarwal', 100100.50, '567 Marathi Nagar', 'Nagpur', 440001),
							 ('Shilpa', 'Joshi', 140000.75, '345 Maratha Circle', 'Indore', 452001),
							 ('Ramesh', 'Rajput', 20000.25, '789 Marwadi Lane', 'Bhopal', 462001),
							 ('Neeta', 'Malik', 17000.50, '234 Bihari Street', 'Patna', 800001),
							 ('Alok', 'Shah', 16000.75, '890 Punjabi Lane', 'Chandigarh', 160001),
							 ('Mohan', 'Gandhi', 1300.00, '567 Gujarati Road', 'Kochi', 682001),
							 ('Kavita', 'Iyer', 1400.25, '123 Tamil Circle', 'Coimbatore', 641001),
							 ('Rajiv', 'Nair', 1800.50, '890 Bengali Nagar', 'Visakhapatnam', 530001);
select * from customers		
create table products(
	pro_id int primary key,
	pro_name varchar(20),
	pro_description varchar(100),
	pro_price float,
);

insert into products values(10,'Mac book pro','Mac book pro, by apple',180000.00),
						   (12,'samsung s24','black , 16 gb ram, 512 gb',85000.00),
						   (13,'boat smart watch','golden , blutooth , 7 day battry backup',3000.00),
						   (14,'noise buds','noise truly wireless buds',1500.00),
						   (15,'speaker','jbl mini speaker, blutooth connect',8000.00),
						   (16,'TV','samsung anroid tv , andriod 11, ott support',90000.00),
						   (17,'laptop','Hp ryzen 5 , 8 gb ram , 512 ssd ',60000.00),
						   (18,'printer','hp lazer printer , small',10000.00),
						   (19,'ipad','apple ipad black',120000.00)
						   
select * from products

create table orders(
	ord_id int primary key identity (500,1),
	ord_date date,
	ord_amt float,
	ord_quantity int,
	pro_id int,
	cust_id int,
	foreign key(pro_id) references products(pro_id),
	foreign key(cust_id) references customers(cust_id),
)
select * from orders

-- Insert data into orders table
INSERT INTO orders (ord_date, ord_amt, ord_quantity, pro_id, cust_id)
VALUES
    ('2023-03-22', 85000.00, 2, 12, 101), 
    ('2023-03-23', 3000.00, 1, 13, 102), 
    ('2023-03-24', 1500.00, 1, 14, 103), 
    ('2023-03-25', 8000.00, 1, 15, 104), 
    ('2023-03-26', 90000.00, 1, 16, 105),    
    ('2023-03-27', 60000.00, 1, 17, 106), 
    ('2023-03-28', 10000.00, 1, 18, 107), 
    ('2023-03-29', 120000.00, 1, 19, 108), 
    ('2023-03-30', 85000.00, 1, 12, 109), 
    ('2023-03-31', 8000.00, 1, 15, 100),  
    ('2023-04-01', 3000.00, 1, 13, 111), 
    ('2023-04-02', 1500.00, 1, 14, 112),
    ('2023-04-03', 90000.00, 1, 16, 113), 
    ('2023-04-04', 60000.00, 1, 17, 114), 
    ('2023-04-05', 10000.00, 1, 18, 115), 
    ('2023-04-06', 120000.00, 1, 19, 100), 
    ('2023-04-07', 85000.00, 1, 12, 116), 
    ('2023-04-08', 8000.00, 1, 15, 103), 
    ('2023-04-09', 3000.00, 1, 13, 104), 


--1.Create a stored procedure called "get_customers" that returns all customers from the "customers" table.  

create proc get_customers
as
begin
select * from customers
end;

exec get_customers

--2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.

create proc get_orders
as
begin
select * from orders
end;

exec get_orders

--3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).

create procedure get_order_details
@orderId int
as begin
select o.ord_id,o.ord_date,o.ord_amt,p.pro_name, o.ord_quantity from
orders as o join products as p on p.pro_id=o.pro_id where o.ord_id=@orderId
end;

exec get_order_details @orderId=502

--4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer. 

create procedure get_customer_orders
@custId int
as begin
select o.ord_id,o.ord_date,o.ord_amt, o.ord_quantity,c.cust_id,c.cust_fname from
orders as o join customers as c on c.cust_id=o.cust_id where c.cust_id=@custId
end;

exec get_customer_orders @custId=103


--5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order. 

create procedure get_order_total
@ord_i int 
as 
begin 
select ord_amt as total_amount from orders where ord_id=@ord_i
end;

exec get_order_total @ord_i=501


--6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table. 

create proc get_product_list
as 
begin 
select * from products
end;

exec get_product_list



--7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.  

create proc get_product_info
@id int
as 
begin 
select * from products where pro_id=@id
end;

exec get_product_info @id=12

--8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer. 


create proc get_customer_info
@id int
as 
begin 
select * from customers where cust_id=@id
end;

exec get_customer_info @id=111



--9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the cu

create proc update_customer_info
@id int , @fname varchar(20) , @lname varchar(20) ,@address varchar(50)
as 
begin 
update customers set cust_fname=@fname , cust_lname=@lname ,cust_address =@address  where cust_id=@id
end;


exec update_customer_info @id=100 , @fname='RAVI', @lname='PARMAR' ,@address='Iscone Cross Road'

--10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.

create procedure delete_customer
@id int 
as
begin
delete orders where cust_id=@id
delete customers where cust_id=@id
end;

exec delete_customer @id=101

--11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.

create procedure get_order_count 
@custId int
as begin 
select count(ord_id) as total_count from 
orders as o join customers as c on c.cust_id=o.cust_id where c.cust_id=@custId
end;

exec get_order_count @custId=103




--12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).

create procedure get_customer_balance 
@cu_id int
as 
begin
declare @total_payment float
select @total_payment=sum(ord_amt) from orders where cust_id=@cu_id
declare @total_balance float
select @total_balance=cust_balance from customers where cust_id=@cu_id
select @total_balance-@total_payment
end;


exec get_customer_balance @cu_id=102

--13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.

create procedure get_customer_payments 
@cu_id int
as 
begin
select ord_id,ord_amt,ord_date from orders where cust_id=@cu_id
end;

exec get_customer_payments 100

--14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.

create proc add_customer 
@fname varchar(20),@lname varchar(20), @address varchar(50),@city varchar(15),@zip int
as begin
insert into customers(cust_fname,cust_lname,cust_address,city,zip_code) values (@fname,@lname,@address,@city,@zip)
end;


exec add_customer @fname='ram' ,@lname='shah', @address='120 shindhubhavan road',@city ='ahemdabad',@zip =400001

 
--15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.


create procedure get_top_products
as 
begin
select top 10 p.pro_name,sum(o.ord_quantity) As Total_sell from
products as p join orders as o on p.pro_id=o.pro_id 
group by p.pro_name order by sum(o.ord_quantity) desc
end;

exec get_top_products

--16.Create a stored procedure called "get_product_sales" that accepts a product ID 
--as a parameter and returns the total sales volume for that product.
 

create proc get_product_sales 
@id int
as
begin
select sum(ord_quantity) as total_sells  from
products as p join orders as o on p.pro_id=o.pro_id 
where o.pro_id=@id
end;

exec get_product_sales @id=12



--17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.


create proc get_customer_orders_by_date
@id int ,@start date,@end date
as 
begin
select c.cust_fname as customer_name, o.ord_id,o.ord_date,o.ord_amt from customers as c 
join orders as o on  o.cust_id=c.cust_id where c.cust_id=@id and ord_date between @start and @end
end;

exec get_customer_orders_by_date @id=100, @start='2023-03-21' ,@end='2023-04-01'


--18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.



create proc get_order_details_by_date
@id int ,@start date,@end date
as 
begin
select  o.ord_id,o.ord_date,o.ord_amt from  orders as o  where ord_id=502 and ord_date between @start and @end
end;

exec get_order_details_by_date @id=502, @start='2023-03-21' ,@end='2023-04-01'


--19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.

create proc get_product_sales_by_date
@id int ,@start date,@end date
as 
begin
select count(o.ord_quantity)as total_sell from products as p join orders as o on o.pro_id=p.pro_id where p.pro_id=@id and o.ord_date  between @start and @end
end;


exec get_product_sales_by_date @id=12, @start='2023-03-22' ,@end='2023-03-30'


--20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.




create proc get_customer_balance_by_date
@id int ,@start date,@end date
as 
begin
declare @spend_with_range int
select @spend_with_range=sum(ord_amt) from orders where cust_id=@id and ord_date between @start and @end
select cust_balance-@spend_with_range from customers where cust_id=@id
end;


exec get_customer_balance_by_date @id=100, @start='2023-03-21' ,@end='2023-03-31'





--21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table.


select * from orders


create procedure add_order
@cusId int,@or_date date,@ord_am as float 
as 
begin 
insert into orders (ord_date,ord_amt,cust_id) values (@or_date,@ord_am,@cusId)
end;

exec add_order @cusId=100,@or_date='2023-02-20' , @ord_am=80000.00

--22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.

create procedure update_order_total
@or_id int,@ord_am as float
as
begin
	update orders set ord_amt=@ord_am where ord_id=@or_id
end;
exec update_order_total  @or_id=506 , @ord_am=90000.00


--23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.


create proc delete_order
@or_id int
as
begin
delete orders where ord_id=@or_id
end;

exec delete_order @or_id=523
select * from orders

create table #temp(
	id int ,
	name varchar(20),
);	

 select * from #temp





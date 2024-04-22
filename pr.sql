drop database carshowroom;

create database carshowroom;
SHOW DATABASES;
USE carshowroom;

#Numeric data types such as: INT, TINYINT, BIGINT, FLOAT, REAL, etc.
#Date and Time data types such as: DATE, TIME, DATETIME, etc.
#Character and String data types such as: CHAR, VARCHAR, TEXT, etc.
#Unicode character string data types such as: NCHAR, NVARCHAR, NTEXT, etc.
#Binary data types such as: BINARY, VARBINARY, etc.
#Miscellaneous data types - CLOB, BLOB, XML, CURSOR, TABLE, etc.

CREATE TABLE INVENTORY (
	car_id INT(15) NOT NULL,
    carname char(15),
    price char(15),
    model char(15),
    year_manufactured DATE,
    fuel_type char(10)
);


CREATE TABLE SALE (
	invoice_no int(15),
    car_id int (15),
    cust_id int (15),
    sale_date DATE,
    payment_mode char (15),
    emp_id int(15),
    sale_price int(15)
);

CREATE TABLE CUSTOMER (
		cust_id int (15),
        cust_name char (15),
        cust_add  varchar (100),
        phone_number  varchar(45),
        email varchar (90)
     );

CREATE TABLE EMPLOYEE(
	    emp_id int(15),
        emp_name char(50),
        DOB date,
        DOJ date,
        Designation char(80),
        salary int(20)
        );
        


INSERT INTO INVENTORY 
	(car_id, carname, price, model, year_manufactured, fuel_type) VALUES
	( 001, 'maruthi', '582613', 'LXI', '2017-02-01', 'Petrol'),
	( 002, 'kawasakii', '673112', 'VXI', '2018-04-21', 'Petrol'),
	( 003, 'swift', '567031', 'Sigma1.2', '2019-05-21', 'Petrol'),
	( 004, 'enovva', '647858', 'Delta1.2', '2018-07-28', 'Petrol'),
    ( 005, 'lexus', '355205', '5 str std', '2017-01-16', 'CNG'),
    ( 006, 'jaquar', '654914', 'care', '2018-05-13', 'CNG'),
    ( 007, 'BMW', '514000', 'luxury', '2017-08-19', 'Petrol'),
    ( 008, 'Jaquar_f_type', '614000', 'VXI', '2018-06-22', 'Petrol');

        
INSERT INTO CUSTOMER
  (cust_id,cust_name,cust_add,phone_number,email ) values
	(0001, "AmitSaha", " L-10,california", '4564587852', 'amitsaha2@gmail.com'),
(0002, "raju", "24,Los-angles", '4564587852', 'raju@gmail.com'),
(0003, "amella", " 45,florida", '8975824562', 'amella@gmail.com'),
(0004, "jack", "90,New-jersey", '8974875554', 'jack@gmail.com');

INSERT INTO SALE 
 (invoice_no, car_id, cust_id,  sale_date, payment_mode, emp_id, sale_price) values
 ('0001' , 001, 0001, '2019-01-24', 'Credit_Card', '004',  40000),
  ('0002' , 002, 0002, '2018-12-12', 'Online', '001',  590321),
   ('0003' , 003, 0003, '2019-01-25', 'cheque', '010',  604000),
 ('0004' , 004, 0004, '2018-10-15', 'Bank_finance', '007',  659982),
 ('0005' , 005, 0005, '2018-12-20', 'Credit_Card', '002',  369310),
 ('0006' , 006, 0006, '2019-01-30 ', 'Bank_finance', '007',  620214);
 
 INSERT INTO EMPLOYEE
   (emp_id , emp_name , DOB , DOJ, Designation , salary) values
   ('001','dani', '1994-07-10', '2017-12-12', 'Salesman', '25550'),
	('002','lena', '1990-03-12', ' 2016-06-05', 'Salesman', '33100'),
   ('003','love', ' 1975-08-30 ', '1999-01-08', 'Salesman', '20000'),
   ('004','anii', '1989-06-06', '2010-12-02', 'Salesman', '39100'),
   ('005','jack', '1985-11-03', '2012-07-01', 'Salesman', '27350'),
   ('006','jason', '1993-04-03', '2013-10-23 ', 'Peon', '27352'),
   ('007','angela', '1987-02-26', '2014-07-12', 'Salesman', '31111'),
   ('008','sunderland', '1994-07-10', '2010-10-12', 'Salesman', '75468'),
   ('009','kendra', '1994-07-10', '2014-12-12', 'Receptionist', '21156'),
   ('010','Julia', '1994-07-10', '2013-02-12', 'Salesman', '78945'),
   ('011','cherie', '1994-07-10', '2011-07-12', 'Salesman', '98574');

   
   select * from inventory;  # this is used to retrive all the records from inventory table 
   
   #1 Retrieve the total number of cars in the inventory.
        SELECT COUNT(*) AS TotalCars FROM INVENTORY;   
        
  #2 List all the customers along with their email addresses.
		select cust_name, email from customer;

   #3 Find the average price of the cars in the inventory.
      select avg(price) as avg_car_price from inventory;
      
	#4 Retrieve the names and sale prices of cars sold via bank finance.
		SELECT carname, sale_price FROM INVENTORY
		JOIN SALE ON INVENTORY.car_id = SALE.car_id
		WHERE payment_mode = 'Bank_Finance';
#5 List the customers who made a purchase using a credit card.
	select cust_name, phone_number, email,cust_add  from customer
     join sale on  customer.cust_id = sale. cust_id
     where payment_mode = 'Credit_card';
      
#6 Retrieve the names and salaries of all employees.
 select emp_id, emp_name, salary from employee;

 #7 Find the number of cars sold in 2019.
 select count(*) as totalcount from sale
 where year(sale_date) ="2019";
 #8 List the names and addresses of customers from Delhi.
 select cust_name, cust_add from customer
 where cust_add like '%florida';
 #9 Find the highest sale price among all car sales.
 select  max(sale_price) as highest_sale_price from sale;
#10 Retrieve the names of all customers along with their corresponding sales dates
select cust_name, sale_date from customer
join sale on customer.cust_id = sale.cust_id;
#11 Find the total revenue generated from car sales.
select SUM(sale_price) as total_revenue from sale;
#12 List the names of employees hired after 2010.
select emp_name , DOB , DOJ from employee
where year(DOJ) >= "2010"; 
#13 Retrieve the names of customers who purchased cars manufactured in 2018.
select cust_name from customer
join sale on sale.cust_id = customer.cust_id
join inventory on inventory.car_id = sale.car_id
where year(year_manufactured) = "2018";
#14 Find the average salary of salesman.
select avg(salary) from employee
where Designation = "salesman";
#15 List the names of customers who made purchases using a credit card or online payment.
select cust_name from customer
join sale on sale.cust_id= customer.cust_id 
where payment_mode IN  ("Credit_Card" , "Online");

#16 Retrieve the names of customers who have not made any purchases.
select cust_name from customer 
where cust_id NOT IN (select  cust_id from sale);

#17 Find the total number of cars sold per year.
SELECT YEAR(sale_date) AS SaleYear, COUNT(*) AS TotalCarsSold
FROM SALE
GROUP BY YEAR(sale_date);

#18 List the names of customers who made purchases after 2018.
select cust_name, cust_add from customer
join sale on customer.cust_id = sale.cust_id
where year(sale_date) > "2018";

#19 Retrieve the names of employees with a salary greater than 30000.
select emp_name,emp_id , Designation from employee
where salary > "30000";

#20 Find the total number of sales made by each salesman.
select emp_name, count(*) as totalsales
from employee
join sale on employee.emp_id = sale.emp_id
where designation = "salesman"
group by emp_name;

#21 List the names of customers who purchased cars priced above 600000.
select distinct * from customer
join sale on sale.cust_id = customer.cust_id
join inventory on sale.car_id = inventory.car_id
where price > "600000";

#22 Retrieve the names of employees sorted alphabetically.
select emp_name from employee 
order by emp_name asc;

#23 Find the total number of cars sold in each fuel type category.
SELECT Fuel_type, COUNT(*) AS TotalCarsSold
FROM INVENTORY
JOIN SALE ON INVENTORY.Car_Id = SALE.Car_Id
GROUP BY Fuel_type;

#24 List the names of customers who purchased cars with a model containing '1.2'.
select distinct cust_name from customer
join sale on customer.cust_id =sale.cust_id
join inventory on inventory.car_id = sale.car_id
where model like "%1.2%";

#25 Retrieve the names of employees who were born after 1980.
select * from employee 
where year(DOB) = "1990";

#26 Find the average age of employees.
select AVG(YEAR(current_date())-YEAR(DOB)) AS AVGAGE FROM EMPLOYEE;

#27 List the names of employees who joined the company in 2017.
SELECT emp_name FROM employee
WHERE YEAR(DOJ) = "2017"; 

#28 Retrieve the names of customers who made purchases in January 2019.
SELECT DISTINCT cust_name FROM customer
JOIN SALE ON customer.CUST_ID = SALE.CUST_ID
WHERE YEAR(sale_date) = "2019" AND MONTH(sale_date) = "1";

#29 Find the total number of cars sold by each salesman, ordered by the total number of sales in descending order.
select emp_name,count(*) as TotalSales
from employee
join sale on sale.emp_id = employee.emp_id
where designation = "salesman"
group by emp_name
order by totalsales desc;

#30 List the names of customers who made purchases in jan 2011 and paid via credit card.
SELECT  * FROM customer
JOIN sale  ON sale.cust_id  =  customer.cust_id 
WHERE YEAR(sale_date) > 2011 AND month(sale_date) = 01 AND payment_mode = 'Credit_Card';



















     


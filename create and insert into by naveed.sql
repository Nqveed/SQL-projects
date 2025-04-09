
CREATE TABLE employees1
(
id int PRIMARY KEY,
name varchar(50) NOT NULL,
salary int,
department varchar(50),
dob date )
;
INSERT INTO employees1 
VALUES
select * from employees1
(101,'Jack',2000,'HR','1997-05-1'),
(102,'Jack', NULL,'HR',NULL),
(103,'Mack',6000,'Developer','1997-03-10'),
(104,'Peter',4000,'Tester','1998-07-16'),
(105,'Tom',3000,'HR','1998-11-03'),
(106,'Leo',2500,'Developer','1997-10-10'),
(107,'Roger',5300,'Accounts','1997-06-17'),
(108,'Mike',2000,NULL,'1998-03-09'),
(109,'Paul',4800,'Developer','1998-12-28'),
(110,'Hannah',2000,'Accounts','1999-09-26')
CREATE TABLE products ( 
 prod_id char(10) NOT NULL, 
 prod_name char(255) NOT NULL, 
 price decimal(8,2) NOT NULL, 
 quantity int , 
 PRIMARY KEY (prod_id)
CREATE TABLE products ( 
 prod_id char(10) NOT NULL, 
 prod_name char(255) NOT NULL, 
 price decimal(8,2) NOT NULL, 
 quantity int(10), 
 PRIMARY KEY (prod_id)
);
INSERT INTO Products(prod_id, prod_name, price, quantity)
VALUES('BR01', '8 inch teddy bear', 5.99, 8),
('BR02', '12 inch teddy bear', 8.99,12),
('BR03', '18 inch teddy bear', 11.99, 18),
('BNBG01', 'Fish bean bag toy', 3.49, 7),
('BNBG02', 'Bird bean bag toy', 3.49, 20),
('BNBG03', 'Rabbit bean bag toy', 3.49, 9),
('RGAN01', 'Raggedy Ann', 4.99, 15),
('RYL01', 'King doll', 9.49, 12),
('RYL02', 'Queen doll', 9.49, 26);


CREATE TABLE product_jan
( 
prod_id int NOT NULL, 
prod_name  varchar(45) NOT NULL, 
price  decimal(10,0) NOT NULL, 
quantity  int NOT NULL, 
expiry_date  date NOT NULL, 
PRIMARY KEY  (prod_id)
)
INSERT INTO product_jan 
VALUES
(1,'Chocolate',10,15,'2024-05-10'),
(2,'Biscuits',20,10,'2025-10-30'),
(3,'Noodles',60,5,'2025-11-01'),
(4,'Peanuts',15,20,'2024-06-06'),
(5,'Lays',25,30,'2025-05-17'),
(6,'Oats',40,25,'2025-02-14'),
(7,'Almonds',150,6,'2026-01-18'),
(8,'Pickle',80,3,'2024-12-25');

CREATE TABLE product_feb ( 
prod_id int NOT NULL, 
prod_name varchar(45) NOT NULL,  
price decimal(10,0) NOT NULL, 
quantity int NOT NULL, 
expiry_date date NOT NULL, 
PRIMARY KEY (prod_id)
)


INSERT INTO product_feb VALUES
(1,'Cold Drink',90,10,'2024-08-21'),
(2,'Milk',30,50,'2023-06-20'),
(3,'Noodles',60,5,'2025-11-01'),
(4,'Oil',65,18,'2024-02-28'),
(5,'Lays',25,30,'2025-05-17'),
(6,'Oats',40,25,'2025-02-14')



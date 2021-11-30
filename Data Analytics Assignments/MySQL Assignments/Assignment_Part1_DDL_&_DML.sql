#1.create a database called 'assignment'
#Creating Assignment Database.
Create Database  Assignment;
#Using the Database 'Assignment'
use Assignment;

#2. Create the tables from assignment_tables.sql and enter the records as specified in it.

#3. Create a table called authors with the following columns authorid , name choose appropriate datatypes for the columns
#Creating Table 'authors'
Create Table Authors( author_id int, Name varchar(30));
#See/View the Table describtion/Information
Select * from Authors;
desc Authors;
#a) Insert the following data into the table (for data refer Problem Statement file)
#Inserting Data into the Authors Table
insert into Authors values(1, "J K Rowling"),
						  (2, "Thomas Hardy"),
                          (3, "Oscar Wilde"),
                          (4,"Sidney Sheldon"),
                          (5, "Alistair Maclean"),
                          (6, "Jane Autsen");
#b) Add a couple of authors of your choice
insert into Authors values(7,"Stephen King"),
						  (8,"Chetan Bhagat"),
                          (9,"William Shakespeare"),
                          (10,"Charles Dickens");
#c) Change 'Alistair Maclean' to 'Alastair McNeal'
#Updating a record -- Above Line will Change the name.
update Authors set Name = "Alastair McNeal" where Name = "Alistair Maclean";

#4.Create a table called Books with the following columns bookid, title, authorid, choose appropriate datatypes for the columns
#Creating Table 'Books'
Create Table Books( Bookid int, title varchar(50), authorid int);
#See/View the Table describtion/Information
Select * from Books;
desc Books;
#a) Insert the following records (for data refer Problem Statement file)
#Inserting Records into the Books Table
insert into Books values(1, "Harry Potter and the Philosopher's Stone", 1),
						(2, "Harry Potter and the Chamber of Secrets", 1),
                        (3, "Harry Potter and the Half-Blood Prince", 1),
                        (4, "Harry Potter and the Goblet of Fire", 1),
						(5, "Night Without End", 5),
						(6, "Fear is the Key", 5),
						(7, "Where Eagles Dare", 5),
						(8, "Sense and Sensibility", 6),
						(9, "Pride and Prejudice", 6),
						(10, "Emma", 6),
						(11, "Random Book", 22);
#b) Delete 'Random Book' from the table.
#Deleting a Record From Table book
Delete from Books where Title = "Random Book";

#5.Rename the table Books to Favbooks and Authors to Favauthors.
#Renaming the tables
Alter Table Books Rename to FavBooks;
Alter Table Authors Rename to Favauthors;
#Checking if Renamed Happenend
Select * from Favbooks;
select * from Favauthors;

#6.Create the following tables. Use auto increment wherever applicable
#.b Suppliers
#1st - Creating Suppliers Table
Create Table Suppliers(
	supplier_id int auto_increment,
    supplier_name varchar(30),
    location varchar(50),
    primary key(supplier_id)
);
#a. Products
#First Creating Suppliers Table because As it is referenced for foreign Key.
#2nd - Creating Product Table
Create Table Products(
	product_id int auto_increment,
    product_name varchar(50) not null unique,
    description varchar(100),
    supplier_id int,
    primary key(product_id),
    foreign key(supplier_id) references suppliers(supplier_id) on Delete Set Null
);
#c. Stock
#3rd - Creating Stock Table
Create Table Stocks(
	id int auto_increment,
    product_id int,
    Balance_stock int,
    primary key(id),
    foreign key(product_id) references products(product_id) on delete cascade
);

#Select the Entire 3 Tables
select * from Products;
select * from Suppliers;
select * from Stocks;

#7.Enter some records into the three tables.
#1st insert - Inserting in the Product Table -- for now settinf foreign key to null
insert into Products values(1,"Bread","Breakfast Item",null);
#2nd Insert -- As product_id is auto increment we will have to give columns name of that column
insert into Products(product_name,description,supplier_id)values("Noodles","Nestle Breakfast Item",null),
																("Jam","Kissan Product",null);
#3rd insert - Inserting in the Supplier Table 															
insert into suppliers values(10,"Wips Bread","Mumbai");
#4th Insert -- As product_id is auto increment we will have to give columns name of that column
insert into suppliers(supplier_name,location) value("Nestle","Pune"),
												   ("Kissan","Bangalore");
#5th Insert/Update -- Updating the supplier_id column of product table as 
#it was foreign key of supplier table and now supplier table is complete.
update products set supplier_id = 10 where product_id = 1;
update products set supplier_id = 11 where product_id = 2;
update products set supplier_id = 12 where product_id = 3;

#6th insert - Inserting in the Supplier Table 
insert into stocks values(01,1,50);
#7th Insert -- As id is auto increment we will have to give columns name of that column
insert into stocks(product_id,Balance_stock)values(2,40),
												  (3,70);
                                                  
#8. Modify the supplier table to make supplier name unique and not null.
Alter Table suppliers modify column supplier_name varchar(60) not null unique;
#describe the Supplier table to check changes.
desc suppliers;

#9. Modify the emp table as follows
#To Modify emp table First Creating emp Table.(Code From Consolidated Tables)
CREATE TABLE  emp  (
   emp_no  int(11) NOT NULL,
   birth_date  date NOT NULL,
   first_name  varchar(14) NOT NULL,
   last_name  varchar(16) NOT NULL,
   gender  enum('M','F') NOT NULL,
   hire_date  date NOT NULL,
   salary  float(8,2) DEFAULT 7850.00
) ;
#Insertion of Record is done from consolidatedTables Script
Select * from emp;
#a. Add a column called deptno to the Emp Table
Alter Table Emp add column deptno int not null;
#Checking the Emp table to see if Deptno column is added or not
select * from emp;
desc Emp;
#b. Set the value of deptno in the following order (for order refer Problem Statement)
#Using A Function to Update
update emp
set deptno = case 
		when (emp_no % 5) = 0 then  50
		when (emp_no % 4) = 0 then  40
        when (emp_no % 3) = 0 then  30
        when (emp_no % 2) = 0 then  20
		else 10 
        End;


# 10. Create a unique, hash index on the emp_no column. 
#Creating a hash Index
Create Unique index hidx using Hash on emp(emp_no);
#Checking the Emp table to see if Deptno column is added or not
select * from emp;
desc Emp;

#Assignment Part1 is Done for Part2 Refer Assignment_part2_DML Script
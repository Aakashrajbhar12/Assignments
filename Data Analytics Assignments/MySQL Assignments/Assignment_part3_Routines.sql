#Using the Database 'Assignment'
use Assignment;
#1.Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. The month should be abbreviated to three characters.
#Created and Inserted the Required table and Records from the Given ConsolidatedTable Script. (Customers and Order table)
#View the Records
Select * From customers;
Select * from Orders;
#Calling the Store Procedure "Qtn1"
call Qtn1('Feb',2003);
call Qtn1('Apr',2004);

#2.Write a stored procedure to insert a record into the cancellations table for all cancelled orders.
#STEPS:
#a.Create a table called cancellations with the following.(For Fields Refer Problem Statement File)
Create Table Cancellations(
		id int auto_increment,
        Customer_Number int,
        Order_Number int,
        Comments text,
        primary key(id),
        foreign key (Customer_Number) references Orders(Customernumber) on delete Cascade,
        foreign key (Order_Number) references Orders(orderNumber) on delete Cascade
        );
#Describe the Entire Tables
desc Cancellations;
#Calling the Store Procedure "Qtn2" 
#This will insert the Record which are Cancelled    
call Qtn2("Cancelled");
#Checking if the Records are Inserted or Not
select * from Cancellations;

#3.a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
#Created and Inserted the Required table and Records from the Given ConsolidatedTable Script. (Payment table)
#View the Records 
Select * From payments;		
#Calling the Function & Store Procedure "Qtn3" (I did both)
Select Qtn3_Func(103);  #Function
Call Qtn3(103);	 #Procedure
#3.b. Write a query that displays customerid, customername and purchase_status
select customerNumber, customerName, Qtn3_Func(CustomerNumber)
from customers;


#4.Write a stored procedure that checks the creditlimit and the purchase status of the customers.(For More Refer Problem Statement) 
Select * From Orders;
Select * From Customers;
Select * From Payments;
#Adding Purchase_status Column to the Payments Table for Procedure/Cursor
alter table Payments add column Purchase_status varchar(20);
#Inserting /Updating The Puchase_Status Column 
update Payments
set Purchase_Status = case 
		when amount < 25000 then "Silver"
		when amount between 25000 and 50000 then "Gold"
        when amount > 50000 then "Platinum"
		else "No Status"
        End;
#Calling the Procedure
Call Qtn4();	
#Checking the Update if it happened or not.
select customers.customerNumber, customers.Creditlimit, payments.amount,payments.purchase_status
from customers
join payments
where customers.customerNumber = payments.customerNumber;

#5. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.
#Created and Inserted the Required table and Records from the Given ConsolidatedTable Script. (Movies and Rentals table)
#View the Records & desc table
Select * From movies;
Select * from Rentals;
desc movies;
-- On Update Cascade
delimiter //
Create Trigger upd_cascade
After Update on movies
for Each row
Begin
	Update rentals set movieid = new.id
	where movieid = old.id;
End; //
delimiter ;

#Checking Update Cascade

#Updating the Parent Table Movies
Update Movies set id = 11 where id = 10;
#Checking The Update on the Parent Table Movies
Select * from Movies;
#Checking The Update on the child Table Rentals Based on update Cascade
Select * from Rentals;

-- on delete Cascade
delimiter //
Create Trigger del_cascade
After Delete on movies
for Each row
Begin
	Delete from rentals 
	where movieid = old.id;
End; //
delimiter ;

#Checking Delete Cascade
#Deleting on the Parent table Movies
Delete from Movies where id = 8;
#Checking The Delete on the Parent table Movies
Select * from Movies;
#Checking The Delete on the Child Table Rentals Based on Delete Cascade
Select * from Rentals;

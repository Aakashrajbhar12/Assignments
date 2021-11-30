#Using the Database 'Assignment'
use Assignment;
#1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
#Created and Inserted table and Records from the Given ConsolidatedTable Script.
#View the Records
Select * From employee;
#Query to Fetch all employees in department 10 whose salary is greater than 3000
Select * from employee where deptno = 10 and salary > 3000;

#2. The grading of students based on the marks they have obtained is done as follows
#Created and Inserted table and Records from the Given ConsolidatedTable Script.
#View the Records
Select * From Students;
#a. How many students  have graduated with first class?
select count(id) as "Total Student with First Class" from Students where marks between 50 and 80;
#b. How many students  have obtained distinction?
select count(id) as "Total Student with Distinctions" from Students where marks between 80 and 100;

#3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
#Created and Inserted table and Records from the Given ConsolidatedTable Script.
#View the Records
Select * From station;
Select distinct(city) as City_Names,id as Even_id from station where (id % 2) = 0;

#4.Find the difference between the total number of city entries in the table and the number of distinct city entries in the table.
# In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.[table: station]
select count(city) as N, count(distinct city) as N1, count(city) - count(distinct city) as Difference from Station;

#5.a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
#Query For Fetching Cities Starting with vowels
select distinct city from station where left(city,1) in ('a','e','i','o','u');
#5.b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
#Query For Fetching Cities Starting & Ending with vowels
select distinct city from station where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u');
#5.c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
#Query For Fetching Cities that does not Starts with vowels
select distinct city from station where left(city,1)  not in ('a','e','i','o','u');
#5.d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]
#Query For Fetching Cities That does not Starting & Ending with vowels
select distinct city from station where left(city,1) Not in ('a','e','i','o','u') and right(city,1) Not in ('a','e','i','o','u');

#7. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 10 months. Sort your result by ascending emp_id. [table: emp]
select emp_no, first_name, last_name, salary,timestampdiff(month,hire_date,sysdate()) as MonthOfExp
from emp where salary>2000 and ((timestampdiff(month,hire_date,sysdate())) < 20) order by emp_no;

#8. How much money does the company spend every month on salaries for each department? [table: emp]
#Query to Fetch sum of Salary for Each Department
select sum(salary), deptno from emp group by deptno;

#9.How many cities in the CITY table have a Population larger than 100000. [table: city]
#Created and Inserted table and Records from the Given ConsolidatedTable Script.
#View the Records
Select * From city;
#Query to fetch number of city  have a Population larger than 100000
select count(id) from city where population >= 100000; 

#10. What is the total population of California? [table: city]
#Query to get sum of population of California
select sum(population) from city where district = "California";

#11. What is the average population of the districts in each country? [table: city]
#Query to get average population of the districts in each country
select avg(population) as "Average Population", countrycode from city group by countrycode;

#Assignment Part2 is Done for Part3 Refer Assignment_part3_Routines Script
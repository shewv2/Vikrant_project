create database WALMART;
 use WALMART;
 
 create table features(
 Store int,
 Date DATE,
 Temperature Decimal,
 Fuel_Price Decimal,
 MarkDown1 Decimal,
 MarkDown2 Decimal,
 MarkDown3 Decimal,
 MarkDown4 Decimal,
 MarkDown5 Decimal,
 CPI Decimal,
 Unemployment Decimal,
 IsHoliday boolean
 );
 
 select * from features;
 

Create table stores(
store int,
type float,
size int
);

select * from stores;

Create table test(
store int,
Dept int,
Date date,
 IsHoliday boolean
);

select * from test;


Create table train(
store int,
Dept int,
Date date,
weekly_sales decimal,
IsHoliday boolean
);

select * from train;


-- four tables show below.
select * from features;
select * from stores;
select * from test;
select * from train;
-- Different queries for above sales of Walmart.

-- 1) get the vales of all Markdown column and CPI column from features table also neglect the NA value.
select * from features;
select MarkDown1, MarkDown2, MarkDown3, MarkDown4, MarkDown5, CPI
from features 
where MarkDown1 <> 'NA'
and MarkDown2 <> 'NA'
and MarkDown3 <>'NA'
and MarkDown4 <>'NA'
and MarkDown5 <>'NA';

-- 2) Calculate the avg fuel price between the year of 2010 to 2015 from fetaures ?
select * from features;
select avg(Fuel_Price) as avg_fuel_price_2010_to_2015 FROM features
where date between '2010-01-01' and '2015-12-31';

-- 3) Join 'features' and 'stores' tables on the 'Store' column ?
Select * from features as f
join stores , features; 

-- 4) join 'train' and 'test' on the test column.
select * from test as t join train,test;

-- 5) Filter data from 'train' table for a specific store 2 and department 1 ?
select * from train;
select * from train  as t
where store = 2
and  Dept = 1;

-- 6) retrive the data of Isholiday and Weekly_sales from train in which weekly sales should be greter than 25k.
select * from train;
SELECT IsHoliday, Weekly_Sales as w
FROM train
Where Weekly_sales>25000;


-- 7) Calculate total weekly sales for each store ?
select * from tables;
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales
FROM train
GROUP BY Store;


-- 8) Retrieve specific columns from the 'features' table for a particular store  1 
SELECT Store, Date, Fuel_price, CPI from features
where Store = 1; 


-- 9) Calculate the average temperature for each store
SELECT Store, AVG(Temperature) AS Avg_Temperature
FROM features
GROUP BY Store;

-- 10) Find out the number of stores of each type 
SELECT Type, COUNT(*) AS Store_Count
FROM stores
GROUP BY Type;

-- 11) Retrieve the number of tests conducted on holidays and non-holidays
SELECT IsHoliday, COUNT(*) AS Test_Count
FROM test
GROUP BY IsHoliday;



-- ------------------------------------------------------------------------------------------------Adventure Works----------------------------------------------------------------------------------------------------------------- 


use adventureworks;


Select * from Total_Sales;

Select * from Total_Profit;

Select * from Profit_Margin;

Select * from Total_Customers;

Select * from Products;

Select * from Countries;




-- ------------------------------------------------------------------------------------------------Sales Analysis----------------------------------------------------------------------------------------------------------------- 


-- Year wise Sales and Profit
select year(orderdate) as Year ,sum(sales) as Sales,sum(Profit) as Profit
from Sales 
group by Year
order by year asc;


-- Month wise Sales and Profit
select monthname(orderdate) as Month ,sum(sales) as Sales,sum(Profit) as Profit
from Sales 
group by month;


-- Quarter wise Sales and Profit
select concat("Q",Quarter(orderdate)) as Quarter ,sum(sales) as Sales,sum(Profit) as Profit
from Sales 
group by Quarter
order by quarter asc;




-- ------------------------------------------------------------------------------------------------Customers Analysis----------------------------------------------------------------------------------------------------------------- 


-- Customer wise Sales
select cus.Full_name as Customers,sum(sal.sales) as Sales
from customer as cus join sales as sal on sal.customerkey=cus.customerkey
group by customers
order by Sales desc;


-- Gender 
call gender ("Men");
call gender ("Women");


-- MaritalStatus
call MaritalStatus("Single");
call MaritalStatus("Married");


-- Education
SELECT * FROM Education;


-- Occupation
SELECT * FROM Occupation;


SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, cus.birthdate, CURDATE()) BETWEEN 0 AND 19 THEN '0-19'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 20 AND 39 THEN '20-39'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 40 AND 59 THEN '40-59'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >= 60 THEN '60+'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS group_count
FROM people
GROUP BY age_group
ORDER BY age_group;




-- ------------------------------------------------------------------------------------------------Product Analysis----------------------------------------------------------------------------------------------------------------- 


-- Category wise Sales
select EnglishProductCategoryName as Category, sum(Sales)
From category as cat join sub_category as subcat on cat.ProductCategoryKey=subcat.ProductCategoryKey
join product as pro on subcat.ProductSubcategoryKey=pro.ProductSubcategoryKey
join sales as sal on sal.ProductKey=pro.ProductKey
group by Category;


-- Sub Category wise Sales
select EnglishProductSubcategoryName as Sub_Category, sum(Sales) as Sales
From Sub_category as subcat 
join product as pro 
on pro.ProductSubcategoryKey=subcat.ProductSubcategoryKey
join sales as sal 
on sal.ProductKey=pro.ProductKey
group by Sub_Category
order by Sales desc;


-- Product wise sales
select EnglishProductName as Product, sum(Sales) as Sales
From Product as pro 
join sales as sal 
on sal.ProductKey=pro.ProductKey
group by Product
order by Sales desc;


-- Country wise Sales
Select SalesTerritoryCountry as Country ,sum(Sales) as Sales
from territory as ter join sales as sal on sal.SalesTerritoryKey=ter.SalesTerritoryAlternateKey
group by Country
order by Sales desc;







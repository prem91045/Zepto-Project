
-- USE zepto;

 ---  CREATE TABLE zepto(
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL, 
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT, 
    discountSellingPrice DECIMAL(8,2),
    weightInGram INT,
    outOfStock BOOLEAN,
    Quantity INT 
);

--- data exploration --

select * from zepto;

--- counting row -- 

select count(*) from zepto ;

--- finding null values ---

select * from zepto where 
category is null or name is null or mrp is null or
discountPercent is null or availableQuantity is null or
weightInGms is null or outOfStock is null or quantity is null ;

--- different product category ---
 use zepto ;
select distinct category from zepto order by category ;
 
--- product in stock vs product out of stock ---
select outOfStock , count(quantity) from zepto group by outOfStock ;

--- 	product name present multiple times ---
select name, count(*) as "repeat_count"  from zepto
group by name 
having count(*) > 1 
order by repeat_count asc ;

--- data cleaing --- 

--  product with price = 0 --- 
 select * from zepto where mrp = '0' ;

--- delete product ----

delete from zepto where mrp = '0' ;	

---- converting paise to rupee ---
update zepto set mrp = mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0 ;

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name,mrp,discountPercent from zepto
order by discountPercent desc limit 10 ;

--  Q2.What are the Products with High MRP but Out of Stock.

select distinct name , mrp from zepto
where outOfStock = 'true' and mrp > 300 order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category

select category , sum(discountedSellingPrice * availableQuantity)  as 'Total_revenue'from zepto
group by category order by Total_revenue ;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select name ,mrp, discountpercent from zepto
where mrp > '500' and discountpercent < '10' ;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category , avg(discountpercent) as 'avg_discountpercent' from zepto
group by category order by avg_discountpercent desc limit 5 ;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name , weightInGms, discountedsellingprice, 
(discountedsellingprice/weightInGms) as 'price_per_gram' from zepto
where weightInGms 	>= 100 order by price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.

select distinct NAME,
case when weightingms  < 1000  then 'low'
	when weightingms < 5000 then 'medium'
    else 'bulk'end as weight_category from zepto ;

-- Q8.What is the Total Inventory Weight Per Category
select category ,sum(weightingms * availablequantity) as 'Total_weight'
from zepto group by category
order by Total_weight ;    

-- Q9. Which products are running low on stock (less than 50 units) 
	but are not yet completely out of stock?

SELECT name, availableQuantity  
FROM zepto  
WHERE availableQuantity < 50 AND outOfStock = FALSE  
ORDER BY availableQuantity ASC;


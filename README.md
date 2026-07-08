# Zepto Quick-Commerce Data Analysis 🛒

## Project Overview
This project analyzes product inventory, pricing strategies, and stock availability from Zepto, a rapid grocery delivery service. Using SQL, the project explores the raw dataset to clean the data and extract business-critical insights regarding estimated revenue, discount trends, and inventory management.

## Dataset
The data used in this project is stored in the **`zepto_v2.csv`** file. It contains product details across various grocery and utility categories, including pricing (MRP and selling price), stock levels, and product weights.

## Database Schema
The analysis is based on the following `zepto` table structure:

```sql
CREATE TABLE zepto(
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL, 
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT, 
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    Quantity INT 
);

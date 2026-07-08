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

🧹 Phase 1: Data Exploration & Cleaning
Before diving into complex queries, the raw data was prepped to ensure accuracy and reliability. Key steps included:

Initial Exploration: Counted total records, identified duplicate product listings, and analyzed the overall split between in-stock and out-of-stock items.

Null Value Checks: Scanned for missing data across all critical columns (category, price, stock, etc.).

Data Cleaning: Safely removed invalid product entries, specifically identifying and deleting items listed with an MRP of 0.

Currency Formatting: Updated financial columns to convert currency from paise to rupees, ensuring accurate revenue calculations moving forward.

📊 Phase 2: Key Business Insights
The core of the project involves answering strategic business questions using advanced SQL queries:

Discount Strategy: Identified the top 10 best-value products based on the highest discount percentage to understand promotional focuses.

Lost Revenue Potential: Highlighted high-ticket products (MRP > ₹300) that are currently out of stock, indicating missed sales opportunities.

Revenue Estimation: Calculated the total potential revenue for each product category based on current inventory levels and discounted selling prices.

Premium Products Analysis: Filtered for premium products (MRP > ₹500) offering minimal discounts (<10%) to analyze profit margins.

Category-Level Discounts: Grouped data to find the top 5 product categories offering the highest average discount percentage.

Value for Money: Calculated the exact price-per-gram for products weighing over 100g, sorting them to find the best value for cost-conscious customers.

Inventory Categorization: Utilized CASE statements to segment products into "Low" (<1kg), "Medium" (<5kg), and "Bulk" weight categories for easier logistics tracking.

Warehousing Metrics: Aggregated the total inventory weight currently held per category to assist in warehouse space allocation.

Restock Alerts: Created a critical query to flag products running low on stock (less than 50 units) but not yet completely depleted, enabling proactive restocking.

💻 Tech Stack & SQL Techniques
Language: SQL (Compatible with MySQL / PostgreSQL)

Techniques Used:

Aggregation Functions (SUM, AVG, COUNT)

Grouping & Sorting (GROUP BY, ORDER BY)

Conditional Logic (CASE statements)

Filtering (WHERE, HAVING)

Data Modification (UPDATE, DELETE)

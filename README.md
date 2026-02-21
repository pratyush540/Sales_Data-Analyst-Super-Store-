# 📊 Superstore Sales Analysis | PostgreSQL

## 👤 Author
Pratyush Anand  
Data Analyst | SQL | Power BI | Python  

---

## 📌 Project Overview

This project performs a comprehensive Sales Performance Analysis on the Superstore dataset using PostgreSQL.

The objective is to extract meaningful business insights from raw transactional data using:

- Aggregations
- Window functions
- CTEs
- Ranking logic
- Profitability calculations
- Growth rate analysis

The analysis covers revenue trends, profitability, customer behavior, product performance, discount impact, and shipping trends.

---

## 🛠️ Tech Stack

- PostgreSQL
- SQL (Advanced Queries)
- Window Functions
- CTE (Common Table Expressions)
- Analytical Functions

---


---

## 🚀 Business Impact

This analysis enables stakeholders to:

- Identify high-performing and loss-making products
- Monitor revenue growth trends
- Optimize discount strategies
- Improve regional profitability
- Strengthen customer retention strategies

---

## 📌 Conclusion

This project demonstrates strong analytical thinking using SQL, transforming raw sales data into actionable business intelligence.

It highlights the ability to:
- Perform structured exploratory data analysis
- Use advanced SQL functions
- Translate data into strategic insights
- Build portfolio-grade analytics projects

## 📂 Dataset

Table Used:


The dataset contains transactional sales data including:

- Order Details
- Product Information
- Customer Information
- Region & Segment
- Sales, Quantity, Profit, Discount
- Shipping Mode

---

## 📊 Key Business Analysis Performed

### 1️⃣ Data Quality Checks
- Total record count
- Null value detection
- Duplicate order detection
- Distinct value validation (Category, Region, Segment, Ship Mode)

---

### 2️⃣ Overall Business Summary
- Total Sales
- Total Quantity Sold
- Total Profit
- Profit Margin %

---

### 3️⃣ Performance Breakdown
- Category-wise performance
- Region-wise performance
- Ship Mode performance
- Segment-wise contribution

---

### 4️⃣ Time-Based Analysis
- Yearly Sales & Profit Trends
- Monthly Sales Performance
- Month-over-Month Growth Rate
- Revenue trend tracking using window functions

---

### 5️⃣ Product-Level Insights
- Top 10 products by Sales
- Bottom 10 products by Sales
- Top 10 products by Profit
- Loss-making products
- Profit Margin by Category
- Top-performing product by region (Ranking logic)

---

### 6️⃣ Customer Behavior Analysis
- Customers with single purchase
- Customer revenue contribution

---

### 7️⃣ Discount Impact Study
- Average Profit by Discount Level
- Profitability sensitivity to discount changes

---

### 8️⃣ Shipping Mode Analysis
- Shipping frequency
- Sales distribution by shipping method

---

## 📈 Advanced SQL Concepts Used

- `RANK()` window function
- `LAG()` for growth rate calculation
- `DATE_TRUNC()` for time-series aggregation
- `EXTRACT()` for year/month grouping
- `NULLIF()` to prevent division by zero
- CTEs for structured query logic

---

## 🎯 Key Insights

- Revenue is unevenly distributed across regions.
- Certain high-sales products generate negative profit.
- Profit margins vary significantly across categories.
- Discount levels directly impact profitability.
- Sales growth fluctuates month-to-month.
- Some customers contribute only one-time purchases.

---

## 📁 Repository Structure


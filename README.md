# 📊 Retail Sales Analysis using SQL

## 📌 Project Overview
This project analyzes retail sales data using SQL to uncover insights into product performance, customer behavior, regional trends, and profitability.

The analysis focuses on identifying key drivers of revenue and profit, evaluating the impact of discounts on performance, and highlighting opportunities for business improvement.

---

## 🎯 Project Objectives
- Analyze sales and profit performance across products, regions, and customer segments  
- Identify top-performing and underperforming categories  
- Evaluate customer contribution to revenue  
- Examine sales trends over time  
- Assess the impact of discounts on profitability  

---

## 📊 Dataset Description
The dataset contains retail transaction data including order details, customer information, product categories, sales, profit, quantity, discount, and regional data.

Key columns used:
- Order Date  
- Region  
- Category & Sub-Category  
- Customer Name  
- Segment  
- Sales  
- Profit  
- Quantity  
- Discount  

---

## 🧠 Business Questions
1. Which products generate the highest total profit?  
2. Which categories and sub-categories are underperforming?  
3. Which customers generate the highest revenue?  
4. Which regions generate the highest total sales?  
5. Which regions generate the highest total profit?  
6. What is the sales trend over time (monthly and yearly)?  
7. Which customer segments perform best in terms of sales and profit?  
8. How does discount affect profit?

---
## 🧠 SQL Analysis

### 1. Top Products by Profit

**Approach:**
I grouped the data by product name and calculated total profit for each product. I then sorted the results in descending order to identify the most profitable products.

```sql
SELECT TOP 10
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM dbo.Sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC;
```

---

### 2. Underperforming Categories & Sub-Categories

**Approach:**
I grouped the data by category and sub-category and calculated total profit for each group. I then sorted the results in ascending order to identify the least profitable and loss-making segments.

```sql
SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM dbo.Sales
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC;
```

---

### 3. Top Customers by Revenue

**Approach:**
I grouped the data by customer name and calculated total sales for each customer. I then sorted the results in descending order to identify the customers with the highest revenue.

```sql
SELECT TOP 10
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
```

---

### 4. Sales by Region

**Approach:**
I grouped the data by region and calculated total sales for each region. I then sorted the results in descending order to identify the highest-performing regions by revenue.

```sql
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales
GROUP BY Region
ORDER BY Total_Sales DESC;
```

---

### 5. Profit by Region

**Approach:**
I grouped the data by region and calculated total profit for each region. I then sorted the results in descending order to identify the most profitable regions.

```sql
SELECT
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM dbo.Sales
GROUP BY Region
ORDER BY Total_Profit DESC;
```

---

### 6. Sales Trend Over Time

**Approach:**
I extracted the year and month from the order date and grouped the data accordingly. I then calculated total sales for each period and sorted the results chronologically to analyze trends over time.

```sql
SELECT
    DATEPART(MONTH, Order_Date) AS Month,
    DATEPART(YEAR, Order_Date) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales
GROUP BY DATEPART(YEAR, Order_Date),
         DATEPART(MONTH, Order_Date)
ORDER BY Year ASC, Month ASC;
```

---

### 7. Customer Segment Performance

**Approach:**
I grouped the data by customer segment and calculated total sales and total profit for each segment. I then sorted the results in descending order to identify the best-performing segments based on profitability and revenue.

```sql
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM dbo.Sales
GROUP BY Segment
ORDER BY Total_Profit DESC, Total_Sales DESC;
```

---

### 8. Discount vs Profit Analysis

**Approach:**
I grouped the data by rounded discount levels and calculated the average profit for each group. I then sorted the results in ascending order to observe how profit changes as discount increases.

```sql
SELECT 
    ROUND(Discount, 1) AS Discount,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM dbo.Sales
GROUP BY ROUND(Discount, 1)
ORDER BY Discount ASC;
```

## 🔍 Key Insights

### 📊 Product Performance

* A small number of products contribute significantly to total profit, indicating a concentration of profitability among key items.
* This suggests that focusing on high-performing products can drive overall business growth.

---

### 📉 Underperforming Segments

* Several sub-categories generate low or negative profit, indicating inefficiencies in pricing, cost structure, or demand.
* These segments may require strategic review, such as pricing adjustments or cost optimization.

---

### 👥 Customer Contribution

* A small group of customers contributes a large share of total revenue.
* This highlights the importance of retaining high-value customers and strengthening customer relationships.

---

### 🌎 Regional Performance

* The West region generates the highest sales and profit, making it the strongest-performing region overall.
* The Central region, despite generating sales, records lower profit, suggesting possible high costs or discounting.

---

### 📈 Sales Trends

* Sales show variation across months and years, indicating possible seasonal demand patterns.
* Identifying peak periods can help optimize marketing and inventory planning.

---

### 🧩 Customer Segments

* The Consumer segment generates the highest sales and profit, making it the most valuable customer segment.
* Differences in performance across segments may reflect varying purchasing behaviors and pricing sensitivity.

---

### 🏷️ Discount Impact

* There is a clear negative relationship between discount and profit.
* Low discount levels (0–0.1) maintain positive profitability, while higher discounts significantly reduce profit and lead to losses.
* Interestingly, a 10% discount yields higher average profit than no discount, suggesting a pricing “sweet spot” that balances demand and margin.

----

## 📌 Conclusion

This project demonstrates how SQL can be used to analyze retail sales data and generate meaningful business insights.

The analysis revealed key performance drivers across products, regions, customers, and segments, while also highlighting areas of concern such as underperforming categories and the negative impact of excessive discounting on profitability.

Overall, the findings emphasize the importance of data-driven decision-making in optimizing sales strategies, improving profitability, and identifying growth opportunities.

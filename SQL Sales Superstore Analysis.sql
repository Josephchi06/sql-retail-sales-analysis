--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

-----BUSINESS OBJECTIVES

----The objective of this project is to analyze sales performance across
----regions, products, and customers to identify key drivers of revenue and profitability.

----Question 1
----Which products generate the highest total profit?


SELECT TOP 10
Product_Name,
ROUND(SUM(Profit),2) AS Total_profit

FROM dbo.Sales

GROUP BY Product_Name

ORDER BY Total_profit  DESC
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

-----Question 2
-----Which categories and sub-categories have the lowest profit (underperforming)?

SELECT
Category,
Sub_Category,
ROUND(SUM(profit),2) AS Total_profit

FROM dbo.Sales

GROUP BY Category, Sub_Category

ORDER BY Total_profit ASC

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

-----Question 3
-----Which customers generate the highest revenue?

SELECT TOP 10
Customer_Name,
ROUND(SUM(Sales),2) AS Total_sales

FROM dbo.Sales

GROUP BY Customer_Name

ORDER BY Total_sales DESC


--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

----Question 4
----Which regions generate the highest revenue?

SELECT 
Region,
ROUND(SUM(Sales),2) AS Total_sales

FROM dbo.Sales

GROUP BY Region

ORDER BY Total_sales DESC


--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

----Question 5
----Which region generates the highest total profit?

SELECT
Region,
ROUND(SUM(profit),2) AS Total_Profit

FROM dbo.Sales

GROUP BY Region

ORDER BY Total_Profit DESC

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

---Question 6
---What is the sales trend over time (monthly and yearly)?

SELECT
DATEPART(MONTH,Order_Date) AS Month,
DATEPART(YEAR,Order_Date) AS year,
ROUND(SUM(Sales),2) AS Total_sales

FROM dbo.Sales

GROUP BY DATEPART(YEAR,Order_Date),
DATEPART(MONTH,Order_Date) 

ORDER BY DATEPART(YEAR,Order_Date) ASC,
DATEPART(MONTH,Order_Date) ASC


--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

---Question 7
---Which customer segments (Consumer, Corporate, Home Office) perform best in terms of sales and profit?

SELECT
Segment,
ROUND(SUM(Sales),2) AS Total_sales,
ROUND(SUM(Profit),2) AS Total_profit

FROM dbo.Sales 

GROUP BY Segment

ORDER BY Total_profit DESC,
Total_sales DESC

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

---Question 8
--- How does discount affect profit?

SELECT 
ROUND(Discount,1) AS Discount,
ROUND(AVG(Profit),2) AS Avg_Profit

FROM dbo.Sales

GROUP BY ROUND(Discount,1)

ORDER BY Discount ASC


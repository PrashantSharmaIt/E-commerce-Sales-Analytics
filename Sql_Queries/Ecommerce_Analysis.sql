
-- Create Database and Use it
CREATE DATABASE Ecommerce_DB;
USE Ecommerce_DB;

-- Note: We are using a JOIN between Orders and Details table on 'Order ID'
-- The queries below simulate the 'Qtr 3' filter applied in the Power BI Dashboard

-- ==========================================
-- 1. TOP LEVEL KPIs (Filtered for Q3)
-- ==========================================

SELECT 
    SUM(d.Amount) AS Total_Amount,
    SUM(d.Quantity) AS Total_Quantity,
    SUM(d.Profit) AS Total_Profit,
    -- AOV = Total Amount / Distinct Order Count
    ROUND(SUM(d.Amount) / COUNT(DISTINCT o.`Order ID`), 2) AS Average_Order_Value
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3;

-- ==========================================
-- 2. SALES & PROFITABILITY VISUALS
-- ==========================================

-- Sum of Amount by State (Top States)
SELECT o.State, SUM(d.Amount) AS Total_Amount
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY o.State
ORDER BY Total_Amount DESC
LIMIT 5;

-- Sum of Amount by CustomerName (Top Customers)
SELECT o.CustomerName, SUM(d.Amount) AS Total_Amount
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY o.CustomerName
ORDER BY Total_Amount DESC
LIMIT 4;

-- Profit by Month (Bar Chart - July, August, September)
SELECT 
    MONTHNAME(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month_Name, 
    SUM(d.Profit) AS Total_Profit
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY Month_Name
ORDER BY MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y'));

-- Sum of Profit by Sub-Category
SELECT d.`Sub-Category`, SUM(d.Profit) AS Total_Profit
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY d.`Sub-Category`
ORDER BY Total_Profit DESC;

-- ==========================================
-- 3. PRODUCT & PAYMENT ANALYTICS
-- ==========================================

-- Sum of Quantity by Category (Donut Chart % distribution)
SELECT 
    d.Category, 
    SUM(d.Quantity) AS Total_Quantity,
    ROUND((SUM(d.Quantity) / (SELECT SUM(Quantity) FROM Details d2 JOIN Orders o2 ON d2.`Order ID` = o2.`Order ID` WHERE QUARTER(STR_TO_DATE(o2.`Order Date`, '%d-%m-%Y')) = 3)) * 100, 2) AS Percentage
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY d.Category
ORDER BY Total_Quantity DESC;

-- Sum of Quantity by PaymentMode
SELECT 
    d.PaymentMode, 
    SUM(d.Quantity) AS Total_Quantity
FROM Details d
JOIN Orders o ON d.`Order ID` = o.`Order ID`
WHERE QUARTER(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) = 3
GROUP BY d.PaymentMode
ORDER BY Total_Quantity DESC;

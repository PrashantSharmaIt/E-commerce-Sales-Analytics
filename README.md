# 🛒 E-Commerce Sales & Profitability Analytics

## 📌 Project Overview
This project is an interactive Business Intelligence dashboard designed to analyze e-commerce sales performance, customer purchasing behavior, and overall profitability. By merging transactional data with customer demographic data, this project helps business stakeholders identify high-value geographic regions, optimize product categories, and track quarterly financial health.

**Author**: Prashant Sharma  
**Tools Used**: Power BI, SQL, Relational Data Modeling, Excel  
**Dataset**: E-commerce Orders and Transaction Details.
📊 Dashboard Preview (Q3 Performance)
The view below is filtered specifically for Quarter 3 (Q3) performance, demonstrating the dashboard's time-intelligence capabilities.

💡 Key Business Findings (Based on Q3 Analysis)
By analyzing the third quarter (July, August, September), several critical insights were uncovered:

Profitability Challenges: Despite generating 72K in Revenue and selling 1K items in Q3, the overall profit margins were negative (-1K Net Profit). This was heavily driven by steep losses in July and September, indicating potential issues with heavy discounting, shipping costs, or seasonal slumps.

Top Markets: Madhya Pradesh and Maharashtra emerged as the most lucrative states by revenue, highlighting where marketing efforts are yielding the best geographic ROI.

Product Category Mix: Clothing dominated the sales volume, accounting for 60% of total quantity sold, far outpacing Furniture (21%) and Electronics (19%).

Profit Drivers: While overall profit was negative, the Bookcases and Tables sub-categories remained highly profitable, suggesting a need to evaluate the pricing strategy for loss-making items.

Payment Preferences: Cash on Delivery (COD) was the preferred payment method for 43% of transactions, followed by UPI (25%), underscoring the importance of offering flexible, trust-based local payment options.

🛠️ Technical Implementation
Relational Data Modeling: Built a robust star-schema data model in Power BI by establishing a 1-to-Many relationship between the Orders (Dimension) and Details (Fact) tables using Order ID as the primary/foreign key.

DAX & Time Intelligence: Created dynamic measures for Average Order Value (AOV) and implemented Quarter-level filtering using Power BI's interactive slicers.

SQL Backend Validation: Utilized advanced JOIN operations, Date/Time formatting (QUARTER(), MONTHNAME()), and aggregation functions in SQL to extract and validate the same KPIs presented in the dashboard.

📁 Repository Structure
/Data: Contains the Orders.csv and Details.csv datasets.

/Dashboard: Contains the Power BI (.pbix) file and the dashboard visual preview.

/SQL_Queries: Contains Ecommerce_Analysis.sql, showcasing the JOIN logic and quarter-specific data extraction.

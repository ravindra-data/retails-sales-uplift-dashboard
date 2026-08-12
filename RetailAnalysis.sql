CREATE DATABASE retail_analysis;
USE retail_analysis;

SHOW TABLES;

SELECT * FROM retail_transactions;

-- ==================================================================================================
-- Sales Uplift : Strategy Insights from Multi-Region Retial Data.
-- Dataset : Retail_Transactions 

-- ==================================================================================================

-- Q1. Total Sales Amount per region for the last quarter.

SELECT 
	Region,
    ROUND(SUM(TotalAmount),2) AS TotalSales
FROM retail_transactions
WHERE Date >= DATE_SUB(
	(SELECT MAX(Date) FROM retail_transactions), INTERVAL 3 MONTH)
GROUP BY Region
ORDER BY TotalSales DESC;

-- ====================================================================================================

-- Q2. Top 5 Best Selling Products (by Revenue).

SELECT 
	ProductName,
    ROUND(SUM(TotalAmount), 2)  AS Revenue
FROM retail_transactions
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 5;

-- ======================================================================================================

-- Q3. Monthly Sales Trend Across all Regions.

SELECT
	DATE_FORMAT( Date, '%Y-%m-%d') AS Months,
    Region,
    ROUND(SUM(TotalAmount),2) AS MonthlySales
FROM retail_transactions
GROUP BY Months, Region
ORDER BY Months;

-- ========================================================================================================

-- Q4. Region-Wise Contribution to total Sales (as %).

SELECT
	Region,
    ROUND(SUM(TotalAmount),2) AS RegionSales,
    ROUND(100.0 * SUM(TotalAmount) / 
    (SELECT SUM(TotalAmount) FROM retail_transactions),2) AS Contribution
FROM retail_transactions
GROUP BY Region
ORDER BY Contribution DESC;

-- ==========================================================================================================

-- Q5. Compare Online vs Offline Sales Across all Months.

SELECT
	DATE_FORMAT(Date, '%y-%m-%d') AS Months,
    SalesChannel,
    ROUND(SUM(TotalAmount),2) AS ChannelSales
FROM retail_transactions
GROUP BY Months, SalesChannel
ORDER BY SalesChannel;

-- ==========================================================================================================

-- Q6. Sales Trend by Category - which Categories are rising / falling?

WITH MonthlySales AS(
	SELECT
		DATE_FORMAT(Date, '%y-%m') AS Month,
        Category,
        SUM(TotalAmount) AS TotalSales
	FROM retail_transactions
    GROUP BY DATE_FORMAT(Date, '%y-%m'), Category
)

SELECT
	Month,
    Category,
    ROUND(TotalSales,2) AS TotalSales,
    Round(
		LAG(TotalSales) OVER(
			PARTITION BY Category
            ORDER BY Month
		),2 
	) AS PreviousMonthSales,
	CASE
		WHEN LAG(TotalSales) OVER (PARTITION BY Category ORDER BY Month) IS NULL 
			THEN 'First Month'
        WHEN TotalSales > LAG(TotaLSales) OVER (PARTITION BY Category ORDER BY Month) 
			THEN 'Rising'
        WHEN TotalSales < LAG(TotalSales) OVER (PARTITION BY Category ORDER BY Month) 
			THEN 'Falling'
        ELSE 'No Change'
	END AS Trend
FROM MonthlySales 
ORDER BY Category , Month;

-- ===========================================================================================================

-- Q7. List Customers who purchased more than 10 times.

SELECT
	CustomerID,
    COUNT(TransactionID) AS TotalPurchases
FROM retail_transactions
GROUP BY CustomerID
HAVING COUNT(TransactionID) > 10
ORDER BY TotalPurchases DESC;

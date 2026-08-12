# Retail Sales Uplift Dashboard

SQL analysis and an interactive Power BI dashboard built on 50,000 retail transactions spanning January 2024 to July 2026 across four regions.

## Overview

This project analyzes multi-region retail transaction data to surface sales trends, regional performance, product and category insights, and channel/payment behavior. It combines exploratory SQL queries with a Power BI dashboard for stakeholder-facing reporting.

## Dataset

- **Source file:** `RetailTransactions.csv`
- **Rows:** 50,000 transactions
- **Date range:** 2024-01-01 to 2026-07-27
- **Fields:** TransactionID, Date, ProductName, Category, Region, SalesChannel, Quantity, UnitPrice, TotalAmount, PaymentMode, CustomerID

**Dimensions covered:**
- **Regions:** North, South, East, West
- **Categories:** Electronics, Clothing, Groceries, Beauty & Personal Care, Home & Kitchen, Sports & Fitness, Books & Stationery
- **Sales channels:** Online, Offline
- **Payment modes:** UPI, Credit Card, Cash, Net Banking

## Key metrics

| Metric | Value |
|---|---|
| Total sales | $841.49M |
| Total transactions | 50,000 |
| Unique customers | 11,832 |
| Average order value | $16.83K |
| Total quantity sold | 1,02,677 |

## Files in this repo

| File | Description |
|---|---|
| `RetailAnalysis.sql` | SQL queries for regional sales, top products, monthly trends, category trend detection (rising/falling), online vs offline comparison, and high-frequency customer identification |
| `Sales_Uplift_Dashboard.pbix` | Power BI dashboard with KPI cards, monthly sales trend, regional breakdown, product performance, payment mode analysis, and channel split |
| `RetailTransactions.csv` | Source transaction dataset |

## SQL analysis included

1. Total sales per region for the most recent quarter
2. Top 5 best-selling products by revenue
3. Monthly sales trend across all regions
4. Region-wise contribution to total sales (%)
5. Online vs offline sales comparison across months
6. Category-level trend detection (rising / falling / no change) using window functions
7. Customers with more than 10 purchases (loyalty/frequency segment)

## Dashboard features

- KPI summary cards (total sales, transactions, customers, AOV, quantity)
- Monthly sales trend line chart
- Regional sales breakdown (donut chart)
- Top products by sales (bar chart)
- Sales by payment mode
- Online vs offline channel split
- Interactive filters: Month, Region, Sales Channel, Payment Mode

## Notable finding

Monthly sales and transaction volumes are consistent across the full 2.5-year period (~1,450–1,750 transactions and $24M–$30M per month), with no significant seasonal collapse in any single month. This stability suggests steady demand across the dataset's timeframe rather than sharp seasonal cycles — useful context for forecasting and inventory planning.

## Tools used

- **MySQL** — data loading, cleaning, and exploratory SQL analysis
- **Power BI Desktop** — interactive dashboard and DAX measures
- **DAX** — custom measures for time intelligence and trend calculations

## How to use

1. Import `RetailTransactions.csv` into MySQL using `RetailAnalysis.sql` as a reference for table structure and analysis queries
2. Open `Sales_Uplift_Dashboard.pbix` in Power BI Desktop to explore the interactive dashboard
3. Use the filter panel (Month, Region, SalesChannel, PaymentMode) to drill into specific segments

## Author

Ravindra Kumar

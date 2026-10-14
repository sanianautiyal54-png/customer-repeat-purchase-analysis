Customer Repeat Purchase Analysis

Project Overview

This project analyzes customer purchasing behavior to understand repeat purchases, customer loyalty, and spending patterns. Python and SQL were used to clean transaction data, identify repeat customers, calculate the repeat purchase rate, and compare first-time and repeat customer segments.

Objective

- Measure the repeat purchase rate.
- Identify first-time and repeat customers.
- Compare average order value (AOV) between customer segments.
- Analyze customer purchasing patterns.
- Generate business insights and recommendations to improve customer retention.

Tools and Technologies

- Python – Data cleaning, analysis, customer segmentation, and visualization.
- Pandas – Data manipulation and aggregation.
- Matplotlib / Seaborn – Data visualization, where applicable.
- SQL Server (SSMS) – SQL queries and business analysis.
- Google Colab – Python development environment.
- GitHub – Project documentation and version control.

Dataset

Dataset: Online Retail II

The dataset contains retail transaction records with information such as:

- Invoice
- StockCode
- Description
- Quantity
- InvoiceDate
- Price
- Customer_ID
- Country

The data was used to analyze purchasing behavior at the customer and order levels.

Data Cleaning

The following steps were performed during data preparation:

- Checked dataset dimensions and column names.
- Examined missing values.
- Removed transactions without customer IDs.
- Excluded cancelled invoices.
- Filtered invalid quantities and prices.
- Removed duplicate records.
- Converted customer IDs to an appropriate data type.
- Calculated transaction revenue using quantity multiplied by price.

Analysis Performed

1. Repeat Purchase Analysis

- Counted distinct orders for each customer.
- Identified customers who placed more than one order.
- Calculated the overall repeat purchase rate.

2. Customer Segmentation

Customers were divided into two groups:

- First-time Customers: Customers with one distinct order.
- Repeat Customers: Customers with more than one distinct order.

3. Average Order Value (AOV)

Compared average order value between first-time and repeat customer segments to understand differences in purchasing behavior.

4. Revenue Analysis

Analyzed customer revenue and identified high-value repeat customers.

5. Monthly Purchasing Trends

Examined monthly customer activity and repeat purchasing patterns.

Key Results

The Python analysis produced the following results:

Metric| Result
Total Customers| 4,312
Repeat Customers| 2,893
First-time Customers| 1,419
Repeat Purchase Rate| 67.09%

The repeat purchase rate was calculated as:

Repeat Purchase Rate = (Repeat Customers / Total Customers) × 100

These figures are based on the cleaned dataset used in the Python analysis. SQL results may differ if the filtering rules or transaction-level data differ.

Business Insights

- A substantial proportion of customers made repeat purchases during the analysis period.
- First-time and repeat customer segments provide different perspectives on customer loyalty.
- Comparing AOV helps identify differences in spending behavior between the two segments.
- High-value repeat customers can be prioritized for customer retention initiatives.
- Monitoring monthly customer activity can help identify changes in purchasing behavior.

Recommendations

1. Encourage Second Purchases: Use follow-up emails, targeted offers, and product recommendations to encourage first-time customers to return.
2. Reward Customer Loyalty: Introduce loyalty points, exclusive offers, or repeat-purchase incentives.
3. Retain High-Value Customers: Identify valuable repeat customers and develop suitable retention strategies.
4. Monitor Key Metrics: Track repeat purchase rate, customer segments, revenue, and AOV regularly.
5. Improve Customer Experience: Use customer purchasing patterns to support better product recommendations and personalized marketing.

SQL Analysis

SQL Server was used to perform the following analyses:

- Dataset validation and transaction filtering.
- Orders per customer.
- Identification of repeat customers.
- Repeat purchase rate calculation.
- First-time versus repeat customer segmentation.
- Revenue and AOV comparison.
- Top repeat customers by revenue.
- Monthly customer purchasing activity.
- Overall business summary.

Project Files

- "README.md" – Project documentation.
- "Customer_Repeat_Purchase_Analysis.ipynb" – Python analysis notebook.
- "Customer_Repeat_Purchase_Analysis.sql" – SQL queries.

Conclusion

This project demonstrates how Python and SQL can be used together to analyze customer purchasing behavior. By calculating repeat purchase rates, segmenting customers, and comparing spending patterns, businesses can better understand customer loyalty and identify opportunities to improve retention and revenue.

Skills Demonstrated

Python, Pandas, SQL, SQL Server, Data Cleaning, Exploratory Data Analysis, Customer Segmentation, KPI Calculation, Data Analysis, and Business Insights.# customer-repeat-purchase-analysis
Analyzed customer purchasing behavior using Python and SQL to calculate repeat purchase rate, segment customers, compare average order value (AOV), and generate business insights to improve customer retention.

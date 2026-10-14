SELECT TOP 5 *
FROM onlineretail;

SELECT COUNT(*) AS TotalRows
FROM onlineretail;

SELECT COUNT(*) AS Valid_Rows
FROM onlineretail
WHERE Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
  AND Quantity > 0
  AND Price > 0;

-- Count orders for each customer
SELECT
    Customer_ID,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM onlineretail
WHERE Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
  AND Quantity > 0
  AND Price > 0
GROUP BY Customer_ID
ORDER BY Total_Orders DESC;

-- Find customers with more than one order
SELECT
    Customer_ID,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    SUM(Quantity * Price) AS Total_Revenue
FROM onlineretail
WHERE Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
  AND Quantity > 0
  AND Price > 0
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Invoice) > 1
ORDER BY Total_Orders DESC;

-- Calculate repeat and first-time customer counts
WITH CustomerOrders AS (
    SELECT Customer_ID,
           COUNT(DISTINCT Invoice) AS Total_Orders
    FROM onlineretail
    WHERE Customer_ID IS NOT NULL
      AND Invoice NOT LIKE 'C%'
      AND Quantity > 0
      AND Price > 0
    GROUP BY Customer_ID
)
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Total_Orders > 1
             THEN 1 ELSE 0 END) AS Repeat_Customers,
    SUM(CASE WHEN Total_Orders = 1
             THEN 1 ELSE 0 END) AS First_Time_Customers,
    CAST(
        100.0 * SUM(CASE WHEN Total_Orders > 1
                         THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS Repeat_Purchase_Rate
FROM CustomerOrders;

-- Classify customers as first-time or repeat
WITH CustomerOrders AS (
    SELECT Customer_ID,
           COUNT(DISTINCT Invoice) AS Total_Orders,
           SUM(Quantity * Price) AS Total_Revenue
    FROM onlineretail
    WHERE Customer_ID IS NOT NULL
      AND Invoice NOT LIKE 'C%'
      AND Quantity > 0
      AND Price > 0
    GROUP BY Customer_ID
)
SELECT *,
    CASE WHEN Total_Orders = 1
         THEN 'First-time'
         ELSE 'Repeat'
    END AS Customer_Segment
FROM CustomerOrders;

-- Compare customers, revenue, orders, and average order value
WITH CustomerOrders AS (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Invoice) AS Total_Orders,
        SUM(Quantity * Price) AS Total_Revenue
    FROM onlineretail
    WHERE Customer_ID IS NOT NULL
      AND Invoice NOT LIKE 'C%'
      AND Quantity > 0
      AND Price > 0
    GROUP BY Customer_ID
),
Segments AS (
    SELECT *,
        CASE WHEN Total_Orders = 1
             THEN 'First-time'
             ELSE 'Repeat'
        END AS Customer_Segment
    FROM CustomerOrders
)
SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers,
    SUM(Total_Orders) AS Total_Orders,
    CAST(SUM(Total_Revenue) AS DECIMAL(18,2))
        AS Total_Revenue,
    CAST(AVG(Total_Revenue / NULLIF(Total_Orders, 0))
        AS DECIMAL(18,2)) AS Average_Order_Value
FROM Segments
GROUP BY Customer_Segment;

-- Find the highest-revenue repeat customers
SELECT TOP 10
    Customer_ID,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    CAST(SUM(Quantity * Price) AS DECIMAL(18,2))
        AS Total_Revenue
FROM onlineretail
WHERE Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
  AND Quantity > 0
  AND Price > 0
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Invoice) > 1
ORDER BY Total_Revenue DESC;

-- Track monthly returning customers
WITH CustomerMonth AS (
    SELECT
        Customer_ID,
        DATEFROMPARTS(
            YEAR(InvoiceDate), MONTH(InvoiceDate), 1
        ) AS Order_Month,
        COUNT(DISTINCT Invoice) AS Monthly_Orders
    FROM onlineretail
    WHERE Customer_ID IS NOT NULL
      AND Invoice NOT LIKE 'C%'
      AND Quantity > 0
      AND Price > 0
    GROUP BY Customer_ID,
             YEAR(InvoiceDate), MONTH(InvoiceDate)
)
SELECT
    Order_Month,
    COUNT(*) AS Active_Customers,
    SUM(CASE WHEN Monthly_Orders > 1
             THEN 1 ELSE 0 END) AS Multiple_Order_Customers
FROM CustomerMonth
GROUP BY Order_Month
ORDER BY Order_Month;

-- Summarize revenue and order activity
SELECT
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    CAST(SUM(Quantity * Price) AS DECIMAL(18,2))
        AS Total_Revenue,
    CAST(
        SUM(Quantity * Price)
        / NULLIF(COUNT(DISTINCT Invoice), 0)
        AS DECIMAL(18,2)
    ) AS Average_Order_Value
FROM onlineretail
WHERE Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
  AND Quantity > 0
  AND Price > 0;


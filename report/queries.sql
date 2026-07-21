query1 =
SELECT Category, Sub_Category,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct
FROM sales
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC;
result1 = pd.read_sql(query1, conn)
print(result1)


query2 = 
SELECT Region,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       ROUND(AVG(Discount), 3) AS Avg_Discount
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;
result2 = pd.read_sql(query2, conn)
print(result2)


query3 = 
SELECT Segment,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       COUNT(*) AS Total_Orders
FROM sales
GROUP BY Segment
ORDER BY Total_Profit DESC;
result3 = pd.read_sql(query3, conn)
print(result3)

query4 = 
SELECT `Ship Mode`,
       ROUND(AVG(Profit), 2) AS Avg_Profit,
       ROUND(AVG(Discount), 3) AS Avg_Discount,
       COUNT(*) AS Order_Count
FROM sales
GROUP BY `Ship Mode`
ORDER BY Avg_Profit DESC;
result4 = pd.read_sql(query4, conn)
print(result4)
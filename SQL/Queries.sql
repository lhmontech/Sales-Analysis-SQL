-- How much the interprise faturates per month?
SELECT
    YEAR(o.Order_Date)  AS year,
    MONTH(o.Order_Date) AS month,
    SUM(oi.Quantity * oi.Unit_Price) AS revenue
FROM Orders o
JOIN Order_Items oi ON oi.Order_ID = o.Order_ID
GROUP BY
    YEAR(o.Order_Date),
    MONTH(o.Order_Date)
ORDER BY
    year, month;

-- What is the month that have more orders?
SELECT 
    DATE_FORMAT(Order_Date, '%m-%Y') AS month,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY DATE_FORMAT(Order_Date, '%m-%Y')
ORDER BY total_orders DESC;

-- Wich Game sells the most?
SELECT
	g.Game_Name,
    SUM(oi.Quantity) AS amount
FROM Games g
JOIN Order_Items oi ON oi.Game_ID = g.Game_ID
GROUP BY Game_Name
ORDER BY amount DESC;

-- Wich Genre of game sells more?
SELECT
	g.Game_Genre,
    SUM(oi.Quantity) AS amount
FROM Games g
JOIN Order_Items oi ON oi.Game_ID = g.Game_ID
GROUP BY Game_Genre
ORDER BY amount DESC;

-- What is the ticket average order value?
SELECT
	Order_ID,
    SUM(Unit_Price * Quantity) / SUM(Quantity) as ticket
FROM Order_Items
GROUP BY Order_ID
ORDER BY ticket DESC;

 -- List the total invested by each client per Stock --
SELECT dbo.Clients.ClientID,dbo.Clients.Name, dbo.stocks.Ticker, SUM(Price_at_Buy * Quantity) AS "Total_Price"
FROM dbo.Transactions
INNER JOIN dbo.Clients ON dbo.Clients.ClientID = dbo.Transactions.ClientID
INNER JOIN dbo.Stocks ON dbo.Stocks.StockID = dbo.Transactions.StockID
GROUP BY dbo.Clients.ClientID, dbo.stocks.Ticker, dbo.Clients.Name
ORDER BY Total_Price DESC

 -- Current wallet value (based on current price) -- 
 SELECT dbo.Clients.ClientID, dbo.Clients.Name, SUM ((dbo.stocks.price - Price_at_buy)*dbo.Transactions.Quantity) AS "Profit"
FROM dbo.Transactions
INNER JOIN dbo.Clients ON dbo.Clients.ClientID = dbo.Transactions.ClientID
INNER JOIN dbo.Stocks ON dbo.Stocks.StockID = dbo.Transactions.StockID
GROUP BY dbo.Clients.ClientID, dbo.Clients.Name
ORDER BY Profit DESC

-- Composition of assets by each sector --
SELECT C.Name, S.Sector, FORMAT(SUM((S.Price * T.Quantity)/C.AUM)*100, 'N2') + '%' AS "Ratio_Per_Sector"
FROM dbo.transactions T
INNER JOIN dbo.Clients C ON C.ClientID = T.ClientID
INNER JOIN dbo.Stocks S ON S.StockID = T.sTOCKid
GROUP BY  C.Name, S.Sector
ORDER BY Ratio_Per_Sector DESC

-- Profit/loss by asset --
SELECT C.Name, S.Ticker, SUM((S.Price - T.Price_at_Buy)* T.Quantity) AS "Profit"
FROM dbo.Transactions T
INNER JOIN dbo.Clients C ON C.ClientID = T.ClientID
INNER JOIN dbo.Stocks S ON S.StockID = T.StockID
GROUP BY C.Name, S.Ticker
ORDER BY Profit DESC

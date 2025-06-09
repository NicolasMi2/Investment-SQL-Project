-- List the total invested by each client per Stock --
SELECT dbo.Clients.ClientID,dbo.Clients.Name, dbo.stocks.Ticker, SUM(Price_at_Buy * Quantity) AS "Total_Price"
FROM dbo.Transactions
INNER JOIN dbo.Clients ON dbo.Clients.ClientID = dbo.Transactions.ClientID
INNER JOIN dbo.Stocks ON dbo.Stocks.StockID = dbo.Transactions.StockID
GROUP BY dbo.Clients.ClientID, dbo.stocks.Ticker, dbo.Clients.Name
ORDER BY Total_Price DESC
 -- Current wallet value (based on current price) -- 
 SELECT dbo.Clients.ClientID, dbo.Clients.Name, SUM ((dbo.stocks.price - Price_at_buy)*dbo.Transactions.Quantity) AS "Profit"
FROM dbo.Transactions
INNER JOIN dbo.Clients ON dbo.Clients.ClientID = dbo.Transactions.ClientID
INNER JOIN dbo.Stocks ON dbo.Stocks.StockID = dbo.Transactions.StockID
GROUP BY dbo.Clients.ClientID, dbo.Clients.Name
ORDER BY Profit DESC

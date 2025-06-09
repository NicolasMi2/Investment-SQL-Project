
-- Profit/loss by asset --
SELECT C.Name, S.Ticker, SUM((S.Price - T.Price_at_Buy)* T.Quantity) AS "Profit"
FROM dbo.Transactions T
INNER JOIN dbo.Clients C ON C.ClientID = T.ClientID
INNER JOIN dbo.Stocks S ON S.StockID = T.StockID
GROUP BY C.Name, S.Ticker
ORDER BY Profit DESC

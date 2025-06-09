-- Composition of assets by each sector --
SELECT C.Name, S.Sector, FORMAT(SUM((S.Price * T.Quantity)/C.AUM)*100, 'N2') + '%' AS "Ratio_Per_Sector"
FROM dbo.transactions T
INNER JOIN dbo.Clients C ON C.ClientID = T.ClientID
INNER JOIN dbo.Stocks S ON S.StockID = T.sTOCKid
GROUP BY  C.Name, S.Sector
ORDER BY Ratio_Per_Sector DESC
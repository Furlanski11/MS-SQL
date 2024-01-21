SELECT c.[Name] AS Client, MAX(p.Price) AS Price, c.NumberVAT AS [VAT Number]
FROM Clients c
JOIN ProductsClients pc ON pc.ClientId = c.Id
JOIN Products p ON p.Id = pc.ProductId
WHERE C.[Name] NOT LIKE '%KG'
GROUP BY c.[Name], c.NumberVAT
ORDER BY MAX(p.Price) DESC

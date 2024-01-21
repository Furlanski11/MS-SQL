SELECT c.[Name] AS Client, FLOOR(AVG(p.Price)) AS [Average Price]
FROM Clients c
JOIN ProductsClients pc ON c.Id = pc.ClientId
JOIN Products p ON pc.ProductId = p.Id
JOIN Vendors v ON p.VendorId = v.Id
WHERE pc.ClientId IS NOT NULL AND p.VendorId  IN (4, 7, 8)
GROUP BY c.[Name]
ORDER BY AVG(p.Price) ASC, c.[Name] DESC



SELECT TOP(7) i.Number, i.Amount, c.[Name]
FROM Invoices i
JOIN Clients c ON c.Id = i.ClientId
WHERE IssueDate < '2023-01-01' AND Currency = 'EUR'
	OR Amount > 500.00 AND NumberVAT LIKE 'DE%'
ORDER BY I.Number, I.Amount DESC
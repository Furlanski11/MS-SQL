SELECT p.Id, p.[Name], p.Price, c.[Name] as CategoryName
FROM Products as p
JOIN Categories as c ON c.Id = p.CategoryId
WHERE c.[Name] IN ('ADR', 'Others')
ORDER BY p.Price DESC

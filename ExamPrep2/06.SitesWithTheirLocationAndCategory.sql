SELECT s.[Name], l.[Name], Establishment, c.[Name] 
FROM Sites AS s
JOIN Locations AS l ON s.LocationId = l.Id
JOIN Categories AS c ON s.CategoryId = c.Id
ORDER BY c.[Name] DESC, l.[Name], s.[Name] 
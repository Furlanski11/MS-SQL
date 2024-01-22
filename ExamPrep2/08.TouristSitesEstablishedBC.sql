SELECT s.[Name], l.[Name], l.Municipality, l.Province, s.Establishment
FROM Sites AS s
JOIN Locations AS l ON s.LocationId = l.Id
WHERE LEFT(l.[Name], 1) NOT IN ('B', 'D', 'M')   AND s.Establishment LIKE '%BC%'
ORDER BY s.[Name]
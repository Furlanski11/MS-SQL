SELECT top(10) h.[Name], d.[Name], c.[Name]
FROM Bookings b
JOIN Hotels h ON b.HotelId = h.Id
JOIN Destinations d ON h.DestinationId = d.Id
JOIN Countries c ON d.CountryId = c.Id
WHERE b.ArrivalDate < '2023-12-31'
AND h.Id % 2 = 1
ORDER BY c.[Name], b.ArrivalDate
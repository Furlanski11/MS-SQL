SELECT h.[Name] AS HotelName, r.Price AS RoomPrice
FROM Tourists t
JOIN Bookings b ON b.TouristId = t.Id
JOIN Hotels h ON b.HotelId = h.Id
JOIN Rooms r ON b.RoomId = r.Id
WHERE t.[Name] NOT LIKE '%EZ' AND h.Id = b.HotelId
ORDER BY r.Price DESC
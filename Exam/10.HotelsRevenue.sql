SELECT h.[Name] AS HotelName, SUM(DATEDIFF(day,b.ArrivalDate, b.DepartureDate) * r.Price) AS HotelRevenue
FROM Bookings b
JOIN Hotels h on b.HotelId = h.Id
JOIN Rooms r ON b.RoomId = r.Id
GROUP BY h.[Name] 
ORDER BY HotelRevenue DESC
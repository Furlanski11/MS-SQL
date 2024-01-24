SELECT h.Id, h.[Name] FROM Hotels h
JOIN HotelsRooms hr ON h.Id = hr.HotelId
JOIN Rooms r ON hr.RoomId = r.Id
WHERE r.[Type] = 'VIP Apartment'
ORDER BY (SELECT COUNT(*) FROM Bookings
	WHERE HotelId = h.Id) DESC
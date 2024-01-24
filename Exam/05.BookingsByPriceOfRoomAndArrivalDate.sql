SELECT FORMAT(ArrivalDate, 'yyyy-MM-dd') AS ArrivalDate, AdultsCount, ChildrenCount 
FROM Bookings b
JOIN Rooms r ON b.RoomId = r.Id
ORDER BY r.Price DESC, b.ArrivalDate
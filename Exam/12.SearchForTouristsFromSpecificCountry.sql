CREATE PROC usp_SearchByCountry(@country NVARCHAR(50))
AS
	SELECT t.[Name], t.PhoneNumber, t.Email, COUNT(b.Id) AS CountOfBookings 
	FROM Tourists t
	JOIN Bookings b ON t.Id = b.TouristId
	JOIN Rooms r ON b.RoomId = r.Id
	JOIN Hotels h ON b.HotelId = h.Id
	JOIN Countries c ON t.CountryId = c.Id
	WHERE c.[Name] = @country
	GROUP BY t.[Name], t.PhoneNumber, t.Email
	ORDER BY t.[Name], CountOfBookings DESC

	EXEC usp_SearchByCountry 'Greece'
	
	
	
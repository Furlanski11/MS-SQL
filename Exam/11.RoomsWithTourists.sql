CREATE FUNCTION udf_RoomsWithTourists(@name NVARCHAR(50))
RETURNS INT
BEGIN
	DECLARE @answer INT = 
	( SELECT SUM(b.ChildrenCount) + SUM(B.AdultsCount)
	FROM Bookings b 
	JOIN Rooms r ON b.RoomId = r.Id
	WHERE r.[Type] = @name
	)
	RETURN @answer
END
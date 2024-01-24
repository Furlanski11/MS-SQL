DELETE FROM Bookings WHERE TouristId IN (6, 25)
DELETE FROM Tourists
WHERE SUBSTRING(Name, CHARINDEX(' ', Name) + 1, LEN(Name)) = 'Smith'
SELECT Id, [Name], PhoneNumber 
FROM Tourists t
WHERE Id NOT IN (SELECT TouristId FROM Bookings )
ORDER BY [Name] 
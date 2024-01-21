CREATE PROC usp_SearchByCountry(@country VARCHAR(50))
AS
	SELECT v.[Name], v.NumberVAT, CONCAT_WS(' ', a.StreetName, a.StreetNumber) AS [Street Info], CONCAT_WS(' ', a.City, a.PostCode)
	FROM Addresses a
	JOIN Vendors v ON a.Id = v.AddressId
	JOIN Countries c ON a.CountryId = c.Id
	WHERE c.[Name] = 'France'

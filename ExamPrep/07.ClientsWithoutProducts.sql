SELECT c.Id, c.[Name], CONCAT_WS(', ', CONCAT(a.StreetName, ' ', a.StreetNumber), a.City, a.PostCode, ct.[Name]) as [Address]
FROM Clients as c
JOIN Addresses as a ON a.Id = c.AddressId
JOIN Countries as ct ON a.CountryId = ct.Id
WHERE c.Id NOT IN (
	SELECT ClientId 
	FROM ProductsClients
)
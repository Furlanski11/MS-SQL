CREATE FUNCTION udf_ProductWithClients(@name NVARCHAR(30))
	RETURNS INT
		AS
			BEGIN
			DECLARE @answer INT = (
				SELECT COUNT(ProductId)
				FROM ProductsClients pc
				JOIN Clients c ON pc.ClientId = c.Id
				JOIN Products p ON pc.ProductId = p.Id
				WHERE p.[Name] = @name
				)
				RETURN @answer
			END
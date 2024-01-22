CREATE FUNCTION udf_GetTouristsCountOnATouristSite (@Site VARCHAR(50))
RETURNS INT
BEGIN
	DECLARE @count INT = (
		SELECT COUNT(st.TouristId) 
		FROM SitesTourists as st
		JOIN Sites AS s ON st.SiteId = s.Id
		WHERE s.[Name] = @Site
	)
	RETURN @count
END
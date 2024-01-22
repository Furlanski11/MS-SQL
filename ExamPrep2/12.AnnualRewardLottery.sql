CREATE PROC usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
	DECLARE @points INT = (
		SELECT COUNT(st.TouristId)
		FROM SitesTourists AS st
		JOIN Tourists AS t ON st.TouristId = t.Id
		WHERE @TouristName = t.[Name]
	)
	
	IF(@points >= 100)
	BEGIN
		UPDATE Tourists
		SET Reward = 'Gold badge'
		WHERE [Name] = @TouristName
	END
	ELSE IF(@points >= 50)
	BEGIN
		UPDATE Tourists
		SET Reward = 'Silver badge'
		WHERE [Name] = @TouristName
	END
	ELSE IF(@points >= 25)
	BEGIN
		UPDATE Tourists
		SET Reward = 'Bronze badge'
		WHERE [Name] = @TouristName
	END

SELECT [Name], Reward 
FROM Tourists
WHERE [Name] = @TouristName
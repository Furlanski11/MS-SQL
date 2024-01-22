SELECT t.[Name], t.Age, t.PhoneNumber, t.Nationality, CASE
	WHEN bp.[Name] IS NULL THEN '(no bonus prize)'
	ELSE bp.[Name]
END AS 'Reward'
FROM Tourists AS t
LEFT JOIN TouristsBonusPrizes AS tb ON t.Id = tb.TouristId
LEFT JOIN BonusPrizes AS bp ON tb.BonusPrizeId = bp.Id
ORDER BY t.[Name]

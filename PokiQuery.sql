SELECT *
FROM Grade


SELECT *
	FROM Emotion

SELECT MAX(Id) NumberOfPoems
	FROM Poem

SELECT a.Name
	FROM Author a Where Id < 77
	ORDER BY Name 
	
	
SELECT a.Name, g.Name
	FROM Author a 
	LEFT JOIN Grade g on a.GradeId = g.id
		where a.Id < 77
		ORDER BY a.Name 


SELECT a.Name, g.Name Grade, ge.Name Gender
	FROM Author a 
	LEFT JOIN Grade g on a.GradeId = g.id
	LEFT JOIN Gender ge on a.GenderId = ge.Id
		where a.Id < 77
		ORDER BY a.Name 

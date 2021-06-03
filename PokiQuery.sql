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


SELECT SUM(WordCount) TotalWordCount
	FROM Poem


SELECT MIN(CharCount) FewestCharacters
	FROM Poem

SELECT COUNT(g.Id) Total3rdGraders
	FROM Author a
	LEFT JOIN Grade g on a.GradeId = g.Id
		where g.Name = '3rd Grade'

SELECT COUNT(g.Id) Total1st2nd3rdGraders
	FROM Author a
	LEFT JOIN Grade g on a.GradeId = g.Id
		where g.Name = '3rd Grade' or g.Name = '1st Grade' or g.Name = '2nd Grade'

SELECT COUNT(p.Id) Total4thGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 4

SELECT COUNT(p.Id) Total1stGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 1

		

SELECT COUNT(p.Id) Total2ndGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 2

		

SELECT COUNT(p.Id) Total3rdGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 3

		

SELECT COUNT(p.Id) Total4thGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 4

SELECT top 1 p.Title, p.WordCount
FROM Poem p
ORDER BY p.WordCount DESC

SELECT top 10 COUNT(p.id) AS "Poem Count", a.Name AS "Author"
FROM Author a
	LEFT JOIN Poem p ON a.Id = p.AuthorId
GROUP BY a.Name ORDER BY COUNT(p.id) DESC

SELECT MAX(p.WordCount) MostWords
	FROM Poem p


SELECT COUNT(p.AuthorId)
	FROM Poem p

SELECT COUNT(p.id) as "Poem Count", e.Name AS "Emotion"
FROM Poem p
	LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
	LEFT JOIN Emotion e ON pe.EmotionId = e.id
GROUP BY e.Name, e.id
HAVING e.Id = 3

SELECT COUNT(p.id) as "Poem Count"
FROM Poem p
	LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
	LEFT JOIN Emotion e ON pe.EmotionId = e.id
GROUP BY e.Name, e.id
HAVING e.Name IS NULL

SELECT top 1 COUNT(p.id) as "Joy Poem Count", g.Name AS "Grade"
FROM Poem p
	LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
	LEFT JOIN Emotion e ON pe.EmotionId = e.Id
	LEFT JOIN Author a ON p.AuthorId = a.Id
	LEFT JOIN Grade g ON a.GradeId = g.Id
GROUP BY e.Name, e.Id, g.Name
HAVING e.Name IS NOT NULL AND e.Id = 4
ORDER BY COUNT(p.Id) ASC

SELECT top 1 COUNT(p.id) as "Fear Poem Count", ge.Name AS "Gender"
FROM Poem p
	LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
	LEFT JOIN Emotion e ON pe.EmotionId = e.Id
	LEFT JOIN Author a ON p.AuthorId = a.Id
	LEFT JOIN Gender ge ON a.GenderId = ge.Id
WHERE e.Id = 3
GROUP BY ge.Name
ORDER BY COUNT(p.Id) ASC
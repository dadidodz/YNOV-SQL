SELECT genres.Name, COUNT(genres.GenreId)
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name, tracks.GenreId
SELECT genres.Name, COUNT(genres.GenreId) NumberOfTracks
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name, tracks.GenreId

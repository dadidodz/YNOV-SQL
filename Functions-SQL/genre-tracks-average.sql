SELECT genres.Name, avg(Milliseconds) AverageDuration
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name, tracks.GenreId
ORDER BY AverageDuration DESC 
SELECT artists.Name
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
GROUP BY artists.ArtistId, artists.Name
HAVING COUNT(albums.AlbumId) >= 4
ORDER BY artists.Name DESC
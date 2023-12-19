SELECT albums.AlbumId, artists.ArtistId, g.Name AS Title
FROM genres g
JOIN tracks ON g.GenreId = tracks.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE g.GenreId IN (
    SELECT g.GenreId
    FROM tracks t
    JOIN albums al ON t.AlbumId = al.AlbumId
    WHERE al.Title = g.Name
)
GROUP BY g.Name;
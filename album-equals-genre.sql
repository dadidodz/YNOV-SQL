SELECT albums.AlbumId, albums.ArtistId, genres.Name AS Title
FROM tracks
JOIN genres ON tracks.GenreId = genres.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE tracks.AlbumId = (SELECT albums.AlbumId
                         WHERE albums.Title = 'Pop')
GROUP BY albums.AlbumId;
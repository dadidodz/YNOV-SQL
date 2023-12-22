SELECT albums.AlbumId, albums.ArtistId, albums.Title AS Title
FROM tracks
JOIN genres ON tracks.GenreId = genres.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE albums.Title IN (SELECT genres.Name
                       FROM genres)
GROUP BY albums.AlbumId;
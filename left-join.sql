SELECT artists.Name, albums.Title AS AlbumTitle
FROM albums
LEFT JOIN artists ON albums.ArtistId = artists.ArtistId
LIMIT 100
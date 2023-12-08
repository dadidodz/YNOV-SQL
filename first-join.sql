SELECT albums.Title as AlbumsName, artists.Name as ArtistName
FROM albums
INNER JOIN artists
WHERE artists.ArtistId = albums.ArtistId
ORDER BY ArtistName ASC
LIMIT 100
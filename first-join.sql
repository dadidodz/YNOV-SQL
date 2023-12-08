SELECT albums.Title as AlbumsName, artists.Name as ArtistName
FROM albums
INNER JOIN artists
WHERE albums.ArtistId = artists.ArtistId
ORDER BY ArtistName ASC
LIMIT 100
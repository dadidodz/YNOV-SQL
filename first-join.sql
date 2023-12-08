SELECT albums.Title as AlbumsName, artists.Name as ArtistName
FROM albums
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
LIMIT 100
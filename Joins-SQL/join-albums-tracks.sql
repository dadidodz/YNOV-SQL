SELECT albums.Title AlbumName, tracks.Name TrackName, tracks.Milliseconds
FROM albums
JOIN tracks ON albums.AlbumId = tracks.AlbumId
ORDER BY tracks.Milliseconds ASC
LIMIT 50

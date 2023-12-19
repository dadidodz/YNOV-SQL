SELECT ar.Name ArtisteName, al.Title AlbumName ,t.Name TrackName, round(CAST((t.Bytes / 1000000.0) as Float), 2) as MegaBytes
FROM tracks t
JOIN albums al on t.AlbumId = al.AlbumId
JOIN artists ar on al.ArtistId = ar.ArtistId
WHERE al.AlbumId = (SELECT al.AlbumId WHERE al.Title = 'American Idiot')

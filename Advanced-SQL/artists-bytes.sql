SELECT ar.Name ArtistName, al.Title AlbumName ,t.Name TrackName, ROUND(t.bytes / 1000000.0, 2) || ' MB' as MegaBytes
FROM tracks t
JOIN albums al on t.AlbumId = al.AlbumId
JOIN artists ar on al.ArtistId = ar.ArtistId
WHERE al.AlbumId = (SELECT al.AlbumId WHERE al.Title = 'American Idiot')

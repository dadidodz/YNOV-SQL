SELECT albums.AlbumId, artists.ArtistId ,g.Name Title
FROM genres g
JOIN tracks ON g.GenreId = tracks.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE g.GenreId IN (SELECT g.GenreId
                    FROM tracks t
                    WHERE t.TrackId IN (SELECT t.TrackId
                                        FROM albums al
                                        WHERE al.Title = g.Name))
GROUP BY g.Name
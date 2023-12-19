SELECT g.Name
FROM genres g
WHERE g.GenreId IN (SELECT g.GenreId
                    FROM tracks t
                    WHERE t.TrackId IN (SELECT t.TrackId
                                        FROM albums al
                                        WHERE al.Title = g.Name))
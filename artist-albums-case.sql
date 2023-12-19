SELECT DISTINCT Name, count(albums.ArtistId) nbAlbums,
    CASE
        WHEN count(albums.ArtistId) = 1 THEN 'Unproductive'
        WHEN count(albums.ArtistId) > 1 AND count(albums.ArtistId) < 10 THEN 'Productive'
        ELSE 'Very productive'
    END AS "IsProductive"
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
GROUP BY Name
LIMIT 100
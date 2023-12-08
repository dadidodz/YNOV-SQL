SELECT DISTINCT tracks.Name as TrackName, playlists.Name as PlaylistName
FROM tracks
JOIN playlist_track ON tracks.TrackId = playlist_track.TrackId
JOIN playlists ON playlist_track.PlaylistId = playlists.PlaylistId
WHERE PlaylistName = 'TV Shows'
LIMIT 100
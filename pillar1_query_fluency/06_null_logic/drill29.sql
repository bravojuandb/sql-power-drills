/*
Artists and count of tracks, 
replacing NULL composer values with `'N/A'`.  


0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0


0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0


0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0
*/

SELECT
    ar.Name AS artist_name,
    COALESCE(t.Composer, 'N/A') AS composer_bucket,
    COUNT(t.TrackId) AS track_count
FROM Artist ar
LEFT JOIN Album al 
    ON al.ArtistId = ar.ArtistId
LEFT JOIN Track t  
    ON t.AlbumId  = al.AlbumId
GROUP BY ar.ArtistId, ar.Name, COALESCE(t.Composer, 'N/A')
ORDER BY ar.Name, track_count DESC;
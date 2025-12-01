/* Tracks → albums → artists (track + album + artist).

0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0

0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT 
    t.Name  AS track_name,
    a.Title AS album_title,
    art.Name AS artist_name
FROM Track AS t
JOIN Album AS a USING (AlbumId)
JOIN Artist AS art USING (ArtistId)
ORDER BY artist_name, album_title, track_name;
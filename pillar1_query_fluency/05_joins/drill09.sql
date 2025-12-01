/* 

Tracks → media_type → genre.

0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0

0|MediaTypeId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

0|GenreId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
*/

SELECT 
    t.Name AS track_name,
    m.Name AS media_type_name,
    g.Name AS genre_name
FROM Track AS t 
JOIN MediaType AS m USING (MediaTypeId)
JOIN Genre AS g USING (GenreId)
ORDER BY genre_name, media_type_name, track_name;
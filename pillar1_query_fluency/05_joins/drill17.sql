/*Tracks with genre = “Rock”.

0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0

0|GenreId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
*/

SELECT 
    t.Name AS track_name
FROM Track AS t 
INNER JOIN Genre AS g
ON t.GenreId = g.GenreId
WHERE g.Name LIKE '%Rock%'
ORDER BY t.Name;

/*
Use inner join instead left join:
- I only want tracks with a matching genre
- The WHERE clause already removes all NULL genres
- LEFT JOIN adds no benefit
*/
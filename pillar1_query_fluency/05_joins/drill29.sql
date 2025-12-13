/*
List artists and how many tracks belong to them. 

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

0|AlbumId|INTEGER|1||1      - JOINS TRACK TABLE
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0      - JOINS ARTIST TABLE

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
  ar.ArtistId,
  ar.Name AS artist_name,
  COUNT(t.TrackId) AS track_count
FROM Artist AS ar
LEFT JOIN Album AS al
  ON al.ArtistId = ar.ArtistId
LEFT JOIN Track AS t
  ON t.AlbumId = al.AlbumId
GROUP BY ar.ArtistId, ar.Name
ORDER BY track_count DESC;
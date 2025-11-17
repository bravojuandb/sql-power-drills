/*

Show each track's name, composer, and album ID.

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

SELECT Name, Composer, AlbumId
FROM Track;
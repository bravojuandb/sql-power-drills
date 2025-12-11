/*All albums that contain tracks with composer = “AC/DC”

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

SELECT DISTINCT
    a.Title AS album_title
FROM Album AS a 
INNER JOIN Track AS t 
    ON a.AlbumId = t.AlbumId 
WHERE t.Composer LIKE '%AC/DC%'
ORDER BY a.Title;

/*Notes:
- Album is the base table, because I'm asled for Album names
- I join Track, because I need to check tracks on a certain condition
- I filter on composer (this is the condition)
- DISTINCT ensures each album appears only once
*/
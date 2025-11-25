/* Average milliseconds per (genre_id, album_id) 

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
    GenreId,
    AlbumId,
    AVG(Milliseconds) AS avg_duration
FROM Track
GROUP BY GenreId, AlbumId
ORDER BY avg_duration;

/* Takeaways

- This query groups the Track table by (genre_id, album_id)
- Each group represents all tracks that share the same genre and album
- AVG(milliseconds) calculates the average duration *within each group*
- The output is one row per (genre_id, album_id) combination

*/
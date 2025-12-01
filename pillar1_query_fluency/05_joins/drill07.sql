/* Invoice items → tracks → albums.

0|InvoiceLineId|INTEGER|1||1
1|InvoiceId|INTEGER|1||0
2|TrackId|INTEGER|1||0
3|UnitPrice|NUMERIC(10,2)|1||0
4|Quantity|INTEGER|1||0

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

*/

SELECT 
    i.Quantity AS items,
    t.Name AS track_name,
    a.Title AS album_title
FROM InvoiceLine AS i 
JOIN Track AS t USING (TrackId)
JOIN Album AS a USING (AlbumId)
ORDER BY items DESC, track_name;

/* Albums with their artist names.

0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
*/

SELECT al.Title, ar.Name
FROM Album AS al
JOIN Artist AS ar USING (ArtistId)
ORDER BY ar.Name, al.Title;
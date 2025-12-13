/*

Artists with albums, even if album title is NULL 
(LEFT JOIN + IS NULL).

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0
*/


SELECT 
    ar.Name AS artist_name,
    al.Title AS album_title
FROM Artist AS ar
LEFT JOIN Album AS al
  ON ar.ArtistId = al.ArtistId;
  
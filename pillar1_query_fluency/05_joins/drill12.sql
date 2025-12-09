/* Artists and their albums 
(include artists with zero albums).

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0
*/

SELECT 
    artist.Name AS name,
    COALESCE(album.Title, 'No albums') AS album_title
FROM Artist AS artist
LEFT JOIN Album AS album 
USING (ArtistId)
ORDER BY name, album_title;


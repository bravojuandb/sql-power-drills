/*

Select album titles ordered alphabetically ascending.

0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0

*/

SELECT Title
FROM Album
ORDER BY Title;

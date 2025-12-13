/*
Artists whose name is NOT NULL 
(all rows, but practice syntax).

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
*/

SELECT ArtistId 
FROM Artist 
WHERE Name IS NOT NULL;
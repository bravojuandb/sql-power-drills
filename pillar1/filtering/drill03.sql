/* Order artists alphabetically by name.


0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/


SELECT Name
FROM Artist
ORDER BY Name;
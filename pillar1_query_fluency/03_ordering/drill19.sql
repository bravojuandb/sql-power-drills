/* Return the first 20 artists alphabetically.

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT Name 
FROM Artist 
ORDER BY Name 
LIMIT 20;
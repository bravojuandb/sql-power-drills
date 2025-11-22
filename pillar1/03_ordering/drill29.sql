/* Artists whose name contains 'The', ordered alphabetically, limit 12.

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/


SELECT Name
FROM Artist 
WHERE Name LIKE '%The%' COLLATE NOCASE
ORDER BY Name ASC
LIMIT 12;
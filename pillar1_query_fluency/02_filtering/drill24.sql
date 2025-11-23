/* Artists whose name contains 'the' (case-insensitive).

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT Name
FROM Artist 
WHERE LOWER(Name) LIKE '%the%';
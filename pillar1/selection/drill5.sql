/*

Return genre names sorted alphabetically ascending.

0|GenreId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT Name
FROM Genre
ORDER BY Name;
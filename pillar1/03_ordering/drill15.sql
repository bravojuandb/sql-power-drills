/* Artists ordered by name length, then alphabetically. 

0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT Name, LENGTH(Name) AS name_length
FROM Artist 
ORDER BY LENGTH(Name), Name;
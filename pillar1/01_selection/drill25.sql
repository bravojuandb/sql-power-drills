/*

Distinct track media types AS media

0|MediaTypeId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0

*/

SELECT DISTINCT(Name) AS media
FROM MediaType;
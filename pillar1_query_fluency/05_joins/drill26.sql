/*The 10 most purchased tracks (joins + GROUP BY).

0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0

0|InvoiceLineId|INTEGER|1||1
1|InvoiceId|INTEGER|1||0
2|TrackId|INTEGER|1||0
3|UnitPrice|NUMERIC(10,2)|1||0
4|Quantity|INTEGER|1||0

*/

SELECT
  t.TrackId,
  t.Name AS track_name,
  SUM(i.Quantity) AS units_sold
FROM Track AS t
JOIN InvoiceLine AS i
  ON t.TrackId = i.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY units_sold DESC
LIMIT 10;

/*
Query result:

2|Balls to the Wall|2
8|Inject The Venom|2
9|Snowballed|2
20|Overdose|2
32|Deuces Are Wild|2
48|Not The Doctor|2
66|Por Causa De Você|2
84|Welcome Home (Sanitarium)|2
161|Snowblind|2
162|Cornucopia|2

Note:
This query shows that Chinook dataset is synthetic
because track frequency is capped at 2, so the top 10 
represent tied maximums rather than dominant sellers.
*/

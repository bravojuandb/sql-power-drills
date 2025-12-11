/*
All invoice items for Rock tracks, 
showing for each line: the invoice ID, invoice date, 
invoice total, the track name, and the quantity sold.

(3-table join + filter).

0|InvoiceId|INTEGER|1||1  ----------------------
1|CustomerId|INTEGER|1||0                       |
2|InvoiceDate|DATETIME|1||0                     |
3|BillingAddress|NVARCHAR(70)|0||0              |
4|BillingCity|NVARCHAR(40)|0||0                 |
5|BillingState|NVARCHAR(40)|0||0                |
6|BillingCountry|NVARCHAR(40)|0||0              |
7|BillingPostalCode|NVARCHAR(10)|0||0           |
8|Total|NUMERIC(10,2)|1||0                      |
                                                |
0|InvoiceLineId|INTEGER|1||1                    |
1|InvoiceId|INTEGER|1||0  ---------------------
2|TrackId|INTEGER|1||0  ---------------
3|UnitPrice|NUMERIC(10,2)|1||0.        |
4|Quantity|INTEGER|1||0.               |
                                       |
0|TrackId|INTEGER|1||1  ---------------
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0
*/

SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    i.Total AS invoice_total,
    t.Name     AS track_name,
    il.Quantity,
    il.UnitPrice
FROM InvoiceLine AS il  ------- Contains both joining keys
INNER JOIN Track AS t
    ON il.TrackId = t.TrackId
INNER JOIN Invoice AS i
    ON il.InvoiceId = i.InvoiceId
WHERE t.GenreId = 1   -- Rock
ORDER BY i.InvoiceId, il.InvoiceLineId;
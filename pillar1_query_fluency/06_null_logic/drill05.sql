/*

Find invoice items where `unit_price` is NULL 
(should be none).

0|InvoiceLineId|INTEGER|1||1
1|InvoiceId|INTEGER|1||0
2|TrackId|INTEGER|1||0
3|UnitPrice|NUMERIC(10,2)|1||0
4|Quantity|INTEGER|1||0

*/

SELECT InvoiceLineId
FROM InvoiceLine 
WHERE UnitPrice IS NULL;
/* 

Invoice items → invoices → customers.

0|InvoiceLineId|INTEGER|1||1
1|InvoiceId|INTEGER|1||0     JOIN 1
2|TrackId|INTEGER|1||0
3|UnitPrice|NUMERIC(10,2)|1||0
4|Quantity|INTEGER|1||0     SELECT

0|InvoiceId|INTEGER|1||1     SELECT    JOIN 1
1|CustomerId|INTEGER|1||0     JOIN 2
2|InvoiceDate|DATETIME|1||0
3|BillingAddress|NVARCHAR(70)|0||0
4|BillingCity|NVARCHAR(40)|0||0
5|BillingState|NVARCHAR(40)|0||0
6|BillingCountry|NVARCHAR(40)|0||0
7|BillingPostalCode|NVARCHAR(10)|0||0
8|Total|NUMERIC(10,2)|1||0

0|CustomerId|INTEGER|1||1      JOIN 2
1|FirstName|NVARCHAR(40)|1||0    SELECT
2|LastName|NVARCHAR(20)|1||0     SELECT
3|Company|NVARCHAR(80)|0||0
4|Address|NVARCHAR(70)|0||0
5|City|NVARCHAR(40)|0||0
6|State|NVARCHAR(40)|0||0
7|Country|NVARCHAR(40)|0||0
8|PostalCode|NVARCHAR(10)|0||0
9|Phone|NVARCHAR(24)|0||0
10|Fax|NVARCHAR(24)|0||0
11|Email|NVARCHAR(60)|1||0
12|SupportRepId|INTEGER|0||0

*/


SELECT 
    il.Quantity,
    i.InvoiceId,
    c.FirstName || ' ' || c.LastName AS customer_name
FROM InvoiceLine AS il
JOIN Invoice AS i
  USING (InvoiceId)
JOIN Customer AS c
  USING (CustomerId)
ORDER BY i.InvoiceId, il.InvoiceLineId;
/* Invoices over 15 AND from 2022. 

0|InvoiceId|INTEGER|1||1
1|CustomerId|INTEGER|1||0
2|InvoiceDate|DATETIME|1||0
3|BillingAddress|NVARCHAR(70)|0||0
4|BillingCity|NVARCHAR(40)|0||0
5|BillingState|NVARCHAR(40)|0||0
6|BillingCountry|NVARCHAR(40)|0||0
7|BillingPostalCode|NVARCHAR(10)|0||0
8|Total|NUMERIC(10,2)|1||0

*/


SELECT InvoiceId, InvoiceDate 
FROM Invoice
WHERE Total > 15 
AND InvoiceDate >= '2022-01-01' 
AND InvoiceDate < '2023-01-01';

/* This method actually filters dates no matter the format they're stored.
It is way faster than just seraching for a string: LIKE '%2022%' */

/* 
Countries with more than 50 invoices, sorted by total revenue DESC.  

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

SELECT 
    BillingCountry, 
    COUNT(InvoiceId) AS invoice_count,
    SUM(Total) AS total_revenue
FROM Invoice 
GROUP BY BillingCountry
HAVING COUNT(InvoiceId) > 50
ORDER BY total_revenue DESC;

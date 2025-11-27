/* Sum invoice totals > 10 per billing_country.


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

/* “For each billing country, 
sum only the invoices whose individual Total > 5.”*/

SELECT BillingCountry, SUM(Total) AS total_spent
FROM Invoice
WHERE Total > 10
GROUP BY BillingCountry 
ORDER BY total_spent DESC;


/* “Calculate the total spending per country, then 
keep only the countries whose total spending is above 5.”*/

SELECT BillingCountry, SUM(Total) AS total_spent
FROM Invoice
GROUP BY BillingCountry 
HAVING SUM(Total) > 10
ORDER BY total_spent DESC;
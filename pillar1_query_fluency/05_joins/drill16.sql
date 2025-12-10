/*Customers with at least one invoice over 10.

0|CustomerId|INTEGER|1||1
1|FirstName|NVARCHAR(40)|1||0
2|LastName|NVARCHAR(20)|1||0
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

/*
version 1: this query returns one row
per qualifiying invoice*/

SELECT 
    c.CustomerId AS customer_id,
    c.FirstName AS name,
    i.InvoiceId AS invoice_id,
    i.Total AS total 
FROM Customer AS c 
INNER JOIN Invoice AS i 
    ON c.CustomerId = i.CustomerId
WHERE i.Total > 10
ORDER BY c.CustomerId;

/*
version 2: this query returns one row
per qualifiying customer*/

SELECT DISTINCT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer AS c
JOIN Invoice AS i
    ON c.CustomerId = i.CustomerId
WHERE i.Total > 10
ORDER BY c.CustomerId;


/*
version 3: this query returns one row
per qualifiying customer, by design, 
without relying in DISTINCT*/

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer AS c
WHERE EXISTS (
    SELECT 1
    FROM Invoice AS i
    WHERE i.CustomerId = c.CustomerId
      AND i.Total > 10
)
ORDER BY c.CustomerId;
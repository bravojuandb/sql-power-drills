/* Invoices with their customer first_name + last_name.

0|InvoiceId|INTEGER|1||1
1|CustomerId|INTEGER|1||0
2|InvoiceDate|DATETIME|1||0
3|BillingAddress|NVARCHAR(70)|0||0
4|BillingCity|NVARCHAR(40)|0||0
5|BillingState|NVARCHAR(40)|0||0
6|BillingCountry|NVARCHAR(40)|0||0
7|BillingPostalCode|NVARCHAR(10)|0||0
8|Total|NUMERIC(10,2)|1||0

0|CustomerId|INTEGER|1||1.  --- PRIMARY KEY 
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

*/

SELECT 
    i.InvoiceId, 
    c.FirstName || " " || c.LastName AS name 
FROM Invoice AS i
JOIN Customer AS c USING (CustomerId)
ORDER BY i.InvoiceId, name;

/* Key takeaway:

- With an INNER JOIN,
    I ONLY get the rows where the join key exists in both tables
    (the join condition is true for both sides, and not NULL).

- If a CustomerId is NULL on either side,
    or it doesn't find a matching CustomerId in the other table,
    that row disappears from the result.

- In the Customer table, CustomerId cannot be NULL
    because it is the PRIMARY KEY of that table.

- In the Invoice table, CustomerId COULD be missing (NULL)
    or could point to a non-existing customer,
    unless it is constrained, e.g.:
        FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
    and (optionally) also defined as NOT NULL,
    with foreign key enforcement enabled.

*/
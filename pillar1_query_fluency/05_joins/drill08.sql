/* 

Invoice → customer → employee (who supported the customer)

0|InvoiceId|INTEGER|1||1
1|CustomerId|INTEGER|1||0      *
2|InvoiceDate|DATETIME|1||0
3|BillingAddress|NVARCHAR(70)|0||0
4|BillingCity|NVARCHAR(40)|0||0
5|BillingState|NVARCHAR(40)|0||0
6|BillingCountry|NVARCHAR(40)|0||0
7|BillingPostalCode|NVARCHAR(10)|0||0
8|Total|NUMERIC(10,2)|1||0

0|CustomerId|INTEGER|1||1      *
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
12|SupportRepId|INTEGER|0||0 ------- This column is allowed to be NULL.

0|EmployeeId|INTEGER|1||1      *
1|LastName|NVARCHAR(20)|1||0
2|FirstName|NVARCHAR(20)|1||0
3|Title|NVARCHAR(30)|0||0
4|ReportsTo|INTEGER|0||0
5|BirthDate|DATETIME|0||0
6|HireDate|DATETIME|0||0
7|Address|NVARCHAR(70)|0||0
8|City|NVARCHAR(40)|0||0
9|State|NVARCHAR(40)|0||0
10|Country|NVARCHAR(40)|0||0
11|PostalCode|NVARCHAR(10)|0||0
12|Phone|NVARCHAR(24)|0||0
13|Fax|NVARCHAR(24)|0||0
14|Email|NVARCHAR(60)|0||0

*/

SELECT 
    i.InvoiceId,
    c.FirstName || ' ' || c.LastName AS customer_name,
    e.FirstName || ' ' || e.LastName AS employee_name
FROM Invoice AS i 
JOIN Customer AS c USING (CustomerId)
JOIN Employee AS e ON c.SupportRepId = e.EmployeeId
ORDER BY i.InvoiceId;

/* Note on using an INNER JOIN to Employee:

This query only shows invoices whose customer has a support rep:

If a customer has SupportRepId IS NULL, 
their invoices will disappear from the result.

To display even the customers that dont have a support rep
we must use a LEFT JOIN:

    LEFT JOIN Employee AS e 
        ON c.SupportRepId = e.EmployeeId
*/
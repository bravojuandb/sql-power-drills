# Chinook Datanase

## Tables

```
Album          Employee       InvoiceLine    PlaylistTrack
Artist         Genre          MediaType      Track        
Customer       Invoice        Playlist     
```

**Album Table**  

```
0|AlbumId|INTEGER|1||1
1|Title|NVARCHAR(160)|1||0
2|ArtistId|INTEGER|1||0
```

**Artist Table**  

```
0|ArtistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
```

**Customer Table**  

```
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
```

**Employee Table**

```
0|EmployeeId|INTEGER|1||1
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
```

**Genre Table**

```
0|GenreId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
```

**Invoice Table**

```
0|InvoiceId|INTEGER|1||1
1|CustomerId|INTEGER|1||0
2|InvoiceDate|DATETIME|1||0
3|BillingAddress|NVARCHAR(70)|0||0
4|BillingCity|NVARCHAR(40)|0||0
5|BillingState|NVARCHAR(40)|0||0
6|BillingCountry|NVARCHAR(40)|0||0
7|BillingPostalCode|NVARCHAR(10)|0||0
8|Total|NUMERIC(10,2)|1||0
```

**InvoiceLine Table**
```
0|InvoiceLineId|INTEGER|1||1
1|InvoiceId|INTEGER|1||0
2|TrackId|INTEGER|1||0
3|UnitPrice|NUMERIC(10,2)|1||0
4|Quantity|INTEGER|1||0
```

**MediaType Table**

```
0|MediaTypeId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
```

**Playlist Table**

```
0|PlaylistId|INTEGER|1||1
1|Name|NVARCHAR(120)|0||0
```

**PlaylistTrack Table**

```
0|PlaylistId|INTEGER|1||1
1|TrackId|INTEGER|1||2
```

**Track Table**

```
0|TrackId|INTEGER|1||1
1|Name|NVARCHAR(200)|1||0
2|AlbumId|INTEGER|0||0
3|MediaTypeId|INTEGER|1||0
4|GenreId|INTEGER|0||0
5|Composer|NVARCHAR(220)|0||0
6|Milliseconds|INTEGER|1||0
7|Bytes|INTEGER|0||0
8|UnitPrice|NUMERIC(10,2)|1||0
```
